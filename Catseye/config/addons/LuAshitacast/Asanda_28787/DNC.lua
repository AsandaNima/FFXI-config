local profile = {}
gcinclude = gFunc.LoadFile("common\\gcinclude.lua")

local Settings = {
	CurrentLevel = 0,
}

local sets = {
	Idle = {
		--         Ammo = 'Yamarang',
		--         Head = 'Malignance Chapeau',
		--         Neck = 'Loricate Torque +1',
		Ear1 = { "Pigeon Earring" },
		Ear2 = { "Pigeon Earring" },
		--         Body = 'Gleti\'s Cuirass',
		--         Hands = 'Malignance Gloves',
		--         Ring1 = 'Defending Ring',
		--         Ring2 = 'Karieyh Ring +1',
		--         Back = 'Solemnity Cape',
		--         Waist = 'Gishdubar Sash',
		--         Legs = 'Gleti\'s Breeches',
		--         Feet = 'Gleti\'s Boots',
	},
	Resting = {},
	Idle_Regen_Priority = {
		Body = { "Scorpion Harness" },
	},
	Idle_Refresh = {},
	Town = {
		--         Main = 'Tauret',
		--         Sub = 'Acrontica',
		--         Ammo = 'Yamarang',
		--         Head = 'Maculele Tiara +1',
		--         Body = 'Macu. Casaque +1',
		--         Hands = 'Malignance Gloves',
		--         Legs = 'Gleti\'s Breeches',
		--         Feet = 'Gleti\'s Boots',
	},

	Dt = {
		--         Ammo = 'Staunch Tathlum',
		--         Head = 'Nyame Helm',
		--         Neck = { Name = 'Loricate Torque +1', AugPath='A' },
		--         Ear1 = { Name = 'Odnowa Earring +1', AugPath='A' },
		--         Ear2 = 'Etiolation Earring',
		--         Body = 'Nyame Mail',
		--         Hands = 'Nyame Gauntlets',
		--         Ring1 = 'Defending Ring',
		--         Ring2 = { Name = 'Gelatinous Ring +1', AugPath='A' },
		--         Back = 'Solemnity Cape',
		--         Waist = 'Flume Belt +1',
		--         Legs = 'Nyame Flanchard',
		--         Feet = 'Nyame Sollerets',
	},

	Tp_Default_Priority = {     -- 23% haste, so far
		Head = { "Dancer's Tiara +1", -- +5 haste
			"Yagudo Crown", "Heroic Hairpin", "Empress Hairpin", "Garrison Sallet +1", "Fungus Hat", "Cmp. Eye Cerclet" },
		Neck = { "Peacock Charm", "Pile Chain" },
		Ear1 = { "Brutal Earring", -- 5 DA
			"Pigeon Earring", "Optical Earring" },
		Ear2 = { "Suppanomimi", -- WD, +5 Sword
			"Outlaw's Earring", "Pigeon Earring", "Tribal Earring" },

		Body = { "Rawhide Vest", -- 3% haste
			"Scorpion Harness", "Rapparee Harness", "Dino Jerkin", "Brigandine +1", "Garrison Tunica +1", "Leather Vest",
			"Mithran Separates" },
		Hands = { "Rawhide Gloves", -- 3% haste
			"Battle Gloves", "Mithran Gauntlets" },
		Ring1 = { "Rajas Ring", "Archer's Ring", "Bastokan Ring" },
		Ring2 = { "Zilant Ring", "Sniper's Ring,", "Ulthalam's Ring", "Archer's Ring", "San d'Orian Ring" },

		Back = { "Nomad's Mantle" },
		Waist = { "Ninurta's Sach", -- 6% haste
			"Swift Belt", "Tilt Belt", "Lizard Belt", "Leather Belt" },
		Legs = { "Rawhide Trousers", --3% haste
			"Dino Trousers", "Garrison Hose +1", "Mithran Loincloth" },
		Feet = { "Dancer's Toe Shoes +1", -- 3% haste
			"Dino Ledelsens", "Leaping boots", "Mithran Gaiters" },
	},
	Tp_Hybrid_Priority = {
	},
	Tp_Acc_Priority = {
		Neck = "Spike Necklace",
		Ring1 = { "Archer's Ring" },
		Ring2 = { "Archer's Ring" },
	},

	Precast = {
	},

	Preshot = {},
	Midshot = {
	},

	Ws_Default_Priority = {
		Head = { "Rawhide Mask", -- +10 attk
			"Etoile Tiara", -- +4str +5 attk
			"Empress Hairpin" -- +3AGI
		},
		Neck = { "Fotia Gorget", "Spike Necklace" },
		Ear1 = { "Aesir Ear Pendant", -- +7 attk
		},
		Ear2 = { "Suppanomimi", -- +2 AGI, WD, +5 Sword
		},
		Body = { "Rawhide Vest" -- +10AGI, +10 Dagger
		},
		Hands = { "Etoile Bangles" -- +3AGI, +5attk
		},
		Ring1 = { "Sattva Ring" -- +5AGI
		},
		Ring2 = { "Breeze Ring" -- +5AGI
		},
		Back = { "Amemet Mantle +1", -- +2STR +15attk
		},
		Waist = { "Ryl.Kgt Belt" -- +2AGI
		},
		Legs = { "Rawhide Trousers" -- +5AGI, +5STR
		},
		Feet = { "Dino Ledelsens" -- +4AGI
		},
	},
	Ws_Hybrid = {},
	Ws_Acc = {},

	Evis_Default_Priority = {
	},
	Evis_Hybrid = {},
	Evis_Acc = {},

	Rudra_Default_Priority = {
	},
	Rudra_Hybrid = {},
	Rudra_Acc = {},

	Pyrrhic_Default = {
	},
	Pyrrhic_Hybrid = {},
	Pyrrhic_Acc = {},

	Aedge_Default_Priority = {
	},
	Aedge_Hybrid = {},
	Aedge_Acc = {},

	Waltz_Priority = {
		Head = { "Rawhide Mask", "Dancer's Tiara +1", "Garrison Sallet +1" },
		Body = { "Rawhide Vest", -- -3 delay
			"Dancer's Casaque", -- 10% waltz
			"Dino Jerkin", "Garrison Tunica +1" },
		Hands = { "Raptor Gloves" },
		Legs = { "Dancer's Tights +1" },
		Feet = { "Dino Ledelsens", "Savage Gaiters" },

		--         Ammo = 'Yamarang',
	},

	Climactic = { -- on JA and while buff is active
		--         Head = 'Maculele Tiara +1',
	},
	Violent = { -- on JA and while buff is active
		-- requires macc and dagger skill(?)
		Body = "Etoile Casaque",
	},
	Samba = { -- on JA and while buff is active
		Head = "Dancer's Tiara +1",
	},
	Jig = { -- on JA and while buff is active
		Legs = "Etoile Tights",
		Feet = "Dancer's Toe Shoes",
	},
	Step = { -- on JA and while buff is active
		Hands = "Dancer's Bangles",
		Feet = "Rawhide Boots",
		--Feet = "Etoile Toe Shoes",
	},
	Striking = { -- on JA and while buff is active
		--         Body = 'Macu. Casaque +1',
	},

	Movement = {
		--         Feet = 'Herald\'s Gaiters',
	},
	Relic = {
		head = "Etoile Tiara",
		body = "Etoile Casaque",
		hands = "Etoile Bangles",
		legs = "Etoile Tights",
		feet = "Etoile Shoes",
		back = "Etoile Cape",
	},
	Artifact = {
		head = "Dancer's Tiara +1",
		body = "Dancer's Casaque",
		hands = "Dancer's Bangles",
		legs = "Dancer's Tights +1",
		feet = "Dancer's Toe Shoes +1",
	},
}
profile.Sets = sets

