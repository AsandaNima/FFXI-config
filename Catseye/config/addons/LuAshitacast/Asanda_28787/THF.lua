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
	Resting = {},
	Idle_Regen_Priority = {
		Body = { "Rog. Vest +1", "Scorpion Harness" },
	},
	Idle_Refresh = {},
	Town = {},
	Dt = {},
	Tp_Default_Priority = { --21% haste, need 25% for cap
		Head = { "Yagudo Crown", -- 5% haste
			"Adhemar Bonnet", "Optical Hat", "Heroic Hairpin", "Empress Hairpin", "Garrison Sallet +1", "Fungus Hat",
			"Cmp. Eye Circlet" },
		Neck = { "Peacock Charm", "Spike Necklace", "Pile Chain" },
		Ear1 = { "Brutal Earring", "Outlaw's Earring", "Pigeon Earring", "Tribal Earring" },
		Ear2 = { "Suppanomimi", "Wilder. Earring +1", "Pigeon Earring", "Optical Earring" },

		Body = { "Adhemar Jacket", -- 3% haste
			"Scorpion Harness", "Dino Jerkin", "Brigandine +1", "Garrison Tunica +1", "Leather Vest", "Mithran Separates" },
		Hands = { "Adhemar Wristbands", -- 3% haste
			"Battle Gloves", "Mithran Gauntlets" },
		Ring1 = { "Rajas Ring", "Archer's Ring", "Balance Ring +1" },
		Ring2 = { "Zilant Ring", "Ulthalam's Ring", "Archer's Ring", "Balance Ring +1" },

		Back = { "Nomad's Mantle", "Sniper's Shroud" },
		Waist = { "Ninurta's Sash", -- 6% haste
			"Swift Belt", "Tilt Belt", "Lizard Belt", "Leather Belt" },
		Legs = { "Adhemar Kecks", -- 4% haste
			"Dino Trousers", "Garrison Hose +1", "Phl. Trousers", "Mithran Loincloth" },
		Feet = { "Rog. Poulaines +1", -- 1% haste
			"Adhemar Gamashes", "Dino Ledelsens", "Leaping Boots", "Mithran Gaiters" },
	},
	Precast = {
		Head = "Yagudo Crown",  -- 5% haste
		Body = "Adhemar Jacket", -- 3% haste
		Hands = "Adhemar Wristbands", -- 3% haste
		Waist = "Ninurta's Sash", -- 6% haste
		Legs = "Adhemar Kecks", -- 4% haste
	},
	Preshot_Priority = {
		Head = { "Optical Hat", "Adhemar Bonnet" },
		Neck = { "Peacock Charm" },
		Ring1 = { "Marid Ring", "Archer's Ring" },
		Ring2 = { "Marid Ring", "Archer's Ring" },
		feet = { "Rog. Poulaines +1" } -- +5racc
	},
	Midshot_Priority = {},
	DEX_Set_Priority = {                     -- Set focused on DEX for Sneak Attack and DEX based WS ==> max Dex: 49
		Head = {
			{ Name = "Adhemar Bonnet",  Level = 75 }, -- 6 Dex, 6 Agi, 3 Crit
			{ Name = "Optical Hat",     Level = 70 }, -- 3 Dex, 3 Agi, 10 Acc
			{ Name = "Empress Hairpin", Level = 24 }, -- 3 Dex, 3 Agi
		},
		Neck = {
			{ Name = "Spike Necklace", Level = 21 }, -- 3 Dex
		},
		Ear1 = {
			{ Name = "Outlaw's Earring", Level = 50 }, -- 2 Dex, 3 Attk
		},
		Ear2 = {
			{ Name = "Minuet Earring", Level = 75 }, -- 1 Dex
		},

		Body = {
			{ Name = "Dino Jerkin",        Level = 48 }, -- 4 Dex, 8 Attk
			{ Name = "Brigadine +1",       Level = 45 }, -- 3 Dex, 3 Agi, 3 Str, 4 Attk
			{ Name = "Garrison Runica +1", Level = 20 },
		},
		Hands = {
			{ Name = "Raptor Gloves", Level = 48 }, -- 4 Dex
			{ Name = "Noct Gloves",   Level = 75 }, -- 2 Dex
		},
		Ring1 = {
			{ Name = "Rajas Ring",      Level = 30 }, -- 5 Dex, 5 Str
			{ Name = "Balance Ring +1", Level = 14 }, -- 2 Dex
		},
		Ring2 = {
			{ Name = "Zilant Ring",     Level = 75 }, -- 6 Dex, 3 Acc
			{ Name = "Balance Ring +1", Level = 14 }, -- 2 Dex
		},

		Back = {
			{ Name = "Assassin's Cape", Level = 70 }, -- 4 Dex, 4 Agi
			{ Name = "Ram Mantle",      Level = 36 }, -- 2 Dex, 2 Agi
		},
		Waist = {
			{ Name = "Warwolf Belt",  Level = 71 }, -- 5 Dex
			{ Name = "Ryl.Kgt. Belt", Level = 50 }, -- 2 Dex, 2 Agi, 2 Str
			{ Name = "Lizard Belt",   Level = 17 }, -- 2 Dex
		},
		Legs = {
			{ Name = "Adhemar Kecks",    Level = 75 }, -- 4 Dex, 10 Dagger
			{ Name = "Garrison Hose +1", Level = 20 }, -- 2 Dex, 2 Str
		},
		Feet = {
			{ Name = "Adsilio Boots +1", Level = 75 }, -- 5 Dex, 5 Agi, 3 Acc
			{ Name = "Leaping Boots",    Level = 7 }, -- 3 Dex, 3 Agi
		},
	},
	AGI_Set_Priority = {                     -- Set focused on AGI for Trick Attack and AGI based WS ==> max Agi:
		Head = {
			{ Name = "Dragon Cap",      Level = 73 }, -- 6 Dex, 4 Dagger
			{ Name = "Optical Hat",     Level = 70 }, -- 3 Dex, 3 Agi, 10 Acc
			{ Name = "Empress Hairpin", Level = 24 }, -- 3 Dex, 3 Agi
		},
		--		Neck = {
		--			{ Name = "Spike Necklace", Level = 21 }, -- 3 Dex
		--		},
		Ear1 = {
			{ Name = "Drone Earring", Level = 35 }, -- 3 Agi
		},
		Ear2 = {
			{ Name = "Drone Earring", Level = 35 }, -- 3 Agi
		},

		Body = {
			{ Name = "Asn. Vest +1", Level = 75 }, -- 5 Agi
			{ Name = "Brigadine +1", Level = 45 }, -- 3 Dex, 3 Agi, 3 Str, 4 Attk
		},
		Hands = {
			{ Name = "Rog. Armlets +1", Level = 47 }, -- Increase "Trick Attack" damage
		},
		Ring1 = {
			{ Name = "Sattva Ring",    Level = 30 }, -- 5 Agi
			{ Name = "Reflex Ring +1", Level = 14 }, -- 2 Agi
		},
		Ring2 = {
			{ Name = "Breeze Ring",    Level = 75 }, -- 5 Agi
			{ Name = "Reflex Ring +1", Level = 14 }, -- 2 Agi
		},

		Back = {
			{ Name = "Assassin's Cape", Level = 70 }, -- 4 Dex, 4 Agi
			{ Name = "Ram Mantle",      Level = 36 }, -- 2 Dex, 2 Agi
			{ Name = "Sniper's Shroud", Level = 8 }, -- 1 Agi, 1 Str
		},
		Waist = {
			{ Name = "Warwolf Belt",  Level = 71 }, -- 5 Dex
			{ Name = "Ryl.Kgt. Belt", Level = 50 }, -- 2 Dex, 2 Agi, 2 Str
			{ Name = "Lizard Belt",   Level = 17 }, -- 2 Dex
		},
		Legs = {
			{ Name = "Adhemar Kecks",    Level = 75 }, -- 4 Dex, 10 Dagger
			{ Name = "Garrison Hose +1", Level = 20 }, -- 2 Dex, 2 Str
		},
		Feet = {
			{ Name = "Adsilio Boots +1", Level = 75 }, -- 5 Dex, 5 Agi, 3 Acc
			{ Name = "Leaping Boots",    Level = 7 }, -- 3 Dex, 3 Agi
		},
	},
	Ws_Default_Priority = {
		Head = { "Adhemar Bonnet", "Shade Tiara" },
		Neck = { "Fotia Gorget", "Spike Necklace" },
		Ear1 = { "Pigeon Earring" },
		Ear2 = { "Pigeon Earring" },

		Body = { "Adhemar Jacket", "Assault Jerkin", "Brigandine +1" },
		Hands = { "Adhemar Wristbands", "Guerilla Gloves" },
		Ring1 = { "Rajas Ring" },
		Ring2 = { "Zilant Ring", "Ulthalam's Ring" },

		Back = { "Assassin's Cape", "Exile's Cloak" },
		Waist = { "Warwolf Belt", "Virtuoso Belt" },
		Legs = { "Adhemar Kecks", "Garrison Hose +1" },
		Feet = { "Adhemar Gamashes", "Savage Gaiters" },
	},
	Ws_Default_SA_Priority = {
		Head = "Adhemar Bonnet",
		Neck = "Fotia Gorget",
		Ear2 = "Outlaw's Earring",

		Body = "Dino Jerkin",
		Hands = "Adhemar Wristbands",
		Ring1 = "Rajas Ring",
		Ring2 = "Zilant Ring",

		Back = "Assassin's Cape",
		Waist = "Warwolf Belt",
		Legs = "Adhemar Kecks",
		Feet = "Adhemar Gamashes",
	},
	Ws_Default_TA_Priority = {
		hands = "Rog. Armlets +1",
	},
	Ws_Default_SATA_Priority = {},
	Evis_Default = {},
	Evis_Default_SA = {},
	Evis_Default_TA = {},
	Evis_Default_SATA = {},
	Exent_Default = {        -- AGI > attak >rest
		Head = "Dragon Cap", -- +6
		Neck = "Fotia Gorget",
		Ear1 = "Drone Earring", -- +3, can be upgraded by handits earring from TT, need 15 shakudo ingot
		Ear2 = "Drone Earring", -- +3
		body = "Asn. Vest +1", -- +5 , can be upgraded with bone harnes with augments, but needs wyrm bone...
		-- Hands = "", -- dragon mittens or skadis seems the best
		Ring1 = "Sattva Ring", -- +5
		Ring2 = "Breeze Ring", -- +5
		Back = "Assassin's Cape", -- +4
		Waist = "Ryl.Kgt. Belt", -- +2
		Legs = "Adhemar Kecks", -- +4
		Feet = "Adsilio Boots +1", -- +5
	},
	Exent_Default_SA = {},
	Exent_Default_TA = {
		hands = "Rog. Armlets +1",
	},
	Exent_Default_SATA = {},
	SATA_Priority = {
		Head = { "Adhemar Bonnet", "Empress Hairpin" },
		Neck = { "Spike Necklace" },
		Ear1 = { "Drone Earring" },
		Ear2 = { "Outlaw's Earring" },
		Body = { "Brigandine +1", "Garrison Tunica +1" },
		hands = { "Rog. Armlets +1", "Raptor Gloves", "Noct Gloves" },
		Ring1 = { "Rajas Ring" },
		Ring2 = { "Zilant Ring" },
		Back = { "Assassin's Cape" },
		Waist = { "Warwolf Belt", "Ryl.Kgt. Belt", "Mrc.Cpt. Belt" },
		Legs = { "Adhemar Kecks", "Garrison Hose +1" },
		Feet = { "Adhemar Gamashes" },
	},
	SA_Priority = {
		Head = { "Adhemar Bonnet", "Empress Hairpin" },
		Neck = { "Spike Necklace" },
		Ear2 = { "Outlaw's Earring" },
		Body = { "Dino Jerkin", "Brigandine +1", "Garrison Tunica +1" },
		Hands = { "Adhemar Wristbands", "Raptor Gloves", "Noct Gloves" },
		Ring1 = { "Rajas Ring" },
		Ring2 = { "Zilant Ring" },
		Back = { "Assassin's Cape", "Sniper's Shroud" },
		Waist = { "Warwolf Belt", "Ryl.Kgt. Belt", "Mrc.Cpt. Belt" },
		Legs = { "Adhemar Kecks", "Garrison Hose +1" },
		Feet = { "Adhemar Gamashes" },
	},
	TA_Priority = {
		Head = { "Adhemar Bonnet", "Empress Hairpin" },
		Ear1 = { "Drone Earring" },
		Ear2 = { "Drone Earring" },
		Body = { "Brigandine +1" },
		hands = { "Rog. Armlets +1" },
		Ring1 = { "Sattva Ring", "Reflex Ring" },
		Ring2 = { "Breeze Ring", "Reflex Ring" },
		Waist = { "Ryl.Kgt. Belt", "Mrc.Cpt. Belt" },
		Legs = { "Dino Trousers", "Rogue's Culottes", "Noct Brais" },
		Feet = { "Dino Ledelsens" },

	},
	TH = {},
	Flee = {
		feet = "Rog. Poulaines +1"
	},
	Hide = {
		body = "Rog. Vest +1",
	},
	Steal = {
		Head = "Rogue's Bonnet", -- +1steal
		hands = "Rog. Armlets +1", -- +1steal
		Ring2 = "Rogue's Ring", -- +3steal
		Legs = "Assassin's Culottes", -- +5steal
		feet = "Rog. Poulaines +1" -- +2steal
	},
	Mug = {
		Head = "Asn. Bonnet +1", -- +1mug
		Ear1 = "Bandit's Earring",
	},
	Movement = {},
	Artifact = {
		head = "Rogues Bonnet",
		body = "Rog. Vest +1",
		hands = "Rog. Armlets +1",
		legs = "Rogues Culottes",
		feet = "Rog. Poulaines +1"
	},
	Relic = {
		head = "Assassins Bonnet",
		body = "Asn. Vest +1",
		hands = "Assassins Armlets",
		legs = "Assassins Culottes",
		feet = "Assassins Pouln.",
		back = "Assassins Cape",
	},
}
profile.Sets = sets

