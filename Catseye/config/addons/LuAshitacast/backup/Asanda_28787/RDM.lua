local profile = {}

local fastCastValue = 0.42 -- 20% from traits 22% from gear listed in Precast set

local ninSJMaxMP = 565 -- The Max MP you have when /nin in your idle set
local whmSJMaxMP = 736 -- The Max MP you have when /whm in your idle set
local blmSJMaxMP = 662 -- The Max MP you have when /blm in your idle set

local blue_cotehardie = false
local dilation_ring = false
local dilation_ring_slot = "Ring2"

local Settings = {
    CurrentLevel = 0,
}

local sets = {
    Idle = {
        Main = "Earth Staff",
        Ammo = "Phtm. Tathlum",
        Head = "Dls. Chapeau +1",
        Neck = "Uggalepih Pendant",
        Ear2 = "Loquac. Earring",
        Body = "Dls. Tabard +1",
        Hands = "Dls. Gloves +1",
        Ring1 = "Astral Ring",
        Ring2 = "Astral Ring",
        Legs = "Crimson Cuisses",
        Feet = "Duelist's Boots",
    },
--[[    
    IdleALT = {
        Main = "Earth Staff",
        Ammo = "Hedgehog Bomb",
        Head = "Dls. Chapeau +1",
        Neck = "Jeweled Collar",
        Ear1 = "Merman's Earring",
        Ear2 = "Merman's Earring",
        Body = "Dst. Harness +1",
        Hands = "Dst. Mittens +1",
        Ring1 = "Jelly Ring",
        Ring2 = "Sattva Ring",
        Back = "Umbra Cape",
        Waist = "Warwolf Belt",
        Legs = "Crimson Cuisses",
        Feet = "Dst. Leggings +1",
    },
]]--
    IdleMaxMP = {
        Main = "Earth Staff",
        Ammo = "Phtm. Tathlum",
        Head = "Dls. Chapeau +1",
        Neck = "Uggalepih Pendant",
        Ear2 = "Loquac. Earring",
        Body = "Dls. Tabard +1",
        Hands = "Dls. Gloves +1",
        Ring1 = "Astral Ring",
        Ring2 = "Astral Ring",
        Legs = "Crimson Cuisses",
        Feet = "Duelist's Boots",
    },
    Resting_Priority = {
        Main = {"Iridal Staff"},
        Ear1 = "Relaxing Earring",
        Body = "Errant Hpl.",
        Waist = "Duelist's Belt",
        Legs = "Baron's Slops",
    },
    Town = {},
    Movement = {
        Head = "Dls. Chapeau +1",
        Legs = "Crimson Cuisses",
    },

    DT = {
        Main = "Earth Staff", -- 20
    },
    DTNight = {
        Main = "Earth Staff", -- 20
    },
    MDT = { -- Shell IV provides 23% MDT
        Main = "Earth Staff",
    },
    FireRes = { -- 145
        Main = "Water Staff", -- 20
    },
    IceRes = { -- 144
        Main = "Vulcan's Staff", -- 20
    },
    LightningRes = { -- 133
        Main = "Earth Staff", -- 20
    },
    EarthRes = { -- 144
        Main = "Wind Staff", -- 20
    },
    WindRes = { -- 138
        Main = "Aquilo's Staff", -- 20
    },
    WaterRes = { -- 137
        Main = "Thunder Staff", -- 20
    },
    Evasion = {},

    Precast = {
        Head =  "Wlk. Chapeau +1",--10
        Ear2 = "Loquac. Earring",--2
        Body = "Dls. Tabard +1",--10
        Waist = "Swift Belt",-- +4haste
    },
    Casting = { -- Default Casting Equipment when using Idle sets
        Head = "Dls. Chapeau +1",
    },
    SIRD = { -- 102% to Cap, used on Stoneskin, Blink, Aquaveil and Utsusemi casts
        Body =  "Warlock's Tabard", --10
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
        Head =  "Wlk. Chapeau +1",--10
        Ear2 = "Loquac. Earring",--2
        Body = "Dls. Tabard +1",--10
        Hands = "Dusk Gloves",--+3haste
        Waist = "Swift Belt",-- +4haste
        Feet = "Nashira Crackows",-- +1haste
    },
    ConserveMP = {
        Ear2 = "Magnetic Earring",
    },

    Hate = { -- Switches to this set when casting Sleep, Blind, Dispel and Bind if /hate is toggled on
    },
    Cheat_C3HPDown = {
    },
    Cheat_C4HPDown = {
    },
    Cheat_HPUp = {
    },

    Cure = {-- -enmity gear and MND gear
        Head = "Dls. Chapeau +1",
        Neck = "Promise Badge",
        Ear1 = "Novia Earring",
        Body = "Errant Hpl.",
        Hands = "Savage Gauntlets",
        Ring1 = "Saintly Ring",
        Ring2 = "Saintly Ring",
        Waist = "Duelist's Belt",
        Legs =  "Warlock's Tights",
        Back = "Red Cape",
        Legs = "Errant Slops",
        Feet = "Duelist's Boots",
    },
    Cursna = {
        Body = "Dls. Tabard +1",
        Legs = "Warlock's Tights",
    },

    Enhancing = {
        Neck = "Enhancing Torque",
        Hands = "Dls. Gloves +1",
        Legs =  "Warlock's Tights",
    },
    Stoneskin = {
        Head = "Dls. Chapeau +1",--3
        Neck = "Enhancing Torque",
        Body = "Errant Hpl.",--10
        Hands = "Dls. Gloves +1",
        Ring1 = "Saintly Ring",--2
        Ring2 = "Saintly Ring",--2
        Back = "Red Cape",--2
        Waist = "Duelist's Belt",--4
        Legs =  "Warlock's Tights",
        Feet = "Duelist's Boots",--4

    },
    Spikes = {
        Main = "Aquilo's Staff",
        Ammo = "Phtm. Tathlum",
        Head = "Wlk. Chapeau +1",
        Neck = "Enhancing Torque",
        Ear1 = "Novio Earring",
        Ear2 = "Moldavite Earring",
        Body = "Errant Hpl.",
        Hands = "Dls. Gloves +1",
        Ring1 = "Snow Ring",
        Ring2 = "Snow Ring",
        Back = "Red Cape",--2
        Legs = "Warlock's Tights",
        Feet = "Duelist's Boots",
    },

    Enfeebling = {
        Head = "Dls. Chapeau +1",
        Neck = "Enfeebling Torque",
        Body = "Wlk. Tabard +1",
        Legs = "Errant Slops",
    },
    EnfeeblingMND = {
        Hands = "Savage Gauntlets",--2
        Ring1 = "Saintly Ring",--2
        Ring2 = "Saintly Ring",--2
        Back = "Red Cape",--2
        Waist = "Duelist's Belt",--4
        Legs = "Errant Slops",--7
        Feet = "Duelist's Boots",--4
    },
    EnfeeblingINT = {
        Ammo = "Phtm. Tathlum",
        Ear1 = "Cunning Earring",
        Ear2 = "Cunning Earring",
        Hands = "Dls. Gloves +1",
        Ring1 = "Snow Ring",
        Ring2 = "Snow Ring",
        Waist = "Duelist's Belt",
        Back = "Red Cape",
        Legs = "Errant Slops",
        Feet = "Warlock's Boots",
    },
    EnfeeblingACC = {
        Ear2 = "Enfeebling Earring",
    },

    Divine = { -- Just using my Hate set here for Flash
    },
    Dark = {
        Ammo = "Phtm. Tathlum",
        Head =  "Wlk. Chapeau +1",
        Neck = "Black Neckerchief",
        Ear1 = "Cunning Earring",
        Ear2 = "Cunning Earring",
        Body = "Nashira Manteel",
        Hands = "Crimson Fng. Gnt.",
        Ring1 = "Snow Ring",
        Ring2 = "Snow Ring",
        Waist = "Duelist's Belt",
        Back = "Red Cape",
        Legs = "Duelist's Tights",
        Feet = "Nashira Crackows",
    },

    Nuke = {
        Head = {"Gambler's Chapeau"},
        Hands = {"Garrison Gloves +1"},
        Ring1 = {"Windurstian Ring"},
        Ring2 = {"Hermit's Ring"},
        Legs = {"Seer's Slacks"},
        Feet = {"Garrison boots +1"},
    },
    NukeACC = {
        Legs = "Duelist's Tights",
        Feet = "Nashira Crackows",
    },
    NukeDOT = {
        Ear1 = "Cunning Earring",
        Ear2 = "Cunning Earring",
        Hands = "Errant Cuffs",
        Back = "Red Cape",
        Legs = "Duelist's Tights",
        Feet = "Nashira Crackows",
    },

    Convert = { -- Type /vert to equip this set and /lock your gear at the same time. high MP 
    },
    ConvertOOR = { -- Out of Region Convert Set
    },

    Stun = {
        Ammo = "Phtm. Tathlum",
        Head =  "Wlk. Chapeau +1",
        Neck = "Black Neckerchief",
        Ear1 = "Cunning Earring",
        Ear2 = "Cunning Earring",
        Body = "Errant Hpl.",
        Hands = "Crimson Fng. Gnt.",
        Ring1 = "Snow Ring",
        Ring2 = "Snow Ring",
        Waist = "Duelist's Belt",
        Back = "Red Cape",
        Legs = "Duelist's Tights",
        Feet = "Nashira Crackows",

    },
    StunACC = { -- You can also type /csstun to equip this set and /lock your gear at the same time if you have a tinfoil hat.
        Ammo = "Phtm. Tathlum",
        Head =  "Wlk. Chapeau +1",
        Neck = "Black Neckerchief",
        Ear1 = "Cunning Earring",
        Ear2 = "Cunning Earring",
        Body = "Errant Hpl.",
        Hands = "Crimson Fng. Gnt.",
        Ring1 = "Snow Ring",
        Ring2 = "Snow Ring",
        Waist = "Duelist's Belt",
        Back = "Red Cape",
        Legs = "Duelist's Tights",
        Feet = "Nashira Crackows",

    },

    TP = {
        Head = 'Empress Hairpin',
        Neck = 'Focus Collar',
        Ear1 = 'Bone Earring',
        Ear2 = 'Opal Earring',
        Body = 'Savage Separates',
        Hands = 'Savage Gauntlets',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Sardonyx Ring',
        Legs = 'Savage Loincloth',
        Feet = 'Savage Gaiters',

--        Head = "Optical Hat",-- +10acc +10racc +10evasion
--        Neck = "Peacock Amulet",-- +10acc +10racc
--        Ear1 = "Brutal Earring",-- +5DA +1Store TP
--        Ear2 = "Ethereal Earring",-- +5attack +5evasion
--        Body = "Scorpion Harness",-- +10acc +10evasion
--        Hands = "Dusk Gloves",--+5attack +3haste
--        Ring1 = "Rajas Ring",-- +5dex +5str +5tp +5subtle
--        Ring2 = "Toreador's Ring",-- +7 acc
--        Back = "Amemet mantle",-- +1str +10att +10ratt
--        Waist = "Swift Belt",-- +3acc +4haste
--        Legs = "Crow Hose",-- +5evasion
--        Feet = "Bounding Boots",-- +3dex +3agi
    },
    TP_NIN = {
        --Main = "Martial Knife",
        --Sub = "Joyeuse",
        -- Main = "Justice Sword",
        -- Sub = "Justice Sword",
        -- Ear2 = "Stealth Earring",
        --Range = "",
        --Ammo = "Tiphia Sting",
        -- Ammo = "Virtue Stone",
    },
    WS = {
        Head = "Optical Hat",
        Ear2 = "Merman's Earring",
        Body = "Hydra Doublet",
        -- Body = "Assault Jerkin",
        Hands = "Tarasque Mitts +1",
        Ring1 = "Triumph Ring",
        -- Ring2 = "Flame Ring",
        Waist = "Warwolf Belt",
        Legs = "Feral Trousers",
        -- Legs = "Dusk Trousers",
        -- Legs = "Hydra Brais",
        Feet = "Rutter Sabatons",
    },
    WS_Soil = {
        Neck = "Soil Gorget",
    },
    WS_Spirits = {},
    WS_Energy = {
        Ear1 = "Cmn. Earring",
        Ear2 = "Cmn. Earring",
        Body = "Errant Hpl.",
        Hands = "Dvt. Mitts +1",
        Ring1 = "Aqua Ring",
        Ring2 = "Communion Ring",
        Back = "Prism Cape",
        Waist = "Penitent's Rope",
        Legs = "Errant Slops",
        Feet = "Errant Pigaches",
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},
    ['low_level'] = {
        Main = 'Degen',
        Sub = 'Degen',
        Head = 'Empress Hairpin',
        Neck = 'Focus Collar',
        Ear1 = 'Bone Earring',
        Ear2 = 'Opal Earring',
        Body = 'Savage Separates',
        Hands = 'Savage Gauntlets',
        Ring1 = 'Rajas Ring',
        Ring2 = 'Sardonyx Ring',
        Legs = 'Savage Loincloth',
        Feet = 'Savage Gaiters',
    },
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 3")
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1")

--    AshitaCore:GetChatManager():QueueCommand(-1, "/bind F9 //dia")
--    AshitaCore:GetChatManager():QueueCommand(-1, "/bind F10 //dia")
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmage = gFunc.LoadFile("common\\gcmage.lua")

profile.HandleAbility = function()
    -- You may add logic here
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
    local action = gData.GetAction()

    gFunc.EquipSet(sets.WS)

    if (action.Name == "Savage Blade") or (action.Name == "Vorpal Blade") or (action.Name == "Swift Blade") or (action.Name == "Evisceration") then
        gFunc.EquipSet(sets.WS_Soil)
    end

    if (action.Name == "Energy Drain") or (action.Name == "Energy Steal") then
        gFunc.EquipSet(sets.WS_Energy)
    end

    if (action.Name == "Spirits Within") then
        gFunc.EquipSet(sets.WS_Spirits)
    end
end

profile.OnLoad = function()
    gcmage.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmage.Unload()
end

profile.HandleCommand = function(args)
    gcmage.DoCommands(args)

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

    gcmage.DoDefault(sets, ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, nil)

    local player = gData.GetPlayer()
    if (blue_cotehardie and player.MP <= 40) then
        gFunc.Equip("Body", "Blue Cotehardie")
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmage.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, nil)

    local action = gData.GetAction()
    if (dilation_ring) then -- Haste is technically MP inefficient but I prefer to just always use it anyway
        if (action.Name == "Haste" or action.Name == "Refresh") then
            gFunc.Equip(dilation_ring_slot, "Dilation Ring")
        end
    end
end

return profile
