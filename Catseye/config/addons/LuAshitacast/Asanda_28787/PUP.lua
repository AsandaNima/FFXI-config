local profile = {}
gcinclude = gFunc.LoadFile("common\\gcinclude.lua")

local Settings = {
	CurrentLevel = 0,
}

local sets = {
	Idle = {
		Ear1 = { "Pigeon Earring" },
		Ear2 = { "Pigeon Earring" },
	},
	Idle_Pet = {},
	Resting_Priority = {
		Head = "Pup. Taj",
	},
	Idle_Regen = {
		Feet = "Thurandaut Boots",
	},
	Idle_Refresh = {},
	Town = {},

	Dt = {},
	Pet_Dt_Priority = {},

	Pet_Only_Tp_Default_Priority = {
		Head = { "Entrancing Ribbon" },
		Legs = { "Herder's Subligar" },
		Ear2 = "Wilderness Earring",
	},
	Pet_Only_Tp_Hybrid_Priority = {},
	Pet_Only_Tp_Acc_Priority = {
		Head = { "Entrancing Ribbon" },
		Legs = { "Herder's Subligar" },
		Ear2 = "Wilderness Earring",
	},
	-- These profile.Sets will be for when both you and your pet are engaged
	Tp_Default_Priority = {
		Range = { "Turbo Animator", "Animator" },
		Ammo = { "Automat. Oil +2", "Automat. Oil +1", "Automation Oil" },

		Head = { "Thurandaut Chapeau", "Entrancing Ribbon", "Garrison Sallet +1" },
		Neck = { "Peacock Charm", "Pile Chain" },
		Ear1 = { "Brutal earring", "Outlaw's Earring", "Pigeon Earring", "Optical Earring" },
		Ear2 = { "Wilderness Earring", "Pigeon Earring" },

		Body = { "Thurandaut Tabard", "Pup. Tobe", "Garrison Tunica +1", "Rambler's Cloak", "Mithran Separates" },
		Hands = { "Thurandaut Gloves", "Battle Gloves", "Mithran Gauntlets" },
		Ring1 = { "Rajas Ring", "Archer's Ring", "Bastokan Ring" },
		Ring2 = { "Zilant Ring", "Ulthalam's Ring", "Archer's Ring", "San d'Orian Ring" },

		Back = { "Pantin Cape", "Exile's Cloak", "Ram Mantle", "Traveler's Mantle" },
		Waist = { "Ninurta's Sash", "Virtuoso Belt", "Tilt Belt", "Lizard Belt", "Leather Belt" },
		Legs = { "Thurandaut Tights", "Herder's Subligar", "Garrison Hose +1", "Mithran Loincloth" },
		Feet = { "Thurandaut Boots", "Savage Gaiters", "Garrison Boots +1", "Mithran Gaiters" },
	},
	Tp_Hybrid_Priority = {},
	Tp_Acc_Priority = {
		Ring1 = { "Archer's Ring", "San d'Orian Ring" },
		Ring2 = { "Archer's Ring", "San d'Orian Ring" },
	},
	-- These following profile.Sets are intended for one off items to equip while the pet is engaged (or both of you) based on the PupMode. An example would be Pet HP+ pieces for Tank mode. Can be empty but do not delete.
	Tank_Priority = {
		Body = "Thurandaut Tabard",
		Hands = { "Thurandaut Gloves", "Seer's Mitts" },
		Legs = { "Herder's Subligar" },
		Ear2 = { "Wilderness Earring" },
	},
	Melee_Priority = {
		Hands = { "Thurandaut Gloves", "Seer's Mitts" },
		Legs = { "Herder's Subligar" },
		Ear2 = { "Wilderness Earring" },
		Back = { "Pantin Cape" },
	},
	Ranger_Priority = {},
	Mage_Priority = {
		Head = "Thurandaut Chapeau",
		Hands = "Thurandaut Gloves",
		Legs = "Thurandaut Tights",
		Feet = "Thurandaut Boots",
	},
	Heal_Priority = {
		Head = "Thurandaut Chapeau",
		Hands = "Thurandaut Gloves",
		Legs = "Pup. Churidars",
		Feet = "Thurandaut Boots",
	},

	Precast_Priority = {
		Ear1 = "Loquac. Earring",
		Head = "Thurandaut Chapeau",
		Hands = "Thurandaut Gloves",
		Waist = { "Ninurta's Sash" },
		Legs = { "White Slacks" },
	},

	Enhancing = {},
	Phalanx = {},
	Stoneskin = {},
	Refresh = {},

	Cure = {},

	Enfeebling = {},

	Ws_Default_Priority = {
		Head = "Thurandaut Chapeau",
		Neck = { "Fotia Gorget", "Spike Necklace" },
		Ear1 = "Ethereal Earring", -- +5attk
		Ear2 = "Aesir Ear Pendant", -- +7attk

		Body = "Thurandaut Tabard",
		Hands = "Thurandaut Gloves",
		Ring1 = "Rajas Ring", -- +5dex +5str +5tp +5subtle
		Ring2 = "Zilant Ring",

		Back = { "Pantin Cape", "Exile's Cloak" },
		Waist = "Virtuoso Belt",
		Legs = "Thurandaut Tights",
		Feet = "Thurandaut Boots",
	},
	Ws_Hybrid_Priority = {},
	Ws_Acc_Priority = {},

	Shijin_Default = {
		Head = "Thurandaut Chapeau", -- +5
		Ear1 = "Outlaw's Earring", -- +2

		Body = "Thurandaut Tabard", -- +10
		Hands = "Pantin Destanas", -- +2
		Ring1 = "Rajas Ring",  -- +5
		Ring2 = "Bastokan Ring", -- +1

		Back = "Pantin Cape",
		Waist = "Lizard Belt", -- +2
		Legs = "Garrison Hose +1", -- +2
	},
	Shijin_Hybrid = {},
	Shijin_Acc = {},

	Pet_WS_Priority = {
		Head = { "Entrancing Ribbon" },
		Ear2 = "Wilderness Earring",
		Hands = { "Black Mitts" },
		Legs = { "Herder's Subligar" },
		Back = "Pantin Cape",
	},
	Pet_RNGWS_Priority = {
		Hands = { "Black Mitts" },
		Legs = "Seer's Slacks",
	},

	Repair_Priority = {
		Ammo = { "Automat. Oil +2", "Automat. Oil +1", "Automation Oil" },
		Feet = "Pup. Babouches",
		Neck = "Buffoon's Collar",
	},
	Maneuver = {
		Hands = "Pup. Dastanas",
		Neck = "Buffoon's Collar",
	},
	Overdrive = {},

	TH = {},
	Movement = {},
}
profile.Sets = sets

