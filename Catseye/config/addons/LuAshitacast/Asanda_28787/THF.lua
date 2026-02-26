local profile = {}
gcinclude = gFunc.LoadFile("common\\gcinclude.lua")

local Settings = {
	CurrentLevel = 0,
}

local sets = {
	Idle = {
	},
	Resting = {},
	Idle_Regen_Priority = {
		Body = {
			{ Name = "Rog. Vest +1",     Level = 74 }, -- +2 Regen
			{ Name = "Scorpion Harness", Level = 57 }, -- +1 Regen
		},
	},
	Idle_Refresh = {},
	Town = {},
	Dt = {},
	Tp_Default_Priority = {                    -- focus on haste (25% haste, need 25% for cap) and accuracy > attk > stats > defense stats
		Head = {
			{ Name = "Yagudo Crown",      Level = 75 }, -- 5% haste
			{ Name = "Optical Hat",       Level = 70 }, -- 3% haste
			{ Name = "Heroic Hairpin",    Level = 30 }, -- 2% haste, -2 PDT
			{ Name = "Empress Hairpin",   Level = 24 }, -- 3 Dex, 3 Agi, 10 evasion
			{ Name = "Fungus Hat",        Level = 14 }, -- 1% haste
			{ Name = "Cmp. Eye Circlet",  Level = 9 }, -- 5% evasion
			{ Name = "Protective Specs.", Level = 1 }, -- Rule of Cool
		},
		Neck = {
			{ Name = "Peacock Charm",  Level = 33 }, -- 10 Acc, 10 RAcc
			{ Name = "Spike Necklace", Level = 21 }, -- 3 Dex
			{ Name = "Rabbit Charm",   Level = 7 }, -- +2 Dex, +2 Agi
			{ Name = "Pile Chain",     Level = 3 }, -- 1 Acc
		},
		Ear1 = {
			{ Name = "Brutal Earring",   Level = 75 }, -- 5DA
			{ Name = "Outlaw's Earring", Level = 50 },
			{ Name = "Pigeon Earring",   Level = 33 },
			{ Name = "Tribal Earring",   Level = 20 }
		},
		Ear2 = {
			{ Name = "Suppanomimi",        Level = 72 }, -- DW
			{ Name = "Wilder. Earring +1", Level = 45 },
			{ Name = "Pigeon Earring",     Level = 33 },
			{ Name = "Optical Earring",    Level = 10 },
		},

		Body = {
			--{ Name = "Adhemar Jacket",     Level = 75 }, -- 3% haste
			--{ Name = "Scorpion Harness",   Level = 57 }, -- 10 acc, 10 Evasion
			{ Name = "Rapparee Harness",   Level = 50 }, -- 4% haste
			{ Name = "Dino Jerkin",        Level = 48 },
			{ Name = "Brigandine +1",      Level = 45 },
			{ Name = "Garrison Tunica +1", Level = 20 },
			{ Name = "Leather Vest",       Level = 7 },
			{ Name = "Mithran Separates",  Level = 1 },
		},
		Hands = {
			"Adhemar Wristbands", -- 3% haste
			"Battle Gloves",
			"Mithran Gauntlets",
		},
		Ring1 = {
			{ Name = "Rajas Ring",      Level = 30 }, -- 5 Dex, 5 Str
			"Archer's Ring",
			{ Name = "Balance Ring +1", Level = 14 }, -- 2 Dex
			"Bastokan Ring",
		},
		Ring2 = {
			{ Name = "Zilant Ring",     Level = 75 }, -- 6 Dex, 3 Acc
			"Ulthalam's Ring",
			"Archer's Ring",
			{ Name = "Balance Ring +1", Level = 14 }, -- 2 Dex
			"San d'Orian Ring",
		},

		Back = {
			"Nomad's Mantle",
			"Sniper's Shroud",
		},
		Waist = {
			"Ninurta's Sash", -- 6% haste
			"Swift Belt",
			"Tilt Belt",
			"Lizard Belt",
			"Leather Belt",
		},
		Legs = { "Adhemar Kecks", -- 4% haste
			"Dino Trousers",
			"Garrison Hose +1",
			"Phl. Trousers",
			"Mithran Loincloth",
		},
		Feet = {
			{ Name = "Rog. Poulaines +1", Level = 74 }, -- 3% haste, 3 DA
			"Adhemar Gamashes",
			"Dino Ledelsens",
			"Leaping Boots",
			"Mithran Gaiters",
		},
	},
	Precast_Priority = {
		Head = {
			{ Name = "Yagudo Crown", Level = 75 }, -- 5% haste
		},
		Body = {
			{ Name = "Rapparee Harness", Level = 50 }, --4% haste
		},
		Hands = {
			{ Name = "Adhemar Wristbands", Level = 75 }, -- 3% haste
		},
		Waist = {
			{ Name = "Ninurta's Sash", Level = 75 }, -- 6% haste
		},
		Legs = {
			{ Name = "Adhemar Kecks", Level = 75 }, -- 4% haste
		},
		Feet = {
			{ Name = "Rog. Poulaines +1", Level = 74 }, -- 3% haste, 3 DA
		},
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
			{ Name = "Empress Hairpin", Level = 24 }, -- 3 Dex, 3 Agi, 10 evasion
		},
		Neck = {
			--{ Name = "Fotia Gorget",   Level = 72 },
			{ Name = "Spike Necklace", Level = 21 }, -- 3 Dex
		},
		Ear1 = {
			{ Name = "Outlaw's Earring", Level = 50 }, -- 2 Dex, 3 Attk
		},
		Ear2 = {
			{ Name = "Minuet Earring", Level = 61 }, -- 1 Dex
		},

		Body = {
			{ Name = "Dino Jerkin",        Level = 48 }, -- 4 Dex, 8 Attk
			{ Name = "Brigadine +1",       Level = 45 }, -- 3 Dex, 3 Agi, 3 Str, 4 Attk
			{ Name = "Garrison Tunica +1", Level = 20 }, -- 2 Dex
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
			{ Name = "Adhemar Kecks",    Level = 75 }, -- 4 Dex, 4 Agi, 10 Dagger
			{ Name = "Garrison Hose +1", Level = 20 }, -- 2 Dex, 2 Str
		},
		Feet = {
			{ Name = "Adsilio Boots +1", Level = 75 }, -- 5 Dex, 5 Agi, 3 Acc
			{ Name = "Leaping Boots",    Level = 7 }, -- 3 Dex, 3 Agi
		},
	},
	AGI_Set_Priority = {                     -- Set focused on AGI for Trick Attack and AGI based WS ==> max Agi: 42
		Head = {
			{ Name = "Dragon Cap",      Level = 73 }, -- 6 Dex, 4 Dagger
			{ Name = "Optical Hat",     Level = 70 }, -- 3 Dex, 3 Agi, 10 Acc
			{ Name = "Empress Hairpin", Level = 24 }, -- 3 Dex, 3 Agi, 10 evasion
		},
		Neck = {
			--{ Name = "Fotia Gorget", Level = 72 },
			{ Name = "Rabbit Charm", Level = 7 }, -- 2 Agi
		},
		Ear1 = {
			{ Name = "Drone Earring", Level = 35 }, -- 3 Agi
		},
		Ear2 = {
			{ Name = "Bandit's Earring", Level = 60 }, -- 3 Agi > Need to upgrade to 4 Agi
			{ Name = "Drone Earring",    Level = 35 }, -- 3 Agi

		},

		Body = {
			{ Name = "Asn. Vest +1", Level = 75 }, -- 5 Agi
			{ Name = "Brigadine +1", Level = 45 }, -- 3 Dex, 3 Agi, 3 Str, 4 Attk
		},
		Hands = {
			--			{ Name = "Rog. Armlets +1", Level = 47 }, -- Increase "Trick Attack" damage
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
			{ Name = "Ryl.Kgt. Belt", Level = 50 }, -- 2 Dex, 2 Agi, 2 Str
			{ Name = "Leather Belt",  Level = 7 }, -- 1 Agi
		},
		Legs = {
			{ Name = "Adhemar Kecks",    Level = 75 }, -- 4 Dex, 4 Agi, 10 Dagger
			{ Name = "Rogue's Culottes", Level = 56 }, -- 4 Agi
			{ Name = "Dino Trousers",    Level = 48 }, -- 4 Agi, 5 Acc
			{ Name = "Noct Brais",       Level = 30 }, -- 2 Agi, 2 Acc
		},
		Feet = {
			{ Name = "Adsilio Boots +1", Level = 75 }, -- 5 Dex, 5 Agi, 3 Acc
			{ Name = "Dino Ledelsens",   Level = 48 }, -- 4 Agi
			{ Name = "Leaping Boots",    Level = 7 }, -- 3 Dex, 3 Agi
		},
	},
	Ws_Default_Priority = {              -- focus more on +Skill, Attk and Str for better base dmg, it will be overwritten by the stats-sets for specific WS anyway
		Head = {
			{ Name = "Dragon Cap",  Level = 73 }, -- 4 Dagger skill
			{ Name = "Dino Helm",   Level = 48 }, -- 4 Attack
			{ Name = "Shade Tiara", Level = 25 }, -- +2 Str
		},
		Neck = {
			{ Name = "Fotia Gorget",   Level = 72 },
			{ Name = "Spike Necklace", Level = 21 }, -- 3 Str
		},
		Ear1 = {
			{ Name = "Pigeon Earring", Level = 33 } -- 1 Str, 2 Attack
		},
		Ear2 = {
			{ Name = "Pigeon Earring", Level = 33 } -- 1 Str, 2 Attack
		},

		Body = {
			{ Name = "Assault Jerkin",   Level = 67 }, -- 18 Attack
			{ Name = "Brigadine +1",     Level = 45 }, -- 3 Dex, 3 Agi, 3 Str, 4 Attk
			{ Name = "Savage Separates", Level = 33 }, -- 1 Str
		},
		Hands = {
			{ Name = "Adhemar Wristbands", Level = 75 }, -- 10 Attack
			{ Name = "Shade Mittens",      Level = 25 }, -- 2 Str
			{ Name = "Guerilla Gloves",    Level = 13 }, -- 2 Attack
		},
		Ring1 = {
			{ Name = "Rajas Ring", Level = 30 }, -- 5 Dex, 5 Str
		},
		Ring2 = {
			{ Name = "Ulthalam's Ring", Level = 50 }, -- 4 Attack
		},

		Back = {
			{ Name = "Charger Mantle",   Level = 70 }, -- 20 Attack
			{ Name = "Amemet Mantle +1", Level = 61 }, -- 2 Str, 15 Attack
			{ Name = "Exile's Cloak",    Level = 50 }, -- 3 Str, 3 attack
			{ Name = "Sniper's Shroud",  Level = 8 }, -- 1 Str
		},
		Waist = {
			{ Name = "Warwolf Belt",  Level = 71 }, -- 5 Str
			{ Name = "Virtuoso Belt", Level = 54 }, -- 4 Attack
			{ Name = "Ryl.Kgt. Belt", Level = 50 }, -- 2 Str
		},
		Legs = {
			{ Name = "Adhemar Kecks",    Level = 75 }, -- 10 Dagger
			{ Name = "Garrison Hose +1", Level = 20 }, -- 2 Str
			{ Name = "Phl. Trousers",    Level = 15 }, -- 1 Str
		},
		Feet = {
			{ Name = "Adhemar Gamashes", Level = 75 }, -- 5 Str
			{ Name = "Savage Gaiters",   Level = 29 }, -- 3 Str
		},
	},
	SATA_Priority = {
		Head = {
			{ Name = "Adhemar Bonnet",  Level = 75 }, -- 6 Dex, 6 Agi, 3 Crit
			{ Name = "Dragon Cap",      Level = 73 }, -- 6 Dex, 4 Dagger
			{ Name = "Optical Hat",     Level = 70 }, -- 3 Dex, 3 Agi, 10 Acc
			{ Name = "Empress Hairpin", Level = 24 }, -- 3 Dex, 3 Agi, 10 evasion
		},
		Neck = {
			{ Name = "Rabbit Charm", Level = 7 }, -- 2 Dex, 2 Agi
		},
		Ear1 = {
			{ Name = "Drone Earring", Level = 35 }, -- 3 Agi
		},
		Ear2 = {
			{ Name = "Drone Earring", Level = 35 }, -- 3 Agi
		},

		Body = {
			{ Name = "Asn. Vest +1",       Level = 75 }, -- 5 Agi
			{ Name = "Brigadine +1",       Level = 45 }, -- 3 Dex, 3 Agi, 3 Str, 4 Attk
			{ Name = "Garrison Tunica +1", Level = 20 }, -- 2 Dex

		},
		hands = {
			"Rog. Armlets +1", "Raptor Gloves", "Noct Gloves"
		},
		Ring1 = {
			"Rajas Ring"
		},
		Ring2 = {
			"Zilant Ring"
		},
		Back = {
			"Assassin's Cape"
		},
		Waist = {
			"Warwolf Belt", "Ryl.Kgt. Belt", "Mrc.Cpt. Belt"
		},
		Legs = {
			"Adhemar Kecks", "Garrison Hose +1"
		},
		Feet = {
			"Adhemar Gamashes"
		},
	},
	SA_Priority = {
		Head = {
			{ Name = "Adhemar Bonnet",  Level = 75 }, -- 6 Dex, 6 Agi, 3 Crit
			{ Name = "Optical Hat",     Level = 70 }, -- 3 Dex, 3 Agi, 10 Acc
			{ Name = "Empress Hairpin", Level = 24 }, -- 3 Dex, 3 Agi, 10 evasion
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
			{ Name = "Garrison Tunica +1", Level = 20 }, -- 2 Dex
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
			{ Name = "Adhemar Kecks",    Level = 75 }, -- 4 Dex, 4 Agi, 10 Dagger
			{ Name = "Garrison Hose +1", Level = 20 }, -- 2 Dex, 2 Str
		},
		Feet = {
			{ Name = "Adsilio Boots +1", Level = 75 }, -- 5 Dex, 5 Agi, 3 Acc
			{ Name = "Leaping Boots",    Level = 7 }, -- 3 Dex, 3 Agi
		},
	},
	TA_Priority = {
		Head = {
			{ Name = "Dragon Cap",      Level = 73 }, -- 6 Dex, 4 Dagger
			{ Name = "Optical Hat",     Level = 70 }, -- 3 Dex, 3 Agi, 10 Acc
			{ Name = "Empress Hairpin", Level = 24 }, -- 3 Dex, 3 Agi, 10 evasion
		},
		Neck = {
			{ Name = "Rabbit Charm", Level = 21 }, -- 2 Agi
		},
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
			{ Name = "Ryl.Kgt. Belt", Level = 50 }, -- 2 Dex, 2 Agi, 2 Str
			{ Name = "Leather Belt",  Level = 7 }, -- 1 Agi
		},
		Legs = {
			{ Name = "Adhemar Kecks",    Level = 75 }, -- 4 Dex, 4 Agi, 10 Dagger
			{ Name = "Rogue's Culottes", Level = 56 }, -- 4 Agi
			{ Name = "Dino Trousers",    Level = 48 }, -- 4 Agi, 5 Acc
			{ Name = "Noct Brais",       Level = 30 }, -- 2 Agi, 2 Acc
		},
		Feet = {
			{ Name = "Adsilio Boots +1", Level = 75 }, -- 5 Dex, 5 Agi, 3 Acc
			{ Name = "Dino Ledelsens",   Level = 48 }, -- 4 Agi
			{ Name = "Leaping Boots",    Level = 7 }, -- 3 Dex, 3 Agi
		},
	},
	TH = {},
	Flee_Priority = {
		Feet = {
			{ Name = "Rog. Poulaines +1", Level = 74 },
		},
	},
	Hide_Priority = {
		Body = {
			{ Name = "Rog. Vest +1", Level = 74 },
		},
	},
	Steal = {
		Head = "Rogue's Bonnet", -- +1steal
		Neck = "Rabbit Charm",  -- +1steal
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
		-- put on the default WS set
		gFunc.EquipSet(sets.Ws_Default)
		-- check for WS specific stats-set
		-- Weaponskill based on DEX
		if string.match(ws.Name, "Wasp") or
			string.match(ws.Name, "Viper") or
			string.match(ws.Name, "Evisceration") or
			string.match(ws.Name, "Mandalic")
		then
			gFunc.EquipSet(sets.DEX_Set)
			-- Weaponskill based on AGI
		elseif string.match(ws.Name, "Exenterator") then
			gFunc.EquipSet(sets.AGI_Set)
		end
		-- depending on Sneak Attack or Trick Attack put the corresponding set on top
		if (sa == 1) and (ta == 1) then
			gFunc.EquipSet(sets.SATA)
		elseif sa == 1 then
			gFunc.EquipSet(sets.SA)
		elseif ta == 1 then
			gFunc.EquipSet(sets.TA)
		end
	end
end

return profile
