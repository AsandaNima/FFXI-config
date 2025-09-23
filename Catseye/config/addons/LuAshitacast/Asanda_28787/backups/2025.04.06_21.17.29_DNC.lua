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
        Range = { Name = 'Rogetsurin', Augment = { [1] = 'VIT+1', [2] = 'HP+3', [3] = 'MP+3', [4] = 'Throwing skill +3' } },
        Head = 'Cmp. Eye Circlet',
        Neck = 'Pile Chain',
        Ear1 = 'Protect Earring',
        Ear2 = { Name = 'Optical Earring', Augment = { [1] = 'DEX+1', [2] = 'HP+2' } },
        Body = { Name = 'Leather Vest', Augment = { [1] = 'VIT+1', [2] = 'INT+1' } },
        Hands = { Name = 'Battle Gloves', Augment = { [1] = 'Potency of "Cure" effect received+1%', [2] = 'MP+3', [3] = 'HP+3', [4] = '"Store TP"+1', [5] = 'DEF+2' } },
        Ring1 = 'San d\'Orian Ring',
        Ring2 = 'Bastokan Ring',
        Back = 'Traveler\'s Mantle',
        Waist = { Name = 'Lizard Belt', Augment = { [1] = 'HP+5', [2] = 'HP recovered while healing +1', [3] = 'DEX+2' } },
        Legs = 'Leather Trousers',
        Feet = 'Leaping Boots',
    },
    TP_HighAcc = {
    },

    WS = {
        Range = { Name = 'Rogetsurin', Augment = { [1] = 'VIT+1', [2] = 'HP+3', [3] = 'MP+3', [4] = 'Throwing skill +3' } },
        Head = 'Cmp. Eye Circlet',
        Neck = 'Pile Chain',
        Ear1 = 'Protect Earring',
        Ear2 = { Name = 'Optical Earring', Augment = { [1] = 'DEX+1', [2] = 'HP+2' } },
        Body = { Name = 'Leather Vest', Augment = { [1] = 'VIT+1', [2] = 'INT+1' } },
        Hands = { Name = 'Guerilla Gloves', Augment = { [1] = 'MP+4', [2] = 'Attack+2', [3] = 'DEF+2', [4] = 'Pet: STR+1' } },
        Ring1 = 'San d\'Orian Ring',
        Ring2 = 'Bastokan Ring',
        Back = { Name = 'Lizard Mantle', Augment = 'STR+1' },
        Waist = { Name = 'Lizard Belt', Augment = { [1] = 'HP+5', [2] = 'HP recovered while healing +1', [3] = 'DEX+2' } },
        Legs = 'Leather Trousers',
        Feet = 'Leaping Boots',
        },

    WS_Evisceration = {
    },

    WS_Exenterator = {
    },

    Step_set = {
    },

    Waltz_set = {
    }
,
    ['update'] = {
        Main = 'Mercenary\'s Knife',
        Sub = 'Mercenary\'s Knife',
        Range = { Name = 'Rogetsurin', Augment = { [1] = 'VIT+1', [2] = 'HP+3', [3] = 'MP+3', [4] = 'Throwing skill +3' } },
        Head = 'Cmp. Eye Circlet',
        Neck = 'Pile Chain',
        Ear1 = 'Protect Earring',
        Ear2 = { Name = 'Optical Earring', Augment = { [1] = 'DEX+1', [2] = 'HP+2' } },
        Body = { Name = 'Leather Vest', Augment = { [1] = 'VIT+1', [2] = 'INT+1' } },
        Hands = { Name = 'Battle Gloves', Augment = { [1] = 'Potency of "Cure" effect received+1%', [2] = 'MP+3', [3] = 'HP+3', [4] = '"Store TP"+1', [5] = 'DEF+2' } },
        Ring1 = 'San d\'Orian Ring',
        Ring2 = 'Bastokan Ring',
        Back = 'Traveler\'s Mantle',
        Waist = { Name = 'Lizard Belt', Augment = { [1] = 'HP+5', [2] = 'HP recovered while healing +1', [3] = 'DEX+2' } },
        Legs = 'Leather Trousers',
        Feet = 'Leaping Boots',
    }}
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
