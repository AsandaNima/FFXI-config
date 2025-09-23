local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local parade_gorget = false

local hercules_ring = false
local hercules_ring_slot = "Ring1"

-- Replace these with "" if you do not have them
local gallant_leggings = "Gallant Leggings"
local valor_leggings = "Valor Leggings"

local Settings = {
    CurrentLevel = 0,
    }

local sets = {
    Idle = {
        Ammo = "Happy Egg",
        Head = "Gallant Coronet",
        Body = "Gallant Surcoat",
        Hands = "Gallant Gauntlets",
        Legs = "Gallant Breeches",
        Feet = "Gallant leggings" ,
    },
    IdleALT_Priority = {
        Ammo = "Happy Egg",
    },
    IdleDT_Priority = {
    },
    IdleALTDT = {
    },
    Resting = {
        Main = "Dark Staff",
        Ear1 = "Relaxing Earring",
    },
    Town = {
    },
    Movement = {
        Legs = "Crimson Cuisses",
    },

    DT = {
    },
    MDT = { -- Shell IV provides 23% MDT
    },
    FireRes = { -- 150
    },
    IceRes = { -- 152
    },
    LightningRes = { -- 151
    },
    EarthRes = { -- 156
    },
    WindRes = { -- 135
    },
    WaterRes = { -- 146
    },
    Evasion = {},

    Precast = {
        Ear1 = "Loquac. Earring",
        Legs = "Homam Cosciales",
    },
    SIRD = { -- 102% to Cap
    },
    Haste = {
    },
    Haste_Ichi = { -- Optional, provided here only if you wish to mix in SIRD or other stats over max haste
    },

    Hate = {
    },
    Hate_Flash = { -- Optional, provided here only if you wish to mix in haste or other stats over max +enmity
    },
    Cheat_C3HPDown = {
        Main = "Durandal",
        -- Sub = "Master Shield",
        Sub = "Palmerin's Shield",
        Range = "Lightning Bow +1",
        Ammo = "",
        Head = "Darksteel Cap +1",
        -- Head = "Faerie Hairpin", -- Add w/ Hydra Haubert
        Neck = "Willpower Torque", -- 5
        Ear1 = "Magnetic Earring", -- 8
        Ear2 = "Knightly Earring", -- 9
        Body = "Dst. Harness +1",
        Hands = "Dst. Mittens +1",
        -- Hands = "Hydra Moufles", -- Add w/ Hydra Haubert
        Ring1 = "Ether Ring",
        Ring2 = "Serket Ring",
        Back = "Boxer's Mantle",
        Waist = "Silver Obi +1", -- 8
        Legs = "Vlr. Breeches +1", -- 10
        Feet = "Mountain Gaiters", -- 5
    },
    Cheat_C3HPUp = {
        Main = "Apollo's Staff",
        Sub = "",
        Range = "Rosenbogen",
        Ammo = "",
        Head = "Aegishjalmr",
        Neck = "Harmonia's Torque",
        Ear1 = "Hospitaler Earring",
        Ear2 = "Hades Earring +1",
        Body = "Vlr. Surcoat +1",
        -- Body = { Name = "Hydra Haubert", Priority = -100 },
        Hands = { Name = "Hydra Moufles", Priority = -100 },
        Ring1 = "Bomb Queen Ring",
        Ring2 = "Sattva Ring",
        Back = "Valor Cape",
        Waist = "Warwolf Belt",
        Legs = { Name = "Hydra Brayettes", Priority = -100 },
        Feet = "Vlr. Leggings +1",
    },
    Cheat_C4HPDown = {
        Main = "Durandal",
        -- Sub = "Master Shield",
        Sub = "Palmerin's Shield",
        Range = "Lightning Bow +1",
        Ammo = "",
        Head = "Faerie Hairpin",
        Neck = "Willpower Torque", -- 5
        -- Neck = "Star Necklace", -- Add w/ Hydra Haubert
        Ear1 = "Magnetic Earring", -- 8
        Ear2 = "Knightly Earring", -- 9
        Body = "Dst. Harness +1",
        -- Body = "Hydra Haubert",
        Hands = "Hydra Moufles",
        Ring1 = "Ether Ring",
        Ring2 = "Serket Ring",
        Back = "Settler's Cape", -- Remove w/ Hydra Haubert
        Waist = "Silver Obi +1", -- 8
        Legs = "Hydra Brayettes",
        Feet = "Mountain Gaiters", -- 5
    },
    Cheat_C4HPUp = {
        Main = "Apollo's Staff",
        Sub = "",
        Range = "Rosenbogen",
        Ammo = "",
        Head = "Aegishjalmr",
        Neck = "Harmonia's Torque",
        Ear1 = "Hospitaler Earring",
        Ear2 = "Hades Earring +1",
        Body = "Vlr. Surcoat +1",
        Hands = "Vlr. Gauntlets +1",
        Ring1 = "Bomb Queen Ring",
        Ring2 = "Sattva Ring",
        Back = "Valor Cape",
        Waist = "Warwolf Belt",
        Legs = "Vlr. Breeches +1",
        Feet = "Vlr. Leggings +1",
    },

    LockSet1 = {
    },
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        Head = 'Eisenschaller',
        Neck = { Name = 'Armiger\'s Lace', Augment = { [1] = 'Accuracy+1', [2] = 'HP+2' } },
        Ear1 = 'Protect Earring',
        Ear2 = { Name = 'Optical Earring', Augment = { [1] = 'DEX+1', [2] = 'HP+2' } },
        Body = 'Eisenbrust',
        Hands = 'Eisenhentzes',
        Ring1 = 'Bastokan Ring',
        Ring2 = 'San d\'Orian Ring',
        Back = 'Traveler\'s Mantle',
        Waist = { Name = 'Plate Belt', Augment = { [1] = 'Accuracy+2', [2] = 'HP+10', [3] = 'Spell interruption rate down -8%' } },
        Legs = 'Eisendiechlings',
        Feet = 'Eisenschuhs',
    },
    TP_HighAcc = {},

    WS = {
    },
    WS_Spirits = {},

    Cover = {
        Head = "Gallant Coronet",
        Body = "Vlr. Surcoat +1",
    },
    Cure = {
        Neck = "Justice Badge",
    },
    Rampart = { -- Rampart gives VIT x2 damage shield in era
    },
    ShieldBash = {
        Ear2 = "Knightly Earring",
        Hands = "Vlr. Gauntlets +1",
    },
    ['upgrade'] = {
        Main = { Name = 'Bee Spatha', Augment = { [1] = 'MP+15', [2] = 'DEF+4' } },
        Sub = { Name = 'Clipeus', Augment = { [1] = 'Shield skill +3', [2] = 'HP+5' } },
        Range = 'Bamboo Fish. Rod',
        Ammo = 'Worm Lure',
        Head = 'Faceguard',
        Neck = { Name = 'Armiger\'s Lace', Augment = { [1] = 'Accuracy+1', [2] = 'HP+2' } },
        Ear1 = 'Protect Earring',
        Ear2 = { Name = 'Optical Earring', Augment = { [1] = 'DEX+1', [2] = 'HP+2' } },
        Body = { Name = 'Scale Mail', Augment = { [1] = 'DEF+3', [2] = 'HP+10' } },
        Hands = { Name = 'Guerilla Gloves', Augment = { [1] = 'MP+4', [2] = 'Attack+2', [3] = 'DEF+2', [4] = 'Pet: STR+1' } },
        Ring1 = 'Bastokan Ring',
        Ring2 = 'San d\'Orian Ring',
        Back = 'Traveler\'s Mantle',
        Waist = { Name = 'Plate Belt', Augment = { [1] = 'Accuracy+2', [2] = 'HP+10', [3] = 'Spell interruption rate down -8%' } },
        Legs = 'Scale Cuisses',
        Feet = 'Leaping Boots',
    },
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 5")
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1")

    AshitaCore:GetChatManager():QueueCommand(-1, "/bind F9 //shieldbash")
    AshitaCore:GetChatManager():QueueCommand(-1, "/bind F10 //holy")
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmelee = gFunc.LoadFile("common\\gcmelee.lua")

