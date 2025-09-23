local profile = {}

local fastCastValue = 0.17 -- 0% from gear

local ta_rogue_armlets = true

local sets = {
    Idle = {
        Hands = "Rogue's Armlets",
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
    Evasion = {
        Range = "Ungur Boomerang",-- +8evasion
        Head = "Optical Hat",-- +10evasion
        Neck = "Evasion Torque",-- +7evasion
		Ear1 = "Suppanomimi",-- +5evasion
		Ear2 = "Novia Earring",-- +7eva
		Body = "Scorpion Harness",-- +10evasion
        Hands = "War Gloves",-- +5evasion
		Back = "Boxer's Mantle",-- +10Eva
        Waist = "Scouter's Rope",-- +10evasion
        Legs = "Crow Hose",-- +5evasion
        Feet = "Dance Shoes",-- +6evasion
    },

    Precast = {},
    SIRD = { -- 102% to Cap
    },

    Haste = { -- Used for Utsusemi cooldown
        Head = "Homam Zucchetto",-- +3haste
        Body = "Rapparee Harness",-- +4haste
        Hands = "Homam Manopolas",-- +3haste
        Waist = "Swift Belt",-- +4haste
        Feet = "Homam Gambieras",-- +3haste
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
        Legs = "Denali Kecks",
        Feet = "Bounding Boots",
    },
    TP_HighAcc = {
        Head = "Optical Hat",
        Neck = "Wivre Gorget",
        Ear1 = "Aesir Ear Pendant",
        Ear2 = "Suppanomimi",
        
        Body = "Scorpion Harness",
        Hands = "Dusk Gloves",
        Ring1 = "Sniper's ring",
        Ring2 = "Sniper's ring",

        Back = "Aesir Mantle",
        Waist = "Swift Belt",
        Legs = "Denali Kecks",
        Feet = "Bounding Boots",
    },
    TP_NIN = {},

    WS = {
        Head = "Asn. Bonnet +1",
        Neck = "Fotia Gorget",
        Ear1 = "Aesir Ear Pendant",
        Ear2 = "Fang Earring",
        
        Body = "Assault Jerkin",
        Hands = "Dusk Gloves",
        Ring1 = "Rajas Ring",-- +5dex +5str +5tp +5subtle
        Ring2 = "Sniper's ring",

        Back = "Assassin's cape",
        Waist = "Virtuoso Belt",
        Legs = "Denali Kecks",
        Feet = "Bounding Boots",
    },
    WS_Evisceration = {
        Head = "Asn. Bonnet +1",
        Neck = "Fotia Gorget",

        Hands = "Rogue's Armlets",
        Ring1 = "Rajas Ring",-- +5dex +5str +5tp +5subtle

        Back = "Assassin's cape",
        Legs = "Denali Kecks",
        Feet = "Bounding Boots",
    },
    WS_SharkBite = {
        Head = "Asn. Bonnet +1",
        Neck = "Fotia Gorget",

        Hands = "Rogue's Armlets",
        Ring1 = "Rajas Ring",-- +5dex +5str +5tp +5subtle

        Back = "Assassin's cape",
        Legs = "Denali Kecks",
        Feet = "Bounding Boots",
    },

    WS_Exenterator = {
        Head = "Empress Hairpin",
        Neck = "Fotia Gorget",
        Ear1 = "Aesir Ear Pendant",
        Ear2 = "Suppanomimi",
        
        Body = "Assassin's Vest",
        Hands = "Dusk Gloves",
        Ring1 = "Rajas Ring",-- +5dex +5str +5tp +5subtle
        Ring2 = "Sniper's ring",

        Back = "Assassin's Mantle",
        Waist = "Virtuoso Belt",
        Legs = "Rogues's Culottes",
        Feet = "Bounding Boots",
    },

    SA = {
        Head = "Asn. Bonnet +1",-- +5dex

        Hands = "Rogue's Armlets",
        Ring1 = "Rajas Ring",-- +5dex +5str +5tp +5subtle

        Back = "Assassin's cape",
        Legs = "Denali Kecks",
        Feet = "Bounding Boots",
    },
    TA = {
        Body = "Assassin's Vest",
        
        Back = "Assassin's cape",
        Legs = "Rogue's Culottes",
        Feet = "Bounding Boots",
    },
    SATA = {
        Head = "Asn. Bonnet +1",--+5dex

        Body = "Assassin's Vest",--+4agi
        Hands = "Rogue's Armlets",--+3dex

        Back = "Assassin's cape",
        Legs = "Denali Kecks",
        Feet = "Bounding Boots",
    },

    Flee = {
        Feet = "Rogue's Poulaines",
    },
    Hide = {
        Body = "Rogue's Vest",
    },
    Steal = {
		Head = "Rogue's Bonnet",-- +1steal",
		Hands = "Rogue's Armlets",
        Ring2 = "Rogue's Ring",-- +3steal
		Legs = "Assassin's Culottes",-- +5steal
		Feet = "Rogue's Poulaines",-- +2steal
    },
    Mug = {
        Head = "Asn. Bonnet +1",-- +1mug
    },

    TH = {
        Hands = "Assassin's Armlets",-- +5chr +1TH
    },

    Ranged = {
		Head = "Optical Hat",-- +10acc +10racc +10evasion
        Neck = "Peacock Amulet",-- +10acc +10racc,
        Ear1 = "Drone Earring",-- +3agi
        Ear2 = "Drone Earring",-- +3agi
        Body = "Rapparee Harness",-- +2racc +4haste
        Ring1 = "Merman's Ring",
		Ring2 = "Merman's Ring",
        Waist = "Ryl.Kgt. Belt",-- +2dex +2agi
		Feet = "Homam Gambieras",-- +3haste +6acc +6racc
    },
    Ranged_INT = {},
    Drain = {
        Head = "Rogue's Bonnet",
        Ear1 = "Cunning Earring",
        Ear2 = "Cunning Earring",

        Body = "Baron's Saio",
        Hands = "Mst.Cst. Bracelets",
        Ring1 = "Snow Ring",
        Ring2 = "Overlord's Ring",

        Waist = "Ryl.Kgt. Belt",

    },
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 2");
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1");
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

local saOverride = 0
local taOverride = 0

gcmelee = gFunc.LoadFile("common\\gcmelee.lua")

profile.HandleAbility = function()
    local action = gData.GetAction()
    if (action.Name == "Flee") then
        gFunc.EquipSet(sets.Flee)
    elseif (action.Name == "Hide") then
        gFunc.EquipSet(sets.Hide)
    elseif (action.Name == "Steal") then
        gFunc.EquipSet(sets.Steal)
    elseif (action.Name == "Mug") then
        gFunc.EquipSet(sets.Mug)
    elseif (action.Name == "Sneak Attack") then
        saOverride = os.clock() + 2
    elseif (action.Name == "Trick Attack") then
        taOverride = os.clock() + 2
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
    -- You may add logic here
    if (gcdisplay.GetToggle("TH")) then
        gFunc.EquipSet(sets.TH)
    end

end

profile.HandleMidshot = function()
    --gFunc.EquipSet(sets.Ranged)


    if (gcdisplay.GetToggle("TH")) then
        gFunc.EquipSet(sets.TH)
    else
        gFunc.EquipSet(sets.Ranged)
    end
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

    local ta = gData.GetBuffCount("Trick Attack")
    if (ta > 0) or (os.clock() < taOverride) then
        if (ta_rogue_armlets) then
            gFunc.Equip("Hands", "Rogue's Armlets +1")
        end
    end

    gcmelee.DoFenrirsEarring()
end

profile.OnLoad = function()
    gcmelee.Load()
    profile.SetMacroBook()

    gcinclude.SetAlias(T{"th"})
    local function createToggle()
        gcdisplay.CreateToggle("TH", false)
    end
    createToggle:once(2)
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(T{"TH"})
end

profile.HandleCommand = function(args)
    if (args[1] == "th") then
        gcdisplay.AdvanceToggle("TH")
        gcinclude.Message("TH", gcdisplay.GetToggle("TH"))
    else
        gcmelee.DoCommands(args)
    end

    if (args[1] == "horizonmode") then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault()

    local player = gData.GetPlayer()
    if (player.SubJob == "NIN" and player.Status == "Engaged") then
        gFunc.EquipSet("TP_NIN")
    end

    gcmelee.DoDefaultOverride()

    if (gcdisplay.GetToggle("TH")) then
        gFunc.EquipSet(sets.TH)
    end

    local sa = gData.GetBuffCount("Sneak Attack")
    local ta = gData.GetBuffCount("Trick Attack")

    if (sa == 1 and ta == 1) or (os.clock() < saOverride and os.clock() < taOverride) then
        gFunc.EquipSet(sets.SATA)
    elseif (sa == 1) or (os.clock() < saOverride) then
        gFunc.EquipSet(sets.SA)
    elseif (ta == 1) or (os.clock() < taOverride) then
        gFunc.EquipSet(sets.TA)
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    local action = gData.GetAction()

    gcmelee.DoMidcast(sets)
    if(action.Name == "Drain") then
        gFunc.EquipSet(sets.Drain)
    end
end

return profile