profile.Packer = {
	{ Name = "Automat. Oil +3", Quantity = "all" },
	{ Name = "Bean Daifuku",    Quantity = "all" },
}

profile.OnLoad = function()
	gSettings.AllowAddSet = true
	gcinclude.Initialize()

	--[[ Set you job macro defaults here]]
	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 8")
	AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1")
	AshitaCore:GetChatManager():QueueCommand(1, "/equipset 008")

	AshitaCore:GetChatManager():QueueCommand(-1, "/bind F9 /pupmode")

	gcinclude.settings.RefreshGearMPP = 30
end

profile.OnUnload = function()
	AshitaCore:GetChatManager():QueueCommand(-1, "/unbind F9")
	gcinclude.Unload()
end

profile.HandleCommand = function(args)
	gcinclude.HandleCommands(args)
end

profile.HandleDefault = function()
	-- handle levelsync
	local player = gData.GetPlayer()

	local myLevel = player.MainJobSync
	if myLevel ~= Settings.CurrentLevel then
		gFunc.EvaluateLevels(profile.Sets, myLevel)
		Settings.CurrentLevel = myLevel
	end
	local pet = gData.GetPet()
	local OD = gData.GetBuffCount("Overdrive")

	if gcdisplay.GetCycle("craft") == "none" then
		gFunc.EquipSet(sets.Idle)
	end
	if pet ~= nil then
		gFunc.EquipSet(sets.Idle_Pet)
	end

	if pet ~= nil and pet.Status == "Engaged" then
		gFunc.EquipSet("Pet_Only_Tp_" .. gcdisplay.GetCycle("MeleeSet"))
		gFunc.EquipSet(gcdisplay.GetCycle("PupMode"))
		if player.Status == "Engaged" then
			gFunc.EquipSet("Tp_" .. gcdisplay.GetCycle("MeleeSet"))
		end
	elseif player.Status == "Resting" then
		gFunc.EquipSet(sets.Resting)
	elseif player.IsMoving == true then
		gFunc.EquipSet(sets.Movement)
	end

	gcinclude.CheckDefault()
	if (pet ~= nil) and (pet.TP > 950) and (pet.Status == "Engaged") then
		if gcdisplay.GetCycle("PupMode") == "Ranger" then
			gFunc.EquipSet(sets.Pet_RNGWS)
		elseif gcdisplay.GetCycle("PupMode") == "Melee" then
			gFunc.EquipSet(sets.Pet_WS)
		end
	end
	if gcdisplay.GetToggle("DTset") == true then
		if pet ~= nil then
			gFunc.EquipSet(sets.Pet_Dt)
		end
		gFunc.EquipSet(sets.Dt)
	end
	if gcdisplay.GetToggle("Kite") == true then
		gFunc.EquipSet(sets.Movement)
	end

	if OD > 0 then
		gFunc.EquipSet(sets.Overdrive)
	end
