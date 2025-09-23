local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local special_ammo = "Cmb.Cst. Arrow"

local Settings = {
    CurrentLevel = 0,
}

local sets = {
    Idle = {},
    IdleALT = {},
    Resting = {},
    Town = {},
    Movement = {
        Neck = "Pegasus Collar",
    },

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

    Preshot = {},

    TP_LowAcc_Priority = {
        Head = {"Empress hairpin", "Garrison Sallet +1", "Cmp. Eye Circlet"},
        Neck = {"Peacock Charm", "Pile Chain"},
        Ear1 = {"Optical Earring"},
        Ear2 = {"Outlaw's Earring"},

        Body = {"Garrison Tunica +1", "Leather Vest", "Mithran Separates"},
        Hands = {"Battle Gloves", "Mithran Gauntlets"},
        Ring1 = {'Archer\'s Ring'},
        Ring2 = {'Archer\'s Ring'},


        Back = {"Ram Mantle", "Traveler's Mantle"},
        Waist = {"Virtuoso Belt", "Tilt Belt", "Leather Belt"},
        Legs = {"Garrison Hose","Phl. Trousers", "Mithran Loincloth"},
        Feet = {"Leaping Boots", "Mithran Gaiters"},
    },
    TP_HighAcc_Priority = {},

    Ranged_ACC = {
        Head = "Empress Hairpin",
        Feet = 'Bounding Boots',
    },
    Ranged_ATK = {},

    EnmityDown = {},

    WS = {},
    WS_SlugShot = {},
    WS_Coronach = {},
    ['leveling'] = {
        Range = 'Bandit\'s Gun',
        Ammo = 'Bullet',
        Head = 'Empress Hairpin',
        Neck = 'Focus Collar',
        Ear1 = { Name = 'Optical Earring', Augment = { [1] = 'DEX+1', [2] = 'HP+2' } },
        Body = 'Mrc.Cpt. Doublet',
        Hands = 'Mrc.Cpt. Gloves',
        Ring1 = 'Echad Ring',
        Ring2 = 'Warp Ring',
        Legs = 'Mrc.Cpt. Hose',
        Feet = 'Bounding Boots',
    },
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 7")
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1")
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmelee = gFunc.LoadFile("common\\gcmelee.lua")

profile.HandleAbility = function()
    gFunc.EquipSet(sets.EnmityDown)

    local action = gData.GetAction()
    if (action.Name == "Scavenge") then
        gFunc.EquipSet(sets.Scavenge)
    elseif (action.Name == "Shadowbind") then
        gFunc.EquipSet(sets.Shadowbind)
    elseif (action.Name == "Camouflage") then
        gFunc.EquipSet(sets.Camouflage)
    elseif (action.Name == "Sharpshot") then
        gFunc.EquipSet(sets.Sharpshot)
    elseif (action.Name == "Eagle Eye Shot") then
        gFunc.EquipSet(sets.Ranged_ATK)

        local equipment = gData.GetEquipment()
        local unlimitedShot = gData.GetBuffCount("Unlimited Shot")
        if (unlimitedShot == 1) then
            gFunc.EquipSet(sets.UnlimitedShot)
        elseif (equipment.Ammo ~= nil and equipment.Ammo.Name == special_ammo) then
            print(chat.header("RNG"):append(chat.message("Action Canceled: Special Ammo Protection")))
            gFunc.CancelAction()
        end
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot)

    local equipment = gData.GetEquipment()
    local unlimitedShot = gData.GetBuffCount("Unlimited Shot")
    if (unlimitedShot == 0 and equipment.Ammo ~= nil and equipment.Ammo.Name == special_ammo) then
        print(chat.header("RNG"):append(chat.message("Action Canceled: Special Ammo Protection")))
        gFunc.CancelAction()
    end
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Ranged_ACC)

    local barrage = gData.GetBuffCount("Barrage")
    if (barrage == 1) then
        gFunc.EquipSet(sets.Barrage)
    end

    local unlimitedShot = gData.GetBuffCount("Unlimited Shot")
    if (unlimitedShot == 1) then
        gFunc.EquipSet(sets.UnlimitedShot)
    end
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS)

    local equipment = gData.GetEquipment()
    local unlimitedShot = gData.GetBuffCount("Unlimited Shot")
    if (unlimitedShot == 1) then
        gFunc.EquipSet(sets.UnlimitedShot)
    elseif (equipment.Ammo ~= nil and equipment.Ammo.Name == special_ammo) then
        print(chat.header("RNG"):append(chat.message("Action Canceled: Special Ammo Protection")))
        gFunc.CancelAction()
    end

    local action = gData.GetAction()
    if (action.Name == "Slug Shot" or action.Name == "Sidewinder") then
        gFunc.EquipSet(sets.WS_SlugShot)
    elseif (action.Name == "Coronach") then
        gFunc.EquipSet(sets.WS_Coronach)
    end
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
-- handle levelsync
local player = gData.GetPlayer()

local myLevel = player.MainJobSync;
if (myLevel ~= Settings.CurrentLevel) then
    gFunc.EvaluateLevels(profile.Sets, myLevel);
Settings.CurrentLevel = myLevel;
end

    gcmelee.DoDefault(sets)
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
