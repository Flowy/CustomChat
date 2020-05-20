local CC = LibStub("AceAddon-3.0"):NewAddon("CustomChat", "AceConsole-3.0")
local GUI = LibStub("AceGUI-3.0")

local baseChannels = { General = true, GuildRecruitment = true, Trade = true, LocalDefense = true}
local channels = {
  s = "SAY",
  w = "WHISPER",
  r = "RAID",
  b = "BATTLEGROUND",
  bgl = "BATTLEGROUND_LEADER",
  e = "EMOTE",
  g = "GUILD",
  o = "OFFICER",
  p = "PARTY",
  pl = "PARTY_LEADER", 
  rl = "RAID_LEADER",  
  y = "YELL" 
}

function CC.ChannelIdent(channel)
  channel = channel or ""
  if channel:sub(1,1) == "c" then
    local num, name = GetChannelName(channel:sub(2))
    if num and name then
      return "CHANNEL", num..". "..name, num, name
    end
  elseif channels[channel] then 
    return channels[channel]
  elseif channel:sub(1,1) == "r" then
    return "RAID"
  end
  return "SAY"
end

function CC.Print(channel,author,text,status,lang)
  author = author:sub(1,1):upper() .. author:sub(2,12):lower()
  text = text:gsub("124","\124")
  local event, numname, num, name = CC.ChannelIdent(channel)
  local general = 0
  if name then
    if baseChannels[name:match("^[%a%d]*")] then general = 1 end
  end
  for i=1,10 do
    local temp = _G["ChatFrame"..i]
    if temp and ((general == 1 and event == "CHANNEL") or tContains(temp.messageTypeList,ChatTypeGroupInverted["CHAT_MSG_"..event]) or tContains(temp.channelList,name)) then
      ChatFrame_MessageEventHandler(temp,"CHAT_MSG_"..event,text,author == "Target" and UnitName("target") or author,event=="EMOTE" and "" or lang or "",numname or "","",event=="WHISPER" and "" or status or "",general,num or 0,name or "",0,0,author == "Target" and UnitGUID("target") or "",0)
    end
  end    
end

function CC.Slash(params)
  local channel, author, text = strsplit(":",params,3)
  if channel and author and text then
    CC.Print(channel,author,text)
  else
    if GUI.Widgets and GUI.Widgets.Window and GUI.Widgets.Window:IsVisible() then return end
    CC.Show()
  end
end

CC:RegisterChatCommand("cc",CC.Slash)

function GUI.Print()
  CC.Print(GUI.Widgets.Channel:GetValue(), GUI.Widgets.Name:GetText(), GUI.Widgets.Text:GetText(), GUI.Widgets.Status:GetValue(), GUI.Widgets.Language:GetValue() )
end


function CC.Show()
  local table = { GetChannelList() }
  for i=1,#table,3 do
    channels["c"..table[i]] = table[i+1]
  end
GUI.Widgets = {}
GUI.Widgets.Window = GUI:Create("Window")
GUI.Widgets.Window:SetTitle("Custom Chat")
GUI.Widgets.Window:SetLayout("Flow")
GUI.Widgets.Window:EnableResize(nil)
GUI.Widgets.Window:SetWidth(315)
GUI.Widgets.Window:SetHeight(253)

GUI.Widgets.Channel = GUI:Create("Dropdown")
GUI.Widgets.Channel:SetLabel("Channel")
GUI.Widgets.Channel:SetList( channels )

GUI.Widgets.Name = GUI:Create("EditBox")
GUI.Widgets.Name:SetWidth(160)
GUI.Widgets.Name:SetMaxLetters(12)
GUI.Widgets.Name:SetLabel("Author")

GUI.Widgets.Text = GUI:Create("MultiLineEditBox")
GUI.Widgets.Text:SetLabel("Text")
GUI.Widgets.Text:SetMaxLetters(255)
GUI.Widgets.Text:DisableButton(true)

GUI.Widgets.Status = GUI:Create("Dropdown")
GUI.Widgets.Status:SetLabel("Status")
GUI.Widgets.Status:SetWidth(80)
GUI.Widgets.Status:SetList( { [""] = "", AFK = "AFK", DND = "DND", GM = "GM" } )

GUI.Widgets.Language = GUI:Create("Dropdown")
GUI.Widgets.Language:SetLabel("Language")
GUI.Widgets.Language:SetWidth(120)
GUI.Widgets.Language:SetList( { [""] = "", Common = "Common", Orcish = "Orcish", Darnassian = "Darnassian", Dwarvish = "Dwarvish", Gnomish = "Gnomish", Draenei = "Draenei", Worgen = "Worgen", Troll = "Troll", Taurahe = "Taurahe", Gutterspeak = "Gutterspeak", Thalassian = "Thalassian", Goblin = "Goblin" } )

GUI.Widgets.Send = GUI:Create("Button")
GUI.Widgets.Send:SetWidth(80)
GUI.Widgets.Send:SetText("Print")
GUI.Widgets.Send:SetCallback("OnClick", GUI.Print)

GUI.Widgets.Window:AddChildren(GUI.Widgets.Channel,GUI.Widgets.Status,GUI.Widgets.Name,GUI.Widgets.Language,GUI.Widgets.Text,GUI.Widgets.Send)

end