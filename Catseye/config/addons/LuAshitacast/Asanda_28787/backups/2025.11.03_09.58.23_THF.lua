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
	Idle_Regen = {},
	Idle_Refresh = {},
	Town = {},
	Dt = {},
	Tp_Default_Priority = {
		Head = { "Yagudo Crown", "Adhemar Bonnet", "Empress hairpin", "Garrison Sallet +1", "Cmp. Eye Circlet" },
		Neck = { "Peacock Charm", "Pile Chain" },
		Ear1 = { "Brutal Earring", "Outlaw's Earring", "Pigeon Earring" },
		Ear2 = { "Suppanomimi", "Pigeon Earring", "Optical Earring" },

		Body = { "Adhemar Jacket", "Dino Jerkin", "Garrison Tunica +1", "Leather Vest", "Mithran Separates" },
		Hands = { "Adhemar Wristbands", "Battle Gloves", "Mithran Gauntlets" },
		Ring1 = { "Rajas Ring", "Archer's Ring", "Balance Ring +1" },
		Ring2 = { "Zilant Ring", "Ulthalam's Ring", "Archer's Ring", "Balance Ring +1" },

		Back = { "Assassin's Cape", "Ram Mantle", "Traveler's Mantle" },
		Waist = { "Ninurta's Sash", "Virtuoso Belt", "Tilt Belt", "Leather Belt" },
		Legs = { "Adhemar Kecks", "Garrison Hose", "Phl. Trousers", "Mithran Loincloth" },
		Feet = { "Adhemar Gamashes", "Leaping Boots", "Mithran Gaiters" },
	},
	Tp_Hybrid_Priority = {},
	Tp_Acc_Priority = {},
	Precast = {
		Head = "Yagudo Crown",
		Neck = { "Peacock Charm" },
		Body = "Adhemar Jacket",
		Hands = "Adhemar Wristbands",
		Waist = "Ninurta's Sash",
		Legs = "Adhemar Kecks",
	},
	Preshot_Priority = {
		Head = { "Adhemar Bonnet" },
		Ring1 = { "Prouesse Ring", "Marid Ring", "Archer's Ring" },
		Ring2 = { "Marid Ring", "Archer's Ring" },
	},
	Midshot = {},
	Ws_Default_Priority = {
		Head = "Adhemar Bonnet",
		Neck = "Fotia Gorget",
		Ear2 = "Outlaw's Earring",

		Body = "Adhemar Jacket",
		Hands = "Adhemar Wristbands",
		Ring1 = "Rajas Ring",
		Ring2 = "Zilant Ring",

		Back = "Assassin's Cape",
		Waist = "Warwolf Belt",
		Legs = "Adhemar Kecks",
		Feet = "Adhemar Gamashes",
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
	Ws_Default_TA_Priority = {},
	Ws_Default_SATA_Priority = {},
	Ws_Hybrid_Priority = {},
	Ws_Hybrid_SA_Priority = {
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
	Ws_Hybrid_TA_Priority = {},
	Ws_Hybrid_SATA_Priority = {},
	Ws_Acc_Priority = {},
	Ws_Acc_SA_Priority = {},
	Ws_Acc_TA_Priority = {},
	Ws_Acc_SATA_Priority = {},
	Evis_Default = {},
	Evis_Default_SA = {},
	Evis_Default_TA = {},
	Evis_Default_SATA = {},
	Evis_Hybrid = {},
	Evis_Hybrid_SA = {},
	Evis_Hybrid_TA = {},
	Evis_Hybrid_SATA = {},
	Evis_Acc = {},
	Evis_Acc_SA = {},
	Evis_Acc_TA = {},
	Evis_Acc_SATA = {},
	Exent_Default = { -- AGI > attak >rest
		Head = "Adhemar Bonnet",
		Ring1 = "Sattva Ring",
	},
	Exent_Default_SA = {},
	Exent_Default_TA = {},
	Exent_Default_SATA = {},
	Exent_Hybrid = {},
	Exent_Hybrid_SA = {},
	Exent_Hybrid_TA = {},
	Exent_Hybrid_SATA = {},
	Exent_Acc = {},
	Exent_Acc_SA = {},
	Exent_Acc_TA = {},
	Exent_Acc_SATA = {},
	SATA_Priority = {
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
	SA_Priority = {
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
	TA_Priority = {},
	TH = {},
	Flee = {
		Feet = "Rogue's Poulaines",
	},
	Hide = {
		Body = "Rogue's Vest",
	},
	Steal = {
		Head = "Rogue's Bonnet", -- +1steal",
		Hands = "Rogue's Armlets",
		Ring2 = "Rogue's Ring", -- +3steal
		Legs = "Assassin's Culottes", -- +5steal
		Feet = "Rogue's Poulaines", -- +2steal
	},
	Mug = {
		Head = "Asn. Bonnet +1", -- +1mug
		Ear1 = "Bandit's Earring",
	},
	Movement = {},
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