profile.HandleAbility = function()
-- handle levelsync
local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
    if (myLevel ~= Settings.CurrentLevel) then
    gFunc.EvaluateLevels(profile.Sets, myLevel);
    Settings.CurrentLevel = myLevel;
    end

    local action = gData.GetAction()
    if (action.Name == "Chivalry") then
        return
    end

    gFunc.EquipSet(sets.Hate)

    if (action.Name == "Holy Circle" and gallant_leggings ~= "") then
        gFunc.Equip("Legs", gallant_leggings)
    elseif (action.Name == "Rampart") then
        gFunc.EquipSet(sets.Rampart)
    elseif (action.Name == "Shield Bash" and valor_gauntlets ~= "") then
        gFunc.EquipSet(sets.ShieldBash)
    elseif (action.Name == "Sentinel" and valor_leggings ~= "") then
        gFunc.Equip("Legs", valor_leggings)
    elseif (action.Name == "Cover") then
        gFunc.EquipSet(sets.Cover)
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

    gcmelee.DoFenrirsEarring()

    local action = gData.GetAction()
    if (action.Name == "Spirits Within") then
        gFunc.EquipSet(sets.WS_Spirits)
    end
end

profile.OnLoad = function()
    gcmelee.Load()
    gcmelee.SetIsDPS(true)
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