profile.Packer = {
	--     'Odious Blood',
	--     'Odious Pen',
	--     'Odious Skull',
	--     'Odious Horn',
	--     {Name = 'Forgotten Hope', Quantity = 'all'},
	--     {Name = 'Frgtn. Thought', Quantity = 'all'},
	--     'Shrouded Bijou',
	--     {Name = 'T. Whiteshell', Quantity = 'all'},
	--     {Name = 'O. Bronzepiece', Quantity = 'all'},
	--     {Name = '1 Byne Bill', Quantity = 'all'},
}

profile.OnLoad = function()
	gSettings.AllowAddSet = true
	gcinclude.Initialize()

	--[[ Set you job macro defaults here]]
	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 6")
	AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1")
	AshitaCore:GetChatManager():QueueCommand(1, "/equipset 009")
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
		gcinclude.settings.CurrentLevel = myLevel -- set CurrentLevel in gcinclude
	end

	if gcdisplay.GetCycle("craft") == "none" then
		gFunc.EquipSet(sets.Idle)
	end
	local action = gData.GetAction()
	local sa = gData.GetBuffCount("Sneak Attack")
	local ta = gData.GetBuffCount("Trick Attack")

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

	if (sa == 1) and (ta == 1) then
		gFunc.EquipSet("SATA")
	elseif sa == 1 then
		gFunc.EquipSet("SA")
	elseif ta == 1 then
		gFunc.EquipSet("TA")
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
	if string.match(ability.Name, "Flee") then
		gFunc.EquipSet(sets.Flee)
	end
	if string.match(ability.Name, "Steal") then
		gFunc.EquipSet(sets.Steal)
	end
	if string.match(ability.Name, "Mug") then
		gFunc.EquipSet(sets.Mug)
	end
	if string.match(ability.Name, "Hide") then
		gFunc.EquipSet(sets.Hide)
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
		local sa = gData.GetBuffCount("Sneak Attack")
		local ta = gData.GetBuffCount("Trick Attack")

		gFunc.EquipSet(sets.Ws_Default)
		if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
			gFunc.EquipSet("Ws_" .. gcdisplay.GetCycle("MeleeSet"))
		end
		if (sa == 1) and (ta == 1) then
			gFunc.EquipSet("Ws_" .. gcdisplay.GetCycle("MeleeSet") .. "_SATA")
		elseif sa == 1 then
			gFunc.EquipSet("Ws_" .. gcdisplay.GetCycle("MeleeSet") .. "_SA")
		elseif ta == 1 then
			gFunc.EquipSet("Ws_" .. gcdisplay.GetCycle("MeleeSet") .. "_TA")
		end

		if string.match(ws.Name, "Evisceration") then
			gFunc.EquipSet(sets.Evis_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Evis_" .. gcdisplay.GetCycle("MeleeSet"))
			end
			if (sa == 1) and (ta == 1) then
				gFunc.EquipSet("Evis_" .. gcdisplay.GetCycle("MeleeSet") .. "_SATA")
			elseif sa == 1 then
				gFunc.EquipSet("Evis_" .. gcdisplay.GetCycle("MeleeSet") .. "_SA")
			elseif ta == 1 then
				gFunc.EquipSet("Evis_" .. gcdisplay.GetCycle("MeleeSet") .. "_TA")
			end
		end
		if string.match(ws.Name, "Exenterator") then
			gFunc.EquipSet(sets.Exent_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Exent_" .. gcdisplay.GetCycle("MeleeSet"))
			end
			if (sa == 1) and (ta == 1) then
				gFunc.EquipSet("Exent_" .. gcdisplay.GetCycle("MeleeSet") .. "_SATA")
			elseif sa == 1 then
				gFunc.EquipSet("Exent_" .. gcdisplay.GetCycle("MeleeSet") .. "_SA")
			elseif ta == 1 then
				gFunc.EquipSet("Exent_" .. gcdisplay.GetCycle("MeleeSet") .. "_TA")
			end
		end
	end
end

return profile
