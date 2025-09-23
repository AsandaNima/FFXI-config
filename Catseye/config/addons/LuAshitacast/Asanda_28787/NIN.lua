local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local shinobi_ring = false
local shinobi_ring_slot = "Ring2"

local koga_tekko = true
local koga_tekko_plus_one = false

local uggalepih_pendant = true

local NinDebuffs = T{ "Kurayami: Ni", "Hojo: Ni", "Jubaku: Ichi", "Dokumori: Ichi" }
local DrkDebuffs = T{ "Bind", "Sleep", "Poison" }
local NinElemental = T{ "Hyoton: Ni", "Katon: Ni", "Huton: Ni", "Doton: Ni", "Raiton: Ni", "Suiton: Ni" }

-- Leave as "" if you do not have the staff.
local fire_staff = "Vulcan's Staff"
local earth_staff = "Earth Staff"
local water_staff = "Water Staff"
local wind_staff = "Auster's Staff"
local ice_staff = "Aquilo's Staff"
local thunder_staff = "Thunder Staff"

local ElementalStaffTable = {
    ["Fire"] = fire_staff,
    ["Earth"] = earth_staff,
    ["Water"] = water_staff,
    ["Wind"] = wind_staff,
    ["Ice"] = ice_staff,
    ["Thunder"] = thunder_staff,
}

local Settings = {
    CurrentLevel = 0,
}

local sets = {
    Idle = {},
    Idle_Regen = {
        Head = "Garrison Sallet +1",
    },
    Idle_Refresh = {},
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

    Hate = {},
    NinDebuff = {},
    NinElemental = {},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},
    TP_Priority = {
        Head = {"Empress hairpin", "Garrison Sallet +1", "Cmp. Eye Circlet"},
        Neck = {"Peacock Charm", "Pile Chain"},
        Ear1 = {"Optical Earring"},
        Ear2 = {"Outlaw's Earring"},

        Body = {"Garrison Tunica +1", "Leather Vest", "Mithran Separates"},
        Hands = {"Guerilla Gloves", "Mithran Gauntlets"},
        Ring1 = {"Archer's Ring", "Bastokan Ring"},
        Ring2 = {"Archer's Ring", "San d'Orian Ring"},


        Back = {"Ram Mantle", "Traveler's Mantle"},
        Waist = {"Virtuoso Belt", "Tilt Belt", "Leather Belt"},
        Legs = {"Garrison Hose","Phl. Trousers", "Mithran Loincloth"},
        Feet = {"Leaping Boots", "Mithran Gaiters"},
    },
    TP_HighAcc_Priority = {
    },
    WS = {},
}
profile.Sets = sets

gcdisplay = gFunc.LoadFile("common\\gcdisplay.lua");
gcinclude = gFunc.LoadFile("common\\gcinclude.lua");

profile.OnLoad = function()
gSettings.AllowAddSet = true;

    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 10")
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1")

gcinclude.Initialize();
end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
    gcinclude.HandleCommands(args);
end

profile.HandleAbility = function()
    gFunc.EquipSet(sets.Hate)
end

profile.HandleItem = function()
end

profile.HandlePreshot = function()
    -- You may add logic here
end

profile.HandleMidshot = function()
    -- You may add logic here
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS);

    local environment = gData.GetEnvironment()
    if (koga_tekko and (environment.Time < 6 or environment.Time >= 18)) then
        gFunc.Equip("Hands", "Koga Tekko")
    end
    if (koga_tekko_plus_one and (environment.Time < 7 or environment.Time >= 17)) then
        gFunc.Equip("Hands", "Kog. Tekko +1")
    end

end



profile.HandleDefault = function()
local environment = gData.GetEnvironment()
-- handle levelsync
local player = gData.GetPlayer()
local myLevel = player.MainJobSync;

    if (myLevel ~= Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, myLevel);
        Settings.CurrentLevel = myLevel;
    end

    if (player.Status == "Engaged") then
        if (shinobi_ring and player.HPP <= 75 and player.TP <= 1000) then
            gFunc.Equip(shinobi_ring_slot, "Shinobi Ring")
        end
        if (koga_tekko and (environment.Time < 6 or environment.Time >= 18)) then
            gFunc.Equip("Hands", "Koga Tekko")
        end
        if (koga_tekko_plus_one and (environment.Time < 7 or environment.Time >= 17)) then
            gFunc.Equip("Hands", "Kog. Tekko +1")
        end
    end

    gFunc.EquipSet(sets.TP);

gcinclude.CheckDefault();

end

profile.HandlePrecast = function(

)
end

profile.HandleMidcast = function()

    local action = gData.GetAction()
    if (action.Skill == "Ninjutsu") then
        if (NinDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.NinDebuff)
        elseif (NinElemental:contains(action.Name)) then
            gFunc.EquipSet(sets.NinElemental)
            if (action.MppAftercast < 51) and uggalepih_pendant then
                gFunc.Equip("Neck", "Uggalepih Pendant")
            end
            local staff = ElementalStaffTable[action.Element]
            if staff ~= "" then
                gFunc.Equip("Main", staff)
            end
        end
    elseif (action.Skill == "Enfeebling Magic") then
        if (DrkDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.Hate)
        end
    end
end

return profile