local utsuBuffs = T{
    [66] = 1,
    [444] = 2,
    [445] = 3,
    [446] = 4,
}

profile.HandleDefault = function()
    gcmelee.DoDefault()

    local player = gData.GetPlayer()
    if (parade_gorget and player.HPP >= 85) then
        gFunc.Equip("Neck", "Parade Gorget")
    end

    if (hercules_ring and player.HPP <= 50) then
        gFunc.Equip(hercules_ring_slot, "Hercules' Ring")
    end

    if (player.SubJob == "NIN") then
        local function GetShadowCount()
            for buffId, shadowCount in pairs(utsuBuffs) do
                if (gData.GetBuffCount(buffId) > 0) then
                    return shadowCount
                end
            end

            return 0
        end
        if (GetShadowCount() == 0) then
            gFunc.EquipSet("IdleDT")
            if (gcdisplay.IdleSet == "Alternate") then gFunc.EquipSet("IdleALTDT") end
        end
    end

    local cover = gData.GetBuffCount("Cover")
    if (cover >= 1) then
        gFunc.EquipSet(sets.Cover)
    end

    gcmelee.DoDefaultOverride()
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local target = gData.GetActionTarget()
    local action = gData.GetAction()
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)

    if (action.Skill ~= "Ninjutsu") then
        local sentinel = gData.GetBuffCount("Sentinel")
        if (sentinel >= 1) then
            gFunc.EquipSet(sets.Haste)
        else
            gFunc.EquipSet(sets.Hate)
            if (action.Name == "Flash") then
                gFunc.EquipSet(sets.Hate_Flash)
            end
        end

        if (action.Skill == "Healing Magic") then
            gFunc.EquipSet(sets.Cure)
        end
    else
        if (action.Name == "Utusemi: Ichi") then
            gFunc.EquipSet(sets.Haste_Ichi)
        end
    end

    if (target.Name == me) then
        if (action.Name == "Cure III") then
            gFunc.InterimEquipSet(sets.Cheat_C3HPDown)
            gFunc.EquipSet(sets.Cheat_C3HPUp)
        elseif (action.Name == "Cure IV") then
            gFunc.InterimEquipSet(sets.Cheat_C4HPDown)
            gFunc.EquipSet(sets.Cheat_C4HPUp)
        end
    end
end

return profile
