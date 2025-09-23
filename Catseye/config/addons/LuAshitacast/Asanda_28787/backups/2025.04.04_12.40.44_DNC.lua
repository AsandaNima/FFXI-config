local profile = {}

local fastCastValue = 0.00 -- 0% from gear

-- Replace these with "" if you do not have them
local Steps = T{"Quickstep", "Box Step", "Stutter Step"}

local dancer_tiara = "Dancer's Tiara"
local Samba = T{"Drain Samba", "Drain Samba II", "Drain Samba III", "Aspir Samba", "Aspir Samba II", "Haste Samba"}

local Waltz = T{"Curing Waltz", "Curing Waltz II", "Curing Waltz III", "Curing Waltz IV", "Divine Waltz", "Divine Waltz II", "Healing Waltz" }

local dancer_toe_shoes = "Dancer's Toe Shoes"
local dancer_etoile_tights = "Etoile Tights"
local Jigs = T{"Spectral Jig", "Chocobo Jig", "Chocobo Jig II"}

local sets = {
    Idle = {
        Hands= "Dancer's Bangles",
    },
    IdleALT = {},
    Resting = {},
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
        Head = "Walahra Turban",
        Body = "Rapparee Harness",
        Waist = "Swift Belt",
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        Head = "Walahra Turban",
        Neck = "Wivre Gorget",
        Ear1 = "Aesir Ear Pendant",
        Ear2 = "Suppanomimi",
        
        Body = "Rapparee Harness",
        Hands = "Dusk Gloves",
        Ring1 = "Rajas Ring",-- +5dex +5str +5tp +5subtle
        Ring2 = "Sniper's ring",

        Back = "Aesir Mantle",
        Waist = "Swift Belt",
        Legs = "Etoile Tights",
        Feet = "Bounding Boots",

    },
    TP_HighAcc = {
        Head = "Optical Hat",
        Neck = "Wivre Gorget",
        Ear1 = "Aesir Ear Pendant",
        Ear2 = "Suppanomimi",
        
        Body = "Rapparee Harness",
        Hands = "Dusk Gloves",
        Ring1 = "Sniper's ring",
        Ring2 = "Sniper's ring",

        Back = "Aesir Mantle",
        Waist = "Swift Belt",
        Legs = "Pln. Seraweels",
        Feet = "Bounding Boots",
    },

    WS = {
        Head = "Empress Hairpin",
        Neck = "Fotia Gorget",
        Ear1 = "Aesir Ear Pendant",
        Ear2 = "Suppanomimi",
        
        Body = "Assault Jerkin",
        Hands = "Etoile Bangles +1",
        Ring1 = "Rajas Ring",-- +5dex +5str +5tp +5subtle
        Ring2 = "Sniper's ring",

        Back = "Aesir Mantle",
        Waist = "Virtuoso Belt",
        Legs = "Denali Kecks",
        Feet = "Dancer's Toe Shoes",
    },

    WS_Evisceration = {
        Head = "Empress Hairpin",
        Neck = "Fotia Gorget",
        Ear1 = "Aesir Ear Pendant",
        Ear2 = "Suppanomimi",
        
        Body = "Assault Jerkin",
        Hands = "Etoile Bangles +1",
        Ring1 = "Rajas Ring",-- +5dex +5str +5tp +5subtle
        Ring2 = "Sniper's ring",

        Back = "Aesir Mantle",
        Waist = "Virtuoso Belt",
        Legs = "Denali Kecks",
        Feet = "Etoile Toe Shoes +1",
    },

    WS_Exenterator = {
        Head = "Empress Hairpin",
        Neck = "Fotia Gorget",
        Ear1 = "Aesir Ear Pendant",
        Ear2 = "Suppanomimi",
        
        Body = "Assault Jerkin",
        Hands = "Etoile Bangles +1",
        Ring1 = "Rajas Ring",-- +5dex +5str +5tp +5subtle
        Ring2 = "Sniper's ring",

        Back = "Aesir Mantle",
        Waist = "Virtuoso Belt",
        Legs = "Denali Kecks",
        Feet = "Bounding Boots",
    },

    Step_set = {
        Head = "Empress Hairpin",
        Neck = "Wivre Gorget",

        Body = "Scorpion Harness",
        Hands = "Dancer's Bangles",
        Ring1 = "Sniper's Ring",
        Ring2 = "Sniper's Ring",

        Waist = "Virtouso Belt",
        Legs = "Pln. Seraweels",
        Feet = "Etoile Toe Shoes +1",

    },

    Waltz_set = {
        Head = "Etoile Tiara +1",
        Ear1 = "Aesir Ear Pendant",
        Ear2 = "Suppanomimi",
        Body = "Dancer's Casaque",
        Hands = "Dancer's Bangles",
        Ring1 = "Moon Ring",
        Ring2 = "Aquamarine Ring",
        Legs = "Dancer's Tights",
    }
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 4")
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1")
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmelee = gFunc.LoadFile("common\\gcmelee.lua")

profile.HandleAbility = function()
    local action = gData.GetAction()
    --Steps
    if(Steps:contains(action.Name)) then
        gFunc.EquipSet(sets.Step_set)
    end
    --Samba
    if(Samba:contains(action.Name)) then
        if (dancer_tiara ~= "") then
            gFunc.Equip("Head", dancer_tiara)
        end
    end
    --Waltz
    if(Waltz:contains(action.Name)) then
        gFunc.EquipSet(sets.Waltz_set)
    end
    --Jig
    if(Jigs:contains(action.Name)) then
        if (dancer_toe_shoes ~= "") then
            gFunc.Equip("Feet", dancer_toe_shoes)
        end
        if (dancer_etoile_tights ~= "") then
            gFunc.Equip("Legs", dancer_etoile_tights)
        end
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
    -- You may add logic here
end

profile.HandleMidshot = function()
    -- You may add logic here
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS)

    local action = gData.GetAction()
    if (action.Name == "Evisceration") then
        gFunc.EquipSet(sets.WS_Evisceration)
    elseif (action.Name == "Shark Bite") then
        gFunc.EquipSet(sets.WS_SharkBite)
    elseif (action.Name == "Exenterator") then
        gFunc.EquipSet(sets.WS_Exenterator)
    end
    gcmelee.DoFenrirsEarring()
end

profile.OnLoad = function()
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
end

profile.HandleCommand = function(args)
    gcmelee.DoCommands(args)

    if (args[1] == "horizonmode") then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()

    gcmelee.DoDefault()
    gcmelee.DoDefaultOverride()
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))

end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)
end

return profile
