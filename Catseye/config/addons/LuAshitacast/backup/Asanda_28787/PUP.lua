--[[
    This is provided purely as an example template. Only very basic sanity testing has been done.
]]

local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local Maneuver = T{"Fire Maneuver", "Ice Maneuver", "Wind Maneuver", "Earth Maneuver", "Thunder Maneuver", "Water Maneuver", "Light Maneuver", "Dark Maneuver"}

local Settings = {
    CurrentLevel = 0,
}

local sets = {
    Idle = {
    },
    IdleALT = {},
    Resting = {
        Head = "Pup. Taj",
    },
    Town = {},
    Movement = {},

    DT = {},
    MDT = { -- Shell IV provides 23% MDT
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast = {},
    SIRD = { -- 102% to Cap
    },
    Haste = { -- Used for Utsusemi cooldown
        Hands = "Pantin Dastanas",

        Waist = "Swift Belt",
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc_Priority = {
        Range = {"Turbo Animator", "Animator"},

        --Head = {"Empress hairpin", "Garrison Sallet +1"},
        Head = {"Thurandaut Chapeau", "Garrison Sallet +1"},
        Neck = {"Peacock Charm", "Pile Chain"},
        Ear1 = {"Brutal earring", "Outlaw's Earring", "Optical Earring"},
        Ear2 = {"Wilderness Earring"},

        Body = {"Thurandaut Tabard","Pup. Tobe", "Garrison Tunica +1", "Rambler's Cloak", "Mithran Separates"},
        Hands = {"Thurandaut Gloves","Seer's Mitts", "Battle Gloves", "Mithran Gauntlets"},
        Ring1 = {"Rajas Ring", 'Archer\'s Ring', "Bastokan Ring"},
        Ring2 = {'Archer\'s Ring',"San d'Orian Ring"},


        Back = {"Exile's Cloak", "Ram Mantle", "Traveler's Mantle"},
        Waist = {"Virtuoso Belt", "Tilt Belt", "Lizard Belt", "Leather Belt"},
        Legs = {"Thurandaut Tights","Seer's Slacks", "Garrison Hose +1","Mithran Loincloth"},
        Feet = {"Thurandaut Boots","Savage Gaiters", "Garrison boots", "Mithran Gaiters"},
    },
    TP_HighAcc_Priority = {
        Head = "Optical Hat",
        Neck = "Wivre Gorget",
        Ear1 = "Aesir Ear Pendant",
        Ear2 = "Fang Earring",

        Body = "Pantin Tobe",
        Hands = "Pantin Dastanas",
        Ring1 = "Sniper's ring",
        Ring2 = "Sniper's ring",

        Back = "Aesir Mantle",
        Waist = "Swift Belt",
        Legs = "Pantin Churidars",
        Feet = "Pup. Babouches",

    },

    WS_Priority = {
        Head = "Thurandaut Chapeau",
        Neck = "Fotia Gorget",
        Ear1 = "Outlaw's Earring",
        Ear2 = "Wilderness Earring",

        Body = "Thurandaut Tabard",
        Hands = "Thurandaut Gloves",
        Ring1 = "Rajas Ring",-- +5dex +5str +5tp +5subtle
        Ring2 = 'Archer\'s Ring',


        Back = "Exile's Cloak",
        Waist = "Virtuoso Belt",
        Legs = "Thurandaut Tights",
        Feet = "Thurandaut Boots",
    },
    Maneuver = {
        Hands = "Pup. Dastanas",
        Neck = "Buffoon's Collar",
    },
    Repair = {
        Feet = "Pup. Babouches",
        Neck = "Buffoon's Collar",
    }
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 8")
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1")
end

gcmelee = gFunc.LoadFile("common\\gcmelee.lua")

profile.HandleAbility = function()
    local action = gData.GetAction()
    local PetAction = gData.GetPetAction()

--    gFunc.Echo(100 , action.Name)
    if(action.Name:contains("Maneuver")) then
        gFunc.EquipSet(sets.Maneuver)
    elseif (action.Name == "Repair") then
        gFunc.EquipSet(sets.Repair)
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
    -- You may add logic here
end

profile.HandlePreshot = function()
    -- You may add logic here
end

profile.HandleMidshot = function()
    -- You may add logic here
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS)
    gcmelee.DoFenrirsEarring()
    -- You may add logic here
end

profile.OnLoad = function()
    gcmelee.Load()
    profile.SetMacroBook()

    gcinclude.SetAlias(T{"dw"})
    local function createToggle()
        gcdisplay.CreateToggle("DW", false)
    end
    createToggle:once(2)
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(T{"dw"})
end

profile.HandleCommand = function(args)
    if (args[1] == "dw") then
        gcdisplay.AdvanceToggle("DW")
        gcinclude.Message("DW", gcdisplay.GetToggle("DW"))
    else
        gcmelee.DoCommands(args)
    end

    if (args[1] == "horizonmode") then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
-- handle levelsync
local player = gData.GetPlayer()

local myLevel = player.MainJobSync;
if (myLevel ~= Settings.CurrentLevel) then
    gFunc.EvaluateLevels(profile.Sets, myLevel);
Settings.CurrentLevel = myLevel;
end


    gcmelee.DoDefault(sets)

    if (gcdisplay.GetToggle("DW") and player.Status == "Engaged") then
        gFunc.EquipSet(sets.DW)
    end

    gcmelee.DoDefaultOverride()
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
    -- You may add logic here
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)
    -- You may add logic here
end

return profile