profile.Packer = {
	--{Name = 'Chonofuda', Quantity = 'all'},
}

profile.OnLoad = function()
	gSettings.AllowAddSet = true
	gcinclude.Initialize()

	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 4")
	AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1")
end

profile.OnUnload = function()
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

	if gcdisplay.GetCycle("craft") == "none" then
		gFunc.EquipSet(sets.Idle)
	end

	local climactic = gData.GetBuffCount("Climactic Flourish")

	if player.Status == "Engaged" then
		gFunc.EquipSet(sets.Tp_Default)
		if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
			gFunc.EquipSet("Tp_" .. gcdisplay.GetCycle("MeleeSet"))
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
	if climactic > 0 then
		gFunc.EquipSet(sets.Climactic)
	end
	if gcdisplay.GetToggle("DTset") == true then
		gFunc.EquipSet(sets.Dt)
	end
	if gcdisplay.GetToggle("Kite") == true then
		gFunc.EquipSet(sets.Movement)
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

	if string.match(ability.Name, "Provoke") then
		gFunc.EquipSet(sets.Enmity)
	elseif string.contains(ability.Name, "Climactic") then
		gFunc.EquipSet(sets.Climactic)
	elseif string.contains(ability.Name, "Samba") then
		gFunc.EquipSet(sets.Samba)
	elseif string.contains(ability.Name, "Jig") then
		gFunc.EquipSet(sets.Jig)
	elseif string.contains(ability.Name, "Step") or string.contains(ability.Name, "step") then
		gFunc.EquipSet(sets.Step)
	elseif string.contains(ability.Name, "Waltz") then
		gFunc.EquipSet(sets.Waltz)
	elseif string.contains(ability.Name, "Violent") then
		gFunc.EquipSet(sets.Violent)
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
	local canWS = gcinclude.CheckWsBailout()
	if canWS == false then
		gFunc.CancelAction()
		return
	elseif gcdisplay.GetToggle("PROC") == true then
		gFunc.EquipSet(sets.Ws_Proc)
	else
		local ws = gData.GetAction()
		local climactic = gData.GetBuffCount("Climactic Flourish")
		local striking = gData.GetBuffCount("Striking Flourish")

		gFunc.EquipSet(sets.Ws_Default)
		if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
			gFunc.EquipSet("Ws_" .. gcdisplay.GetCycle("MeleeSet"))
		end

		if string.match(ws.Name, "Aeolian Edge") then
			gFunc.EquipSet(sets.Aedge_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Aedge_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		elseif string.match(ws.Name, "Evisceration") then
			gFunc.EquipSet(sets.Evis_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Evis_" .. gcdisplay.GetCycle("MeleeSet"))
			end
			if striking > 0 then
				gFunc.EquipSet(sets.Striking)
			end
		elseif string.match(ws.Name, "Rudra's Storm") then
			gFunc.EquipSet(sets.Rudra_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Rudra_" .. gcdisplay.GetCycle("MeleeSet"))
			end
			if climactic > 0 then
				gFunc.EquipSet(sets.Climactic)
			end
		elseif string.match(ws.Name, "Pyrrhic Kleos") then
			gFunc.EquipSet(sets.Pyrrhic_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Pyrrhic_" .. gcdisplay.GetCycle("MeleeSet"))
			end
			if striking > 0 then
				gFunc.EquipSet(sets.Striking)
			end
		end
	end
end

return profile
