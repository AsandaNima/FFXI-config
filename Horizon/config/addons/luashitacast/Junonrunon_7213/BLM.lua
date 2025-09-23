local profile = {}

local fastCastValue = 0.08 -- 4% from gear listed in Precast set

local ninSJNukeMaxMP = 709 -- The Max MP you have when /nin in your nuking set
local whmSJNukeMaxMP = 787 -- The Max MP you have when /whm in your nuking set
local rdmSJNukeMaxMP = 768 -- The Max MP you have when /rdm in your nuking set

local warlocks_mantle = false -- Don't add 2% to fastCastValue to this as it is SJ dependant
local republic_circlet = false

local opuntia_hoop = false
local opuntia_hoop_slot = "Ring1"

local sets = {
    Idle = {
        Main = "Terra's Staff",
        Body = "Sorcerer's Coat",
    },
    IdleALT = {},
    IdleMaxMP = {
        Main = "Terra's Staff",
        Ammo = "Hedgehog Bomb",

        Head = "Wizard's Petasos",
        Neck = "Uggalepih Pendant",
        Ear2 = "Loquac. Earring",

        Body = "Sorcerer's Coat",
        Hands = "Sorcerer's Gloves",
        Ring1 = "Astral Ring",
        Ring2 = "Astral Ring",

        Waist = "Sorcerer's Belt",
        Legs = "Wizard's Tonban",
        Feet = "Rostrum Pumps",
    },
    Resting = {
        Main = "Pluto's Staff",
        Ear1 = "Relaxing Earring",
        Body = "Errant Hpl.",
        Legs = "Baron's Slops",
    },
    Town = {
    },
    Movement = {
        Feet = "Herald's Gaiters",
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
        Main = "Auster's Staff", -- 20
    },
    WindRes = {
        Main = "Aquilo's Staff", -- 20
    },
    WaterRes = {
        Main = "Jupiter's Staff", -- 20
    },
    Evasion = {},

    Precast = {
        Ear2 = "Loquac. Earring",--2 hase
        Body = "Nashira Manteel",
        Waist = "Swift Belt",--+ 4haste
        Feet = "Rostrum Pumps",--2 haste
    },
    Casting = { --SIRD?
        Waist = "Sorcerer's Belt",
        Feet = "Wizard's Sabots",
    },
    SIRD = { -- 102% to Cap, used on Stoneskin, Blink, Aquaveil and Utsusemi casts
        Waist = "Sorcerer's Belt",    
        Feet = "Wizard's Sabots",
    },
    Yellow = { -- This will override Precast if /lag is turned on or the spell casting time is too short. e.g. Tier 1: "Stone"
        Ear1 = "Loquac. Earring",
        Ring1 = "Astral Ring",
        Ring2 = "Astral Ring",
        Feet = "Rostrum Pumps",
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
        Ear1 = "Loquac. Earring",
        Body = "Nashira Manteel",
        Waist = "Swift Belt", -- 4
        Feet = "Nashira Crackows", -- 1
    },
    ConserveMP = {
        Body = "Igqira Weskit",
    },

    Cure = {
    },
    Cursna = {
    },

    Enhancing = {
        Main = "Kirin's Pole",

        Neck = "Enhancing Torque",

        Body = "Errant Hpl.",
        Hands = "Savage Gauntlets",
        Ring1 = "Saintly Ring",
        Ring2 = "Saintly Ring",

        Back = "Rainbow Cape",
        Waist = "Friar's rope",
        Legs = "Errant Slops",
        Feet = "Rostrum Pumps",
    },
    Stoneskin = {
        Neck = "Stone Gorget",
    },
    Spikes = {
        Main = "Kirin's Pole",
        Ammo = "Phtm. Tathlum",
        Neck = "Enhancing Torque",
        Ear1 = "Novio Earring",
        Ear2 = "Moldavite Earring",
        Body = "Errant Hpl.",
        Ring1 = "Snow Ring",
        Ring2 = "Snow Ring",
        Waist = "Sorcerer's Belt",
        Legs = "Errant Slops",
    },

    Enfeebling = {
        Head = "Sorcerer's Petas.",
        Neck = "Enfeebling Torque",

        Body = "Wizard's Coat",
        Hands = "Savage Gauntlets",
        Ring1 = "Saintly Ring",
        Ring2 = "Saintly Ring",

        Back = "Rainbow Cape",
        Waist = "Friar's rope",
        Legs = "Errant Slops",
        Feet = "Rostrum Pumps",

    },
    EnfeeblingMND = {
        Head = "Sorcerer's Petas.",
        Neck = "Enfeebling Torque",

        Body = "Wizard's Coat",
        Hands = "Savage Gauntlets",
        Ring1 = "Saintly Ring",
        Ring2 = "Saintly Ring",

        Back = "Rainbow Cape",
        Waist = "Friar's rope",
        Legs = "Errant Slops",
        Feet = "Rostrum Pumps",
    },
    EnfeeblingINT = {
        Ammo = "Phtm. Tathlum",

        Head = "Sorcerer's Petas.",
        Neck = "Enfeebling Torque",
        Ear1 = "Cunning Earring",
        Ear2 = "Cunning Earring",

        Body = "Wizard's Coat",
        Hands = "Errant Cuffs",
        Ring1 = "Snow Ring",
        Ring2 = "Snow Ring",

        Back = "Rainbow Cape",
        Waist = "Sorcerer's Belt",
        Legs = "Errant Slops",
        Feet = "Rostrum Pumps",
    },
    EnfeeblingACC = {
        Ear2 = "Enfeebling Earring",
    },

    Divine = {},
    Dark = {
        Ammo = "Phtm. Tathlum",
        Head = "Wizard's Petasos",
        Neck = "Prudence Torque",
        Ear1 = "Cunning Earring",
        Ear2 = "Cunning Earring",
        Body = "Nashira Manteel", 
        Hands = "Sorcerer's Gloves",
        Ring1 = "Snow Ring", 
        Ring2 = "Snow Ring", 
        Back = "Rainbow Cape",
        Waist = "Sorcerer's Belt", 
        Legs = "Wizard's Tonban", 
        Feet = "Rostrum Pumps",
    },
    Stun = {
        Ammo = "Phtm. Tathlum",
        Head = "Wizard's Petasos",
        Neck = "Prudence Torque",
        Ear1 = "Cunning Earring",
        Ear2 = "Cunning Earring",
        Body = "Errant Hpl.", 
        Hands = "Sorcerer's Gloves",
        Ring1 = "Snow Ring", 
        Ring2 = "Snow Ring", 
        Back = "Rainbow Cape",
        Waist = "Sorcerer's Belt", 
        Legs = "Wizard's Tonban", 
        Feet = "Rostrum Pumps",
    },

    Nuke = {
        Ammo = "Phtm. Tathlum",
        Head = "Wizard's Petasos",
        Neck = "Prudence Torque",
        Ear1 = "Moldavite Earring",
        Ear2 = "Cunning Earring",
        Body = "Igqira Weskit" ,
        Hands = "Zenith Mitts",
        Ring1 = "Snow Ring",
        Ring2 = "Snow Ring",
        Back = "Rainbow Cape",
        Waist = "Sorcerer's Belt",
        Legs = "Errant Slops",
        Feet = "Rostrum Pumps", 
    },
    NukeHNM = {
    },
    NukeACC = {
        Head = "Sorcerer's Petas.",
        Neck = "Elemental Torque",
        Hands = "Wzd. Gloves +1",
        Back = "Merciful Cape",
        Feet = "Nashira Crackows",
    },
    NukeDOT = {
        Main = "Kirin's Pole",
        Ammo = "Phtm. Tathlum",
        Head = "Wizard's Petasos",
        Neck = "Prudence Torque",
        Ear1 = "Cunning Earring",
        Ear2 = "Cunning Earring",
        Body = "Errant Hpl.", 
        Hands = "Sorcerer's Gloves",
        Ring1 = "Snow Ring", 
        Ring2 = "Snow Ring", 
        Back = "Rainbow Cape",
        Waist = "Sorcerer's Belt", 
        Legs = "Wizard's Tonban", 
        Feet = "Rostrum Pumps",
    },
    MB = {
        Hands = "Sorcerer's Gloves",
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 4")
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1")

    AshitaCore:GetChatManager():QueueCommand(-1, "/bind F9 //stun")
    AshitaCore:GetChatManager():QueueCommand(-1, "/bind F10 //dia")
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
    gcmage.DoDefault(ninSJNukeMaxMP, whmSJNukeMaxMP, nil, rdmSJNukeMaxMP)

    local spikes = gData.GetBuffCount("Blaze Spikes") + gData.GetBuffCount("Shock Spikes") + gData.GetBuffCount("Ice Spikes")
    if (opuntia_hoop and spikes > 0) then
        gFunc.Equip(opuntia_hoop_slot, "Opuntia Hoop")
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer()
    if (player.SubJob == "RDM" and warlocks_mantle) then
        gcmage.DoPrecast(fastCastValue + 0.02)
        gFunc.Equip("Back", "Warlock's Mantle")
    else
        gcmage.DoPrecast(fastCastValue)
    end
end

local ElementalDebuffs = T{ "Burn","Rasp","Drown","Choke","Frost","Shock" }

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJNukeMaxMP, whmSJNukeMaxMP, nil, rdmSJNukeMaxMP)

    local action = gData.GetAction()
    if (republic_circlet == true) then
        if (action.Skill == "Elemental Magic" and gcdisplay.GetCycle("Mode") == "Potency") then
            if (not ElementalDebuffs:contains(action.Name)) then
                if (conquest:GetInsideControl()) then
                    print(chat.header("GCMage"):append(chat.message("In Region - Using Republic Circlet")))
                    gFunc.Equip("Head", "Republic Circlet")
                end
            end
        end
    end
end

return profile
