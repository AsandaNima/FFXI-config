local profile = {}

local fastCastValue = 0.04 -- 4% from gear not including carbuncles cuffs or evokers boots

local carbuncles_cuffs = false
local evokers_boots = false

local cureMP = 895 -- Cure set max MP

local sets = {
    Idle = {
        Main = "Terra's Staff",
        Ammo = "Hedgehog Bomb",
        Ear1 = "Loquac. Earring",
        Ear2 = "Relaxing Earring",
        Head = "Summoner's Horn",
        Neck = "Star Necklace",
        Body = "Summoner's Dblt.",
        Hands = "Summoner's Brcr.",
        Ring1 = "Astral Ring",
        Ring2 = "Evoker's Ring",
        Back = "Summoner's Cape",
        Waist = "Friar's Belt",
        Legs = "Summoner's Spats",
        Feet = "Summoner's Pgch.",
    },
    IdleALT = {},
    IdleMaxMP = {},
    Resting = {
        Main = "Pluto's Staff",
        Ear1 = "Relaxing Earring",
        Body = "Errant Hpl.",
        Legs = "Baron's Slops",
    },
    Town = {},
    Movement = {
    },

    DT = {
        Main = "Terra's Staff",
    },
    DTNight = {
        Main = "Terra's Staff",
    },
    MDT = { -- Shell IV provides 23% MDT
        Main = "Terra's Staff",
    },
    FireRes = {
        Main = "Neptune's Staff", -- 20
    },
    IceRes = {
        Main = "Vulcan's Staff", -- 20
    },
    LightningRes = {
        Main = "Terra's Staff", -- 20
    },
    EarthRes = {
    },
    WindRes = {
    },
    WaterRes = {
        Main = "Jupiter's Staff", -- 20
    },
    Evasion = {},

    Precast = {
        Ear1 = "Loquac. Earring",
        Waist = "Swift Belt",-- +4haste
        Feet = "Rostrum Pumps",
    },
    Casting = { -- Default Casting Equipment when using Idle sets
    },
    SIRD = { -- 102% to Cap, used on Stoneskin, Blink, Aquaveil and Utsusemi casts
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
        Ear1 = "Loquac. Earring",
        Waist = "Swift Belt",-- +4haste
        Feet = "Rostrum Pumps",
    },
    ConserveMP = {
    },

    Cure = {
    },
    Cursna = {
        -- Back = "Altruistic Cape",
    },

    Enhancing = {
        Main = "Kirin's Pole",
    },
    Stoneskin = {
        -- Neck = "Stone Gorget",
    },
    Spikes = {},

    Enfeebling = {},
    EnfeeblingMND = {},
    EnfeeblingINT = {},
    EnfeeblingACC = {},

    Divine = {},
    Dark = {},

    Nuke = {},
    NukeACC = {},
    NukeDOT = {},

    LockSet1 = {
    },
    LockSet2 = {},
    LockSet3 = {},

    FallbackSub = { -- Used only when you do not have complete staff sets
    },

    BP_Delay = {
        Head = "Summoner's Horn",
        Legs = "Summoner's Spats",
        Ring2 = "Evoker's Ring",
        Ear1 = "Loquac. Earring",
        Ear2 = "Novia Earring",
        Body = "Evoker's Boublet",
        Hands = "Summoner's Brcr.",
        Feet = "Summoner's Pgch.",
    },

    BP = {
        Head = "Evoker's Horn",
        Ear1 = "Loquac. Earring",
        Ring2 = "Evoker's Ring",
        Hands = "Summoner's Brcr.",
        Legs = "Evoker's Spats",
        Feet = "Nashira Crackows",
    },
    BP_Magical = {
    },
    BP_Physical = {
    },
    BP_Hybrid = {
    },
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 9")
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 2")
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

local SmnSkill = T{"Shining Ruby","Glittering Ruby","Crimson Howl","Inferno Howl","Frost Armor","Crystal Blessing","Aerial Armor","Hastega II","Fleet Wind","Hastega","Earthen Ward","Earthen Armor","Rolling Thunder","Lightning Armor","Soothing Current","Ecliptic Growl","Heavenward Howl","Ecliptic Howl","Noctoshield","Dream Shroud","Altana's Favor","Reraise","Reraise II","Reraise III","Raise","Raise II","Raise III","Wind's Blessing"}
local SmnHealing = T{"Healing Ruby","Healing Ruby II","Whispering Wind","Spring Water"}
local SmnMagical = T{"Searing Light","Meteorite","Holy Mist","Inferno","Fire II","Fire IV","Meteor Strike","Conflag Strike","Diamond Dust","Blizzard II","Blizzard IV","Heavenly Strike","Aerial Blast","Aero II","Aero IV","Wind Blade","Earthen Fury","Stone II","Stone IV","Geocrush","Judgement Bolt","Thunder II","Thunder IV","Thunderstorm","Thunderspark","Tidal Wave","Water II","Water IV","Grand Fall","Howling Moon","Lunar Bay","Ruinous Omen","Somnolence","Nether Blast","Night Terror","Level ? Holy"}
local SmnEnfeebling = T{"Diamond Storm","Sleepga","Shock Squall","Slowga","Tidal Roar","Pavor Nocturnus","Ultimate Terror","Nightmare","Mewing Lullaby","Eerie Eye"}
local SmnHybrid = T{"Flaming Crush","Burning Strike"};

gcmage = gFunc.LoadFile("common\\gcmage.lua")

profile.HandleAbility = function()
    gcmage.DoAbility()
    gFunc.EquipSet("BP_Delay")
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
    -- You may add logic here
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
    local petAction = gData.GetPetAction()
    if (petAction ~= nil) then
        gFunc.EquipSet("BP")

        -- Era provides near zero gear options so almost all of these just default to the default BP set or Magical
        if (SmnSkill:contains(petAction.Name)) then
            -- Do Nothing
        elseif (SmnMagical:contains(petAction.Name)) then
            gFunc.EquipSet(sets.BP_Magical)
        elseif (SmnHybrid:contains(petAction.Name)) then
            gFunc.EquipSet(sets.BP_Hybrid)
        elseif (SmnHealing:contains(petAction.Name)) then
            -- Do Nothing
        elseif (SmnEnfeebling:contains(petAction.Name)) then
            gFunc.EquipSet(sets.BP_Magical)
        else
            gFunc.EquipSet(sets.BP_Physical)
        end
    else
        gcmage.DoDefault(nil, nil, nil, nil)
    end
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmage.DoPrecast(fastCastValue)

    local action = gData.GetAction()
    if (action.Skill == "Summoning") then
        if (carbuncles_cuffs) then
            gFunc.Equip("Hands", "Carbuncle's Cuffs")
        end
        if (evokers_boots) then
            gFunc.Equip("Feet", "Evoker's Boots")
        end
    end
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, cureMP, cureMP, cureMP, cureMP)
end

return profile
