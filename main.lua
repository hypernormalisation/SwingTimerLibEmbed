local addon_name, mytab = ...

-- As we list LibClassicSwingTimerAPI as an external dependency in the TOC, this will
-- only run if LibClassicSwingTimerAPI is installed as a standalone library addon.
local SwingTimerLib = LibStub("LibClassicSwingTimerAPI", true)
print("Detected necessary addon!")

local SwingTimerInfo = function(hand)
    return SwingTimerLib:SwingTimerInfo(hand)
end

SLASH_TEST1 = "/test1"
SlashCmdList["TEST"] = function(hand)
    if not (hand ~= "mainhand" or hand ~= "offhand" or hand ~= "ranged") then
        print('Error: argument must be one of "mainhand", "offhand", or "ranged"!')
        return
    end
    local speed, expirationTime, lastSwing = SwingTimerInfo(hand)
    print("Speed       : "..speed)
    print("Expires     : "..expirationTime)
    print("Last swing  : "..lastSwing)
end
