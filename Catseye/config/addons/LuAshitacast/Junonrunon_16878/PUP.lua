--[[
    This is provided purely as an example template. Only very basic sanity testing has been done.
]]

local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local sets = {
    Idle = {
        Head = "Pantin Taj",
    },
    IdleALT = {},
    Resting = {
        Head = "Pup. Taj",
    },
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
        Hands = "Pantin Dastanas",

        Waist = "Swift Belt",
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        Head = "Walahra Turban",
        Neck = "Wivre Gorget",
        Ear1 = "Aesir Ear Pendant",
        Ear2 = "Fang Earring",

        Body = "Pantin Tobe",
        Hands = "Pantin Dastanas",
        Ring1 = "Rajas Ring",-- +5dex +5str +5tp +5subtle
        Ring2 = "Sniper's ring",

        Back = "Aesir Mantle",
        Waist = "Swift Belt",
        Legs = "Pantin Churidars",
        Feet = "Pup. Babouches",
    },
    TP_HighAcc = {
        Head = "Optical Hat",
        Neck = "Wivre Gorget",
        Ear1 = "Aesir Ear Pendant",
        Ear2 = "Fang Earring",

        Body = "Pantin Tobe",
        Hands = "Pantin Dastanas",
        Ring1 = "Sniper's ring",
        Ring2 = "Sniper's ring",

        Back = "Aesir Mantle",
        Waist = "Swift Belt",
        Legs = "Pantin Churidars",
        Feet = "Pup. Babouches",

    },

    WS = {
        Head = "Walahra Turban",
        Neck = "Fotia Gorget",
        Ear1 = "Aesir Ear Pendant",
        Ear2 = "Fang Earring",

        Body = "Plb. Khazagand",
        Hands = "Pantin Dastanas",
        Ring1 = "Rajas Ring",-- +5dex +5str +5tp +5subtle
        Ring2 = "Sniper's ring",

        Back = "Aesir Mantle",
        Waist = "Swift Belt",
        Legs = "Pln. Seraweels",
        Feet = "Pup. Babouches",
    },
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 1")
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1")
end

gcmelee = gFunc.LoadFile("common\\gcmelee.lua")

profile.HandleAbility = function()
    local action = gData.GetAction()
    if (action.Name == "Warcry") then
        gFunc.EquipSet(sets.Warcry)
    elseif (action.Name == "Provoke") then
        gFunc.EquipSet(sets.Provoke)
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
    gcmelee.DoFenrirsEarring()
    -- You may add logic here
end

profile.OnLoad = function()
    gcmelee.Load()
    profile.SetMacroBook()

    gcinclude.SetAlias(T{"dw"})
    local function createToggle()
        gcdisplay.CreateToggle("DW", false)
    end
    createToggle:once(2)
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(T{"dw"})
end

profile.HandleCommand = function(args)
    if (args[1] == "dw") then
        gcdisplay.AdvanceToggle("DW")
        gcinclude.Message("DW", gcdisplay.GetToggle("DW"))
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
    if (gcdisplay.GetToggle("DW") and player.Status == "Engaged") then
        gFunc.EquipSet(sets.DW)
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
    -- You may add logic here
end

return profile