end

profile.HandleAbility = function()
	-- handle levelsync
	local player = gData.GetPlayer()

	local myLevel = player.MainJobSync
	if myLevel ~= Settings.CurrentLevel then
		gFunc.EvaluateLevels(profile.Sets, myLevel)
		Settings.CurrentLevel = myLevel
	end

	local ability = gData.GetAction()
	if (string.match(ability.Name, "Repair")) or (string.match(ability.Name, "Maintenance")) then
		gFunc.EquipSet(sets.Repair)
	elseif string.contains(ability.Name, "Maneuver") then
		gFunc.EquipSet(sets.Maneuver)
	elseif string.match(ability.Name, "Overdrive") then
		gFunc.EquipSet(sets.Overdrive)
	end

	gcinclude.CheckCancels()
end

profile.HandleItem = function()
	local item = gData.GetAction()

	if string.match(item.Name, "Holy Water") then
		gFunc.EquipSet(gcinclude.sets.Holy_Water)
	end
end

profile.HandlePrecast = function()
	local spell = gData.GetAction()
	gFunc.EquipSet(sets.Precast)

	gcinclude.CheckCancels()
end

profile.HandleMidcast = function()
	local player = gData.GetPlayer()
	local spell = gData.GetAction()

	if spell.Skill == "Enhancing Magic" then
		gFunc.EquipSet(sets.Enhancing)

		if string.match(spell.Name, "Phalanx") then
			gFunc.EquipSet(sets.Phalanx)
		elseif string.match(spell.Name, "Stoneskin") then
			gFunc.EquipSet(sets.Stoneskin)
		elseif string.contains(spell.Name, "Refresh") then
			gFunc.EquipSet(sets.Refresh)
		end
	elseif spell.Skill == "Healing Magic" then
		gFunc.EquipSet(sets.Cure)
	elseif spell.Skill == "Enfeebling Magic" then
		gFunc.EquipSet(sets.Enfeebling)
	end
	if gcdisplay.GetToggle("TH") == true then
		gFunc.EquipSet(sets.TH)
	end
end

profile.HandlePreshot = function()
	gFunc.EquipSet(sets.Preshot)
end

profile.HandleMidshot = function()
	gFunc.EquipSet(sets.Midshot)
	if gcdisplay.GetToggle("TH") == true then
		gFunc.EquipSet(sets.TH)
	end
end

profile.HandleWeaponskill = function()
	local canWS = gcinclude.CheckWsBailout()
	if canWS == false then
		gFunc.CancelAction()
		return
	else
		local ws = gData.GetAction()

		gFunc.EquipSet(sets.Ws_Default)
		if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
			gFunc.EquipSet("Ws_" .. gcdisplay.GetCycle("MeleeSet"))
		end

		if string.match(ws.Name, "Shijin Spiral") then
			gFunc.EquipSet(sets.Shijin_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Shijin_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		end
	end
end

return profile
