local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local special_ammo = "Cmb.Cst. Arrow"

local sets = {
    Idle = {
        Legs = "Crimson Cuisses",
    },
    IdleALT = {},
    Resting = {},
    Town = {},
    Movement = {
        Legs = "Crimson Cuisses",
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

    Preshot = {
        Head = "Hunter's Beret", ---5
		Body = "Scout's Jerkin", ---5
    },

    TP_LowAcc = {
        Head = "Optical Hat",
		Ear1 = "Drone Earring",
		Ear2 = "Drone Earring",
        Neck = "Peacock amulet",
		Hands = "Seiryu's Kote",
		Ring1 = "Rajas Ring",
		Ring2 = "Venerer Ring",
        Body = "Hunter's jerkin",
		Waist = "Swift Belt",
		Back = "Amemet mantle",
		Legs = "Byakko Haidate",
        Feet = "Hunter's Socks",
    },
    TP_HighAcc = {},

    Ranged_ACC = {
        Head = "Optical Hat",
        Neck = "Peacock amulet",
        Ear1 = "Drone Earring",
		Ear2 = "Drone Earring",


        Body = "Hunter's jerkin",
        Hands = "Seiryu's Kote",
        Ring1 = "Merman's Ring",
		Ring2 = "Merman's Ring",

		Back = "Amemet mantle",
        Waist = "Scout's Belt",
		Legs = "Scout's Braccae",
        Feet = "Hunter's Socks",
    },
    Ranged_ATK = {
        Head = "Hunter's Beret",
        Neck = "Spike Necklace",
		Ear1 = "Drone Earring",
		Ear2 = "Drone Earring",
       
        Body = "Kirin Osode",
		Hands = "Seiryu's Kote",
        Ring1 = "Merman's Ring",
		Ring2 = "Merman's Ring",
        
		Back = "Amemet mantle",
        Waist = "Scout's Belt",
		Legs = "Scout's Braccae",
        Feet = "Hunter's Socks",
    },

    EnmityDown = {
        Head = "Scout's Beret",
        Body = "Scout's Jerkin",
        Hands = "Sct. Bracers +1",
        Legs = "Scout's Braccae",
        Feet = "Scout's Socks",
    },

    Barrage = {
        Hands = "Htr. Bracers +1",
    },
    Scavenge = {
        Feet = "Hunter's Socks",
    },
    Shadowbind = {
        Hands = "Htr. Bracers +1",
    },
    Camouflage = {
        Body = "Hunter's Jerkin",
    },
    Sharpshot = {
        Legs = "Hunter's braccae",
    },
    UnlimitedShot = {},

    WS = {
        Head = "Hunter's Beret",
        Neck = "Peacock amulet",
        Ear1 = "Drone Earring",
		Ear2 = "Drone Earring",

		Body = "Kirin Osode",
		Hands = "Seiryu's Kote",
		Ring1 = "Rajas Ring",
		Ring2 = "Merman's Ring",

		Back = "Amemet mantle",
        Waist = "Scout's Belt",
		Legs = "Scout's Braccae",
        Feet = "Scout's Socks",
    },
    WS_SlugShot = {},
    WS_Coronach = {},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 10")
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
    gcmelee.DoDefault()
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
