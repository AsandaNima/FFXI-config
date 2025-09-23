local profile = {}

local fastCastValue = 0.00 -- 0% from gear

-- Replace these with "" if you do not have them
local myochin_kabuto = "Myochin Kabuto"
local saotome_kote = "Saotome Kote"
local saotome_haidate = "Saotome Haidate"

local sets = {
    Idle = {
--        Body = "Shm. Hara-Ate",
--        Legs = "Shm. Haidate",
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
        Waist = "Swift Belt",
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        Head = 'Destrier Beret',
        Neck = 'Focus Collar',
        Ear1 = { Name = 'Optical Earring', Augment = { [1] = 'DEX+1', [2] = 'HP+2' } },
        Body = 'Chocobo Shirt',
        Hands = 'Shade Mittens',
        Ring1 = 'Windurstian Ring',
        Ring2 = 'Warp Ring',
        Legs = 'Shade Tights',
        Feet = 'Bounding Boots',
    },
    TP_HighAcc = {
        Head = "Empress Hairpin",
        Neck = "Peacock Amulet",
        Ear1 = "Minuet Earring",
        Ear2 = "Beetle Earring",
        Body = "Shm. Hara-Ate",
        Hands = "Myochin Kote",
        --Hands = "Ryl.Sqr. Mufflers",
        Ring1 = "Rajas Ring",
        Ring2 = "Toreador's ring",
        Back = "Amemet Mantle",
        Waist = "Life Belt",
        Legs = "Shm. Haidate",
        Feet = "Bounding Boots",
    },

    WS = {
        Head = "Myochin Kabuto",
        Neck = "Spike Necklace",
        Ear1 = "Minuet Earring",
        Ear2 = "Beetle Earring",
        Body = "Savage Separates",
        Hands = "Enkelados's Brc.",
        Ring1 = "Rajas Ring",
        Ring2 = "Toreador's ring",
        Back = "Amemet Mantle",
        Waist = "Ryl.Kgt. Belt",
        Legs = "Myochin Haidate",
        Feet = "Savage Gaiters",
    },
    WS_Penta = {
        Head = "Myochin Kabuto",
        Neck = "Peacock Amulet",
        Ear1 = "Minuet Earring",
        Ear2 = "Beetle Earring",
        Body = "Scorpion Harness",
        Hands = "Enkelados's Brc.",
        Ring1 = "Rajas Ring",
        Ring2 = "San d'Orian ring",
        Back = "Amemet Mantle",
        Waist = "Life Belt",
        Legs = "Myochin Haidate",
        Feet = "Savage Gaiters",
    },

    WS_Kaiten = {},
    ['leveling'] = {
        Main = { Name = 'Katayama', Augment = { [1] = '"Zanshin"+2', [2] = 'DMG:+5' } },
        Head = 'Destrier Beret',
        Neck = 'Focus Collar',
        Ear1 = { Name = 'Optical Earring', Augment = { [1] = 'DEX+1', [2] = 'HP+2' } },
        Body = 'Chocobo Shirt',
        Hands = 'Shade Mittens',
        Ring1 = 'Windurstian Ring',
        Ring2 = 'Warp Ring',
        Legs = 'Shade Tights',
        Feet = 'Bounding Boots',
    },
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 11")
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
    if (action.Name == "Meditate") then
        if (myochin_kabuto ~= "") then
            gFunc.Equip("Head", myochin_kabuto)
        end
        if (saotome_kote ~= "") then
            gFunc.Equip("Hands", saotome_kote)
        end
    elseif (action.Name == "Warding Cercle") then
        if (myochin_kabuto ~= "") then
            gFunc.Equip("Head", myochin_kabuto)
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
    if (action.Name == "Tachi: Kaiten") then
        gFunc.EquipSet(sets.WS_Kaiten)
    end
    if (action.Name == "Penta Thrust") then
        gFunc.EquipSet(sets.WS_Penta)
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
    local third_eye = gData.GetBuffCount("Third Eye");

    gcmelee.DoDefault()
    gcmelee.DoDefaultOverride()
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))

    -- keep saotome haidate, if third eye buff is active
    if (third_eye == 1) then
        if (saotome_haidate ~= "") then
            gFunc.Equip("Legs", saotome_haidate)
        end
    end
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)
end

return profile
