local use_chaos_burgeonet_for_tp_during_souleater = false


local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local sets = {
    Idle = {
        Hands = "Runeist Mitons",
    },
    IdleALT = {},
    Resting = {},
    Town = {},
    Movement = {},

    DT = {
        Head = "Runeist Bandeau",
        Body = "Futhark Coat",
        Ring2 = "Jelly ring",
        Legs = "Runeist Trousers",
        Feet = "Futhark Boots",
    },
    MDT = { -- Shell IV provides 23% MDT
        Body = "Runeist Coat",
        Back = "Futhark Cape",
        Legs = "Runeist Trousers",
        Feet = "Runeist Bottes",
        

    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {}, -- Use this set for your zerg set. See README.md

    Precast = {},
    SIRD = { -- 102% to Cap
        Ear2 = "Magnetic Earring",
    },
    Haste = { -- Used for Utsusemi and Stun cooldown
        Head = "Walahra Turban",
        Legs = "Futhark Trousers",
        Feet = "Futhark Boots",
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        Head = "Walahra Turban",
        Neck = "Wivre Gorget",
        Ear1 = "Aesir Ear Pendant",

        Body = "Scorpion Harness",
        Hands = "Dusk Gloves",
        Ring1 = "Rajas Ring",
        Ring2 = "Sniper's Ring",

        Back = "Aesir Mantle",
        Waist = "Swift Belt",
        Legs = "Pln. Seraweels",
        Feet = "Futhark Boots",
    },
    TP_HighAcc = {
        Head = "Optical Hat",
        Neck = "Wivre Gorget",
        Ear1 = "Bone Earring",
        Body = "Scorpion Harness",
        Hands = "Dusk Gloves",
        Ring1 = "Sniper's Ring",
        Ring2 = "Sniper's Ring",
        Back = "Aesir Mantle",
        Waist = "Virtuoso Belt",
        Legs = "Pln. Seraweels",
        Feet = "Futhark Boots",
    },

    WS = {
        Head = "Futhark Bandeau",
        Neck = "Fotia Gorget",
        Ear1 = "Bone Earring",
        Body = "Assault Jerkin",
        Hands = "Dusk Gloves",
        Ring1 = "Rajas Ring",
        Ring2 = "Sun Ring",
        Back = "Aesir Mantle",
        Waist = "Swordbelt",
        Legs = "Futhark Trousers",
        Feet = "Savage Gaiters",
    },
    
    Enhancing = {
        Legs = "Futhark Trousers",
    },

    Regen = {
        Head = "Runeist Bandeau",
    },

    Pflug = {
        Feet = "Runeist Bottes",
    },

    Swipe = {
        Ear1 = "Moldavite Earring",
        Legs = "Denali Kecks",
    },

    SlightOfSword = {
        Hands = "Futhark Mitons",
    },

    Gambit = {
        Hands = "Runeist Mitons",
    },

    Valiance = {
        Body = "Runeist Coat",
    },

    Battuta = {
        Head = "Futhark Bandeau",
    },

    ['leveling'] = {
        Main = "Dst. Claymore",
        Sub = "Rose Strap",
        Ammo = "Optical Needle",
        Head = "Futhark Bandeau",
        Neck = "Wivre Gorget",
        Ear1 = "Fang Earring",
        Ear2 = "Magnetic Earring",
        Body = "Scorpion Harness",
        Hands = "Dusk Gloves",
        Ring1 = "Sniper\'s Ring",
        Ring2 = "Sniper\'s Ring",
        Back = "Aesir Mantle",
        Waist = "Swift Belt",
        Legs = "Galliard Trousers",
        Feet = "Futhark Boots",
    },
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 12")
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 2")
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmelee = gFunc.LoadFile("common\\gcmelee.lua")

profile.HandleAbility = function()
    local action = gData.GetAction()
    if (action.Name == "Pflug") then
        gFunc.EquipSet(sets.Pflug)
    elseif (action.Name == "Valiance" or action.Name == "Vallation") then
        gFunc.EquipSet(sets.Valiance)
    elseif (action.Name == "Swipe" or action.Name == "Lunge") then
        gFunc.EquipSet(sets.Swipe)
    elseif (action.Name == "Gambit") then
        gFunc.EquipSet(sets.Gambit)
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

    local action = gData.GetAction()
    -- Assumes you are using Evasion set as your zerg set.
    if (gcdisplay.IdleSet == "Evasion") then
        gFunc.EquipSet(sets.Evasion)
    end

    local souleater = gData.GetBuffCount("Souleater")
    if (souleater > 0) then
        gFunc.EquipSet(sets.SoulEater)
    end

    gcmelee.DoFenrirsEarring()
end

profile.OnLoad = function()
    gcmelee.Load()
    profile.SetMacroBook()
    -- You may add logic here
end

profile.OnUnload = function()
    gcmelee.Unload()
    -- You may add logic here
end

profile.HandleCommand = function(args)
    gcmelee.DoCommands(args)

    if (args[1] == "horizonmode") then
        profile.HandleDefault()
    end
    -- You may add logic here
end

profile.HandleDefault = function()
    gcmelee.DoDefault()

    local player = gData.GetPlayer()
    local souleater = gData.GetBuffCount("Souleater")
    if (souleater > 0 and player.Status == "Engaged" and use_chaos_burgeonet_for_tp_during_souleater) then
        gFunc.EquipSet(sets.SoulEater)
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

    local action = gData.GetAction()
    if (action.Skill == "Enhancing Magic") then
        gFunc.EquipSet(sets.Enhancing)
        if string.contains(spell.Name, "Regen") then
            gFunc.EquipSet(sets.Regen)
        end
    end
end

return profile
