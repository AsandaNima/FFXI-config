local profile = {}

local fastCastValue = 0.15 -- 0% from gear

-- Replace these with "" if you do not have them
local myochin_kabuto = "Myn. Kabuto +1"
local saotome_kote = "Saotome Kote"
local saotome_haidate = "Saotome Haidate"

local sets = {
    Idle = {
--        Body = "Shm. Hara-Ate",
            Hands = "Hachiman Kote",
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
        Hands = "Dusk Gloves",--3
        Waist = "Swift Belt",--4
        Legs = "Byakko's Haidate",--5
        Feet = "Fuma Sune-Ate",--3
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {--need 13 with 4 merits
        Head = "Optical Hat",
        Neck = "Justice Torque",
        Ear1 = "Brutal Earring",-- +1TP
        Ear2 = "Ethereal Earring",
        --Body = "Shm. Hara-Ate",-- +9tp
        Body = "Haubergeon",
        --Hands = "Hachiman Kote",-- +8tp
        Hands = "Dusk Gloves",
        Ring1 = "Rajas Ring",-- +5tp
        Ring2 = "Toreador's ring",
        Back = "Amemet Mantle",
        Waist = "Swift Belt",
        --Legs = "Shm. Haidate",-- +6tp
        Legs = "Byakko's Haidate",
        Feet = "Hmn. Sune-Ate",-- +5tp
        --Feet = "Fuma Sune-Ate",
    },
    TP_HighAcc = {--need 13 with 4 merits
        Head = "Optical Hat",
        Neck = "Peacock Amulet",
        Ear1 = "Brutal Earring",-- +1TP
        Ear2 = "Ethereal Earring",
        --Body = "Shm. Hara-Ate",-- +9tp
        Body = "Haubergeon",
        --Hands = "Hachiman Kote",-- +8tp
        Hands = "Dusk Gloves",--+5attack +3haste
        Ring1 = "Rajas Ring",-- +5tp
        Ring2 = "Toreador's ring",
        Back = "Amemet Mantle",
        Waist = "Life Belt",
        --Legs = "Shm. Haidate",-- +6tp
        Legs = "Byakko's Haidate",
        Feet = "Hmn. Sune-Ate",-- +5tp
        --Feet = "Fuma Sune-Ate",
    },

    WS = {--need 11 
        Head = "Myn. Kabuto +1",
        Neck = "Justice Torque",
        Ear1 = "Brutal Earring",-- +1TP
        Ear2 = "Ethereal Earring",
        Body = "Kirin's Osode",
        Hands = "Enkelados's Brc.",
        Ring1 = "Rajas Ring",-- +5tp
        Ring2 = "Flame Ring",
        Back = "Amemet Mantle",
        Waist = "Warwolf Belt",
        Legs = "Myochin Haidate",
        --Feet = "Rutter Sabatons",
        Feet = "Hmn. Sune-Ate",-- +5tp
    },
    WS_Penta = {
        Head = "Optical Hat",
        Neck = "Peacock Amulet",
        Ear1 = "Brutal Earring",-- +1TP
        Ear2 = "Ethereal Earring",
        Body = "Haubergeon",
        Hands = "Enkelados's Brc.",
        Ring1 = "Rajas Ring",-- +5tp
        Ring2 = "Toreador's ring",
        Back = "Amemet Mantle",
        Waist = "Life Belt",
        Legs = "Myochin Haidate",
        --Feet = "Rutter Sabatons",
        Feet = "Hmn. Sune-Ate",-- +5tp
    },

    WS_Kaiten = {},
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
