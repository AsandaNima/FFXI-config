local profile = {}

local fastCastValue = 0.17 -- 0% from gear

local ta_rogue_armlets = true

local Settings = {
    CurrentLevel = 0,
}

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
    Evasion = {},

    Precast = {},
    SIRD = { -- 102% to Cap
    },

    Haste = { -- Used for Utsusemi cooldown
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc_Priority = {
        Head = {"Adhemar Bonnet", "Empress hairpin", "Garrison Sallet +1", "Cmp. Eye Circlet"},
        Neck = {"Peacock Charm", "Pile Chain"},
        Ear1 = {"Brutal Earring", "Outlaw's Earring"},
        Ear2 = {"Suppanomimi", "Optical Earring"},

        Body = {"Adhemar Jacket", "Garrison Tunica +1", "Leather Vest", "Mithran Separates"},
        Hands = {"Adhemar Wristbands", "Battle Gloves", "Mithran Gauntlets"},
        Ring1 = {"Rajas Ring", 'Archer\'s Ring'},
        Ring2 = {"Ulthalam's Ring", 'Archer\'s Ring'},


        Back = {"Assassin's Cape", "Ram Mantle", "Traveler's Mantle"},
        Waist = {"Ninurta's Sash", "Virtuoso Belt", "Tilt Belt", "Leather Belt"},
        Legs = {"Adhemar Kecks", "Garrison Hose","Phl. Trousers", "Mithran Loincloth"},
        Feet = {"Adhemar Gamashes", "Leaping Boots", "Mithran Gaiters"},
    },
    TP_HighAcc_Priority = {
    },
    TP_NIN = {},

    WS = {
        Head = "Adhemar Bonnet",
        Neck = "Fotia Gorget",
--        Ear1 = "Suppanomimi",
        Ear2 = "Outlaw's Earring",

        Body = "Adhemar Jacket",
        Hands = "Adhemar Wristbands",
        Ring1 = "Rajas Ring",
        Ring2 = "Sattva Ring",


        Back = "Assassin's Cape",
        Waist = "Warwolf Belt",
        Legs = "Adhemar Kecks",
        Feet = "Adhemar Gamashes",

    },
    WS_Evisceration = {
        Waist = "Ryl.Kgt. Belt",
        Feet = "Leaping Boots",
    },
    WS_SharkBite = {
        Waist = "Ryl.Kgt. Belt",
        Feet = "Leaping Boots",
    },

    WS_Exenterator = {
    },

    SA = {
    },
    TA = {
    },
    SATA = {
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
        Ear1 = "Bandit's Earring",
    },

    TH = {
        Hands = "Assassin's Armlets",-- +5chr +1TH
    },

    Ranged = {
    },
    Ranged_INT = {},
    Drain = {
    },
    ['upgrade'] = {
        Main = { Name = 'Beestinger', Augment = { [1] = 'Crit.hit rate+1', [2] = 'DMG:+3' } },
        Range = { Name = 'Crossbow', Augment = { [1] = 'AGI+3', [2] = 'DMG:+3' } },
        Head = 'Cmp. Eye Circlet',
        Neck = 'Pile Chain',
        Ear1 = { Name = 'Optical Earring', Augment = { [1] = 'DEX+1', [2] = 'HP+2' } },
        Body = { Name = 'Leather Vest', Augment = { [1] = 'VIT+1', [2] = 'INT+1' } },
        Hands = { Name = 'Battle Gloves', Augment = { [1] = 'Potency of "Cure" effect received+1%', [2] = 'MP+3', [3] = 'HP+3', [4] = '"Store TP"+1', [5] = 'DEF+2' } },
        Ring1 = 'Bastokan Ring',
        Ring2 = 'San d\'Orian Ring',
        Back = 'Traveler\'s Mantle',
        Waist = { Name = 'Leather Belt', Augment = { [1] = 'AGI+1', [2] = 'HP+10' } },
        Legs = 'Phl. Trousers',
        Feet = 'Leaping Boots',
    },
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 6");
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
            gFunc.Equip("Hands", "Adhemar Wristbands")
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
-- handle levelsync
local player = gData.GetPlayer()

local myLevel = player.MainJobSync;
if (myLevel ~= Settings.CurrentLevel) then
    gFunc.EvaluateLevels(profile.Sets, myLevel);
Settings.CurrentLevel = myLevel;
end


    gcmelee.DoDefault(sets)

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
