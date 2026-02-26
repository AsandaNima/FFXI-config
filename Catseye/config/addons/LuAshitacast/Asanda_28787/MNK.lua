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
	Idle_Regen_Priority = {
		Body = {
			{ Name = "Scorpion Harness", Level = 57 },
		},
	},
	Idle_Refresh = {},
	Town = {},

	Dt_Priority = {},

	Tp_Default_Priority = {
		Head = {
			{ Name = "Yagudo Crown",     Level = 75 },
			{ Name = "Optical Hat",      Level = 70 },
			{ Name = "Heroic Hairpin",   Level = 30 },
			{ Name = "Fungus Hat",       Level = 14 },
			{ Name = "Cmp. Eye Circlet", Level = 9 },
		},
		Neck = {
			{ Name = "Peacock Charm",  Level = 33 },
			{ Name = "Spike Necklace", Level = 21 },
			{ Name = "Pile Chain",     Level = 3 },
		},
		Ear1 = {
			{ Name = "Brutal Earring",   Level = 75 }, -- 5DA
			{ Name = "Outlaw's Earring", Level = 50 },
			{ Name = "Pigeon Earring",   Level = 33 },
			{ Name = "Tribal Earring",   Level = 20 }
		},
		Ear2 = {
			{ Name = "Aesir Ear Pendant",  Level = 75 },
			{ Name = "Wilder. Earring +1", Level = 45 },
			{ Name = "Pigeon Earring",     Level = 33 },
			{ Name = "Optical Earring",    Level = 10 },
		},

		Body = {
			{ Name = "Scorpion Harness",   Level = 57 },
			{ Name = "Shinobi Gi",         Level = 49 },
			{ Name = "Soil Gi +1",         Level = 29 },
			{ Name = "Garrison Tunica +1", Level = 20 },
			{ Name = "Power Gi",           Level = 13 },
			{ Name = "Blksmith. Smock",    Level = 9 },
			{ Name = "Rambler's Cloak",    Level = 1 },
		},
		Hands = {
			{ Name = "Shinobi Tekko +1",  Level = 49 },
			{ Name = "Ochiudo's Kote",    Level = 34 },
			{ Name = "Battle Gloves",     Level = 14 },
			{ Name = "Mithran Gauntlets", Level = 1 },
		},
		Ring1 = {
			{ Name = "Rajas Ring",      Level = 30 }, -- 5 Dex, 5 Str
			{ Name = "Balance Ring +1", Level = 14 }, -- 2 Dex
			{ Name = "Bastokan Ring",   Level = 1 },
		},
		Ring2 = {
			{ Name = "Zilant Ring",      Level = 75 }, -- 6 Dex, 3 Acc
			{ Name = "Ulthalam's Ring",  Level = 50 },
			{ Name = "Archer's Ring",    Level = 30 },
			{ Name = "Balance Ring +1",  Level = 14 }, -- 2 Dex
			{ Name = "San d'Orian Ring", Level = 1 },
		},

		Back = {
			{ Name = "Bruiser's Cloak", Level = 30 },
			{ Name = "Nomad's Mantle",  Level = 24 },
		},
		Waist = {
			{ Name = "Ninurta's Sash", Level = 75 },
			{ Name = "Brown Belt",     Level = 40 },
			{ Name = "Purple Belt",    Level = 18 },
			{ Name = "White Belt",     Level = 1 },

		},
		Legs = {
			{ Name = "White Slacks",      Level = 50 },
			{ Name = "Garrison Hose +1",  Level = 20 },
			{ Name = "Mithran Loincloth", Level = 1 },
		},
		Feet = {
			{ Name = "Fuma Sune-Ate",     Level = 72 },
			{ Name = "Fuma Kyahan",       Level = 39 },
			{ Name = "Savage Gaiters",    Level = 29 },
			{ Name = "Shade Leggings",    Level = 25 },
			{ Name = "Garrison Boots +1", Level = 20 },
			{ Name = "Mithran Gaiters",   Level = 1 },
		},
	},
	Tp_Hybrid_Priority = {},
	Tp_Acc_Priority = {},

	Precast = {
		Feet = "Fuma Kyahan",
	},

	Preshot = {},
	Midshot = {},

	Ws_Default_Priority = {
		Head = {
			{ Name = "Shinobi Hachigane", Level = 49 },
			{ Name = "Shade Tiara",       Level = 25 },
			{ Name = "Empress Hairpin",   Level = 24 },
		},
		Neck = {
			{ Name = "Fotia Gorget",   Level = 72 },
			{ Name = "Spike Necklace", Level = 21 }, -- 3 Str
		},

		Ear1 = {
			{ Name = "Ethereal EArring", Level = 72 },
			{ Name = "Pigeon Earring",   Level = 33 } -- 1 Str, 2 Attack
		},
		Ear2 = {
			{ Name = "Aesir Ear Pendant", Level = 75 },
			{ Name = "Pigeon Earring",    Level = 33 } -- 1 Str, 2 Attack
		},

		Body = {
			{ Name = "Brigadine +1",     Level = 45 }, -- 3 Dex, 3 Agi, 3 Str, 4 Attk
			{ Name = "Savage Separates", Level = 33 }, -- 1 Str
			{ Name = "Power Gi",         Level = 13 },
		},
		Hands = {
			{ Name = "Ochiudo's Kote", Level = 34 },
			{ Name = "Soil Tekko +1",  Level = 29 },
			{ Name = "Shade Mittens",  Level = 25 }, -- 2 Str
			{ Name = "Cotton Tekko",   Level = 18 },
		},
		Ring1 = {
			{ Name = "Rajas Ring",      Level = 30 }, -- 5 Dex, 5 Str
			{ Name = "Courage Ring +1", Level = 14 },
		},
		Ring2 = {
			{ Name = "Flame Ring",      Level = 74 },
			{ Name = "Ulthalam's Ring", Level = 50 }, -- 4 Attack
			{ Name = "Courage Ring +1", Level = 14 },
		},

		Back = {
			{ Name = "Charger Mantle",   Level = 70 }, -- 20 Attack
			{ Name = "Amemet Mantle +1", Level = 61 }, -- 2 Str, 15 Attack
			{ Name = "Bruiser's Cloak",  Level = 30 },
		},
		Waist = {
			{ Name = "Warwolf Belt", Level = 71 }, -- 5 Str
			{ Name = "Brown Belt",   Level = 40 },
			{ Name = "Purple Belt",  Level = 18 },
			{ Name = "White Belt",   Level = 1 },
		},
		Legs = {
			{ Name = "Jujitsu Sitabaki", Level = 37 },
			{ Name = "Garrison Hose +1", Level = 20 }, -- 2 Str
		},
		Feet = {
			{ Name = "Savage Gaiters", Level = 29 }, -- 3 Str
		},
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
	Focus_Priority = {},
	Dodge_Priority = {},
	ChiBlast_Priority = { -- MND
		Head = { "Garrison Sallet +1" },
		Neck = { "Justice Badge" },
		Body = { "Shade Harness" },
		Hands = { "Savage Gauntlets" },
		Legs = { "Savage Loincloth" },
		Feet = { "Garrison Boots +1" },
	},
	Chakra_Priority = { -- VIT
		Body = { "Shade Harness" },
		Hands = { "Savage Gauntlets", "Garrison Gloves +1" },
		Legs = { "Savage Loincloth" },
		Waist = { "Warwolf Belt" },
	},
	FootworkJA = {},
	Footwork = {},
	HundredFists = {},
	FormlessStrikes = {},
	Counterstance = {},

	TH = {},
	Movement = {},
	Relic = {},
	Artifact = {},

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
	elseif string.match(ability.Name, "Chi Blast") then
		gFunc.EquipSet(sets.ChiBlast)
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
