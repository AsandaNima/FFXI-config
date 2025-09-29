local profile = {}
gcinclude = gFunc.LoadFile("common\\gcinclude.lua")

local Settings = {
	CurrentLevel = 0,
}

local sets = {
	Idle = {
		Head = 'Temple Crown',
		Body = "Temple Cyclas",
		Hands = "Temple Gloves",
		Legs = "Temple Hose",
		Feet = "Temple Gaiters",
	},
	Resting = {},
	Idle_Regen = {},
	Idle_Refresh = {},
	Town = {},

	Dt_Priority = {},

	Tp_Default_Priority = {
		Head = { "Empress Hairpin", "Garrison Sallet +1" },
		Neck = { "Peacock Charm", "Spike Necklace", "Pile Chain" },
		Ear1 = { "Brutal earring", "Outlaw's Earring", "Pigeon Earring", "Optical Earring" },
		Ear2 = { "Wilderness Earring", "Pigeon Earring" },

		Body = { "Garrison Tunica +1", "Rambler's Cloak", "Mithran Separates" },
		Hands = { "Shinobi Tekko", "Battle Gloves", "Mithran Gauntlets" },
		Ring1 = { "Rajas Ring", "Archer's Ring", "Bastokan Ring" },
		Ring2 = { "Ulthalam's Ring", "Archer's Ring", "San d'Orian Ring" },

		Back = { "Exile's Cloak", "Ram Mantle", "Traveler's Mantle" },
		Waist = { "Ninurta's Sash", "Virtuoso Belt", "Tilt Belt", "Purple Belt", "Lizard Belt", "Leather Belt" },
		Legs = { "Shinobi Hakama", "Garrison Hose +1", "Mithran Loincloth" },
		Feet = { "Savage Gaiters", "Garrison Boots +1", "Mithran Gaiters" },
	},
	Tp_Hybrid_Priority = {},
	Tp_Acc_Priority = {},

	Precast = {},

	Preshot = {},
	Midshot = {},

	Ws_Default_Priority = {
		Neck = { "Fotia Gorget", "Spike Necklace" },
		Ear1 = "Ethereal Earring", -- +5attk
		Ear2 = "Aesir Ear Pendant", -- +7attk

		Body = { "Savage Separates" },
		Ring1 = "Rajas Ring", -- +5dex +5str +5tp +5subtle
		Ring2 = "Archer's Ring",

		Back = { "Pantin Cape", "Exile's Cloak" },
		Legs = { "Shinobi Hakama", "Garrison Hose +1" },
		Waist = "Virtuoso Belt",
	},
	Ws_Hybrid = {},
	Ws_Acc = {},

	Victory_Default = {},
	Victory_Imp = {},
	Victory_Hybrid = {},
	Victory_Acc = {},

	Shijin_Default = {},
	Shijin_Hybrid = {},
	Shijin_Acc = {},

	Impetus = {},
	Focus = {},
	Dodge = {},
	Chakra = {},
	FootworkJA = {},
	Footwork = {},
	HundredFists = {},
	FormlessStrikes = {},
	Counterstance = {},

	TH = {},
	Movement = {},
}
profile.Sets = sets

profile.Packer = {
	{ Name = "Red Curry Bun", Quantity = "all" },
}

profile.OnLoad = function()
	gSettings.AllowAddSet = true
	gcinclude.Initialize()

	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 1")
	AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1")
end

profile.OnUnload = function()
	gcinclude.Unload()
end

profile.HandleCommand = function(args)
	gcinclude.HandleCommands(args)
end

profile.HandleDefault = function()
	if gcdisplay.GetCycle("craft") == "none" then
		gFunc.EquipSet(sets.Idle)
	end
	local impetus = gData.GetBuffCount("Impetus")
	local footwork = gData.GetBuffCount("Footwork")

	-- handle levelsync
	local player = gData.GetPlayer()

	local myLevel = player.MainJobSync
	if myLevel ~= Settings.CurrentLevel then
		gFunc.EvaluateLevels(profile.Sets, myLevel)
		Settings.CurrentLevel = myLevel
		gcinclude.settings.CurrentLevel = myLevel -- set CurrentLevel in gcinclude
	end

	if player.Status == "Engaged" then
		gFunc.EquipSet(sets.Tp_Default)
		if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
			gFunc.EquipSet("Tp_" .. gcdisplay.GetCycle("MeleeSet"))
		end
		if impetus >= 1 then
			gFunc.EquipSet(sets.Impetus)
		end
		if footwork >= 1 then
			gFunc.EquipSet(sets.Footwork)
		end
		if gcdisplay.GetToggle("TH") == true then
			gFunc.EquipSet(sets.TH)
		end
	elseif player.Status == "Resting" then
		gFunc.EquipSet(sets.Resting)
	elseif player.IsMoving == true then
		gFunc.EquipSet(sets.Movement)
	end

	gcinclude.CheckDefault()
	if gcdisplay.GetToggle("DTset") == true then
		gFunc.EquipSet(sets.Dt)
	end
	if gcdisplay.GetToggle("Kite") == true then
		gFunc.EquipSet(sets.Movement)
	end
end

profile.HandleAbility = function()
	local ability = gData.GetAction()

	if string.match(ability.Name, "Focus") then
		gFunc.EquipSet(sets.Focus)
	elseif string.match(ability.Name, "Dodge") then
		gFunc.EquipSet(sets.Dodge)
	elseif string.match(ability.Name, "Hundred Fists") then
		gFunc.EquipSet(sets.HundredFists)
	elseif string.match(ability.Name, "Chakra") then
		gFunc.EquipSet(sets.Chakra)
	elseif string.match(ability.Name, "Footwork") then
		gFunc.EquipSet(sets.FootworkJA)
	elseif string.match(ability.Name, "Counterstance") or string.match(ability.Name, "Mantra") then
		gFunc.EquipSet(sets.Counterstance)
	elseif string.contains(ability.Name, "Formless Strikes") then
		gFunc.EquipSet(sets.FormlessStrikes)
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
	local spell = gData.GetAction()
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
	-- handle levelsync
	local player = gData.GetPlayer()

	local myLevel = player.MainJobSync
	if myLevel ~= Settings.CurrentLevel then
		gFunc.EvaluateLevels(profile.Sets, myLevel)
		Settings.CurrentLevel = myLevel
		gcinclude.settings.CurrentLevel = myLevel -- set CurrentLevel in gcinclude
	end

	local canWS = gcinclude.CheckWsBailout()
	if canWS == false then
		gFunc.CancelAction()
		return
	else
		local ws = gData.GetAction()
		local impetus = gData.GetBuffCount("Impetus")

		gFunc.EquipSet(sets.Ws_Default)
		if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
			gFunc.EquipSet("Ws_" .. gcdisplay.GetCycle("MeleeSet"))
		end

		if string.match(ws.Name, "Victory Smite") then
			gFunc.EquipSet(sets.Victory_Default)
			if impetus > 0 then
				gFunc.EquipSet("Victory_Imp")
			end
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Victory_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		elseif string.match(ws.Name, "Shijin Spiral") then
			gFunc.EquipSet(sets.Shijin_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Shijin_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		end
	end
end

return profile
