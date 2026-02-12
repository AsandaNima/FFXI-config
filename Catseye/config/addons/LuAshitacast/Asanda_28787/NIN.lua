local profile = {}
gcinclude = gFunc.LoadFile("common\\gcinclude.lua")

local Settings = {
	CurrentLevel = 0,
}

local sets = {
	Idle = {
		head = "Ninja Hatsuburi",
		body = "Ninja Chainmail",
		hands = "Ninja Tekko",
		legs = "Ninja Hakama",
		feet = "Ninja Kyahan",

	},
	Resting = {},
	Idle_Regen_Priority = {
		Body = { "Scorpion Harness" },
	},
	Idle_Refresh = {},
	Town = {},

	Dt = {},

	Tp_Default_Priority = {
		Head = { "Yagudo Crown", "Optical Hat", "Heroic Hairpin", "Empress Hairpin", "Garrison Sallet +1" },
		Neck = { "Peacock Charm", "Spike Necklace", "Pile Chain" },
		Ear1 = { "Brutal earring", "Pigeon Earring", "Optical Earring" },
		Ear2 = { "Suppanomimi", "Pigeon Earring", "Tribal Earring" },

		Body = { "Scorpion Harness", "Shinobi Gi", "Soil Gi +1", "Garrison Tunica +1", "Leather Vest", "Mithran Separates" },
		Hands = { "Shinobi Tekko +1", "Soil Tekko +1", "Guerilla Gloves", "Mithran Gauntlets" },
		Ring1 = { "Zilant Ring", "Sniper's Ring", "Archer's Ring", "Balance Ring +1", "Bastokan Ring" },
		Ring2 = { "Sniper's Ring", "Archer's Ring", "Balance Ring +1", "San d'Orian Ring" },

		Back = { "Nomad's Mantle" },
		Waist = { "Ninurta's Sash", "Swift Belt", "Tilt Belt", "Lizard Belt", "Leather Belt" },
		Legs = { "Shinobi Hakama", "Jujitsu Sitabaki", "Soil Sitabaki +1", "Garrison Hose +1", "Phl. Trousers", "Mithran Loincloth" },
		Feet = { "Fuma Kyahan", "Savage Gaiters", "Leaping Boots", "Mithran Gaiters" },
	},
	Tp_Hybrid = {},
	Tp_Acc = {},
	Tp_Proc = {},

	Precast_Priority = {
		Head = { "Optical Hat", "Heroic Hairpin" },
		Waist = { "Swift Belt" },
		Feet = { "Dino Ledelsens", "Fuma Kyahan" },
	},

	Utsu_Priority = {
	},
	Nuke = {
		Head = "Ninja Hatsuburi",
		Ear1 = "Moldavite Earring",
	},
	Macc = {
		Head = "Ninja Hatsuburi",
	},

	Preshot = {},
	Midshot = {},

	Ws_Default_Priority = {
		Head = { "Optical Hat", "Empress Hairpin" },
		Neck = { "Fotia Gorget", "Spike Necklace" },
		Ear1 = { "Brutal earring", "Minuet Earring", "Pigeon Earring" },
		Ear2 = { "Outlaw's Earring", "Pigeon Earring" },

		Body = { "Brigandine +1", "Soil Gi +1", "Garrison Tunica +1" },
		Hands = { "Ochiudo's Kote", "Soil Tekko +1", "Shade Gloves", "Cotton Tekko", "Guerilla Gloves" },
		Ring1 = { "Zilant Ring", "Balance Ring +1", "Bastokan Ring" },
		Ring2 = { "Rajas Ring", "Balance Ring +1", "San d'Orian Ring" },

		Back = { "Amemet Mantle +1", "Exile's Cloak", "Ram Mantle", "Lizard Mantle" },
		Waist = { "Warwolf Belt", "Ryl.Kgt. Belt", "Lizard Belt" },
		Legs = { "Jujitsu Sitabaki", "Garrison Hose +1", "Phl. Trousers" },
		Feet = { "Shinobi Kyahan", "Leaping Boots" },
	},
	Ws_Hybrid = {},
	Ws_Acc = {},
	Ws_Proc = {},

	Hi_Default = {},
	Hi_Hybrid = {},
	Hi_Acc = {},

	Metsu_Default = {},
	Metsu_Hybrid = {},
	Metsu_Acc = {},

	Shun_Default = {},
	Shun_Hybrid = {},
	Shun_Acc = {},

	Chi_Default = {},
	Chi_Hybrid = {},
	Chi_Acc = {},

	Enmity_Priority = {},

	Futae = {},
	Yonin = {},
	Innin = {},
	Migawari = {},
	Mijin = {},
	TH = {},
	Movement = {},
	Movement_Night = {
		Feet = "Ninja Kyahan",
	},
	Relic = {
		head = "Koga Hatsuburi",
		body = "Koga Chainmail",
		hands = "Koga Tekko",
		legs = "Koga Hakama",
		feet = "Koga Kyahan",
		waist = "Koga Sarashi",
	},
	Artifact = {
		head = "Ninja Hatsuburi",
		body = "Ninja Chainmail",
		hands = "Ninja Tekko",
		legs = "Ninja Hakama",
		feet = "Ninja Kyahan",
	},

}
profile.Sets = sets

profile.Packer = {
	{ Name = "Toolbag (Ino)",   Quantity = "all" },
	{ Name = "Toolbag (Shika)", Quantity = "all" },
	{ Name = "Toolbag (Cho)",   Quantity = "all" },
	{ Name = "Toolbag (Shihe)", Quantity = "all" },
	{ Name = "Shihei",          Quantity = "all" },
	{ Name = "Inoshishinofuda", Quantity = "all" },
	{ Name = "Chonofuda",       Quantity = "all" },
	{ Name = "Shikanofuda",     Quantity = "all" },
	{ Name = "Forbidden Key",   Quantity = "all" },
	{ Name = "Date Shuriken",   Quantity = "all" },
}

profile.OnLoad = function()
	gSettings.AllowAddSet = true
	gcinclude.Initialize()

	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 10")
	AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1")

	AshitaCore:GetChatManager():QueueCommand(-1, "/bind F9 /yonin")
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
	local game = gData.GetEnvironment()
	local yonin = gData.GetBuffCount("Yonin")
	local innin = gData.GetBuffCount("Innin")
	local migawari = gData.GetBuffCount("Migawari")

	if player.Status == "Engaged" then
		gFunc.EquipSet(sets.Tp_Default)
		if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
			gFunc.EquipSet("Tp_" .. gcdisplay.GetCycle("MeleeSet"))
		end
		if player.MainJobSync >= 40 then
			if yonin == 0 and innin == 0 then
				if gcinclude.Yonin then
					AshitaCore:GetChatManager():QueueCommand(1, '/ja "Yonin" <me>')
				else
					AshitaCore:GetChatManager():QueueCommand(1, '/ja "Innin" <me>')
				end
			end
		end
		if yonin > 0 then
			gFunc.EquipSet(sets.Yonin)
		elseif innin > 0 then
			gFunc.EquipSet(sets.Innin)
		end
		if gcdisplay.GetToggle("TH") == true then
			gFunc.EquipSet(sets.TH)
		end
		if gcdisplay.GetToggle("PROC") == true then
			gFunc.EquipSet(sets.Tp_Proc)
		end
	elseif player.Status == "Resting" then
		gFunc.EquipSet(sets.Resting)
	elseif player.IsMoving == true then
		if (game.Time < 6.00) or (game.Time > 18.00) then
			gFunc.EquipSet(sets.Movement_Night)
		else
			gFunc.EquipSet(sets.Movement)
		end
		--check if range is empty, if it is fill up ammo with shuriken based on level
	end

	gcinclude.CheckDefault()
	if gcdisplay.GetToggle("DTset") == true then
		gFunc.EquipSet(sets.Dt)
	end
	if migawari > 0 then
		gFunc.EquipSet(sets.Migawari)
	end
	if gcdisplay.GetToggle("Kite") == true then
		if (game.Time < 6.00) or (game.Time > 18.00) then
			gFunc.EquipSet(sets.Movement_Night)
		else
			gFunc.EquipSet(sets.Movement)
		end
	end
end

profile.HandleAbility = function()
	local ability = gData.GetAction()

	if string.match(ability.Name, "Provoke") then
		gFunc.EquipSet(sets.Enmity)
	elseif string.match(ability.Name, "Mijin Gakure") then
		gFunc.EquipSet(sets.Mijin)
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
	-- handle levelsync
	local player = gData.GetPlayer()
	local myLevel = player.MainJobSync

	if myLevel ~= Settings.CurrentLevel then
		gFunc.EvaluateLevels(profile.Sets, myLevel)
		Settings.CurrentLevel = myLevel
	end

	local spell = gData.GetAction()
	-- 	gcinclude.DoShadows(spell)

	gFunc.EquipSet(sets.Precast)
	gcinclude.CheckCancels()
end

profile.HandleMidcast = function()
	-- handle levelsync
	local player = gData.GetPlayer()
	local myLevel = player.MainJobSync
	local spell = gData.GetAction()

	if myLevel ~= Settings.CurrentLevel then
		gFunc.EvaluateLevels(profile.Sets, myLevel)
		Settings.CurrentLevel = myLevel
	end

	gFunc.EquipSet(sets.Macc)

	if spell.Skill == "Ninjutsu" then
		if string.contains(spell.Name, "Utsusemi") then
			gFunc.EquipSet(sets.Utsu)
		elseif gcinclude.NinNukes:contains(spell.Name) then
			gFunc.EquipSet(sets.Nuke)
		else
			gFunc.EquipSet(sets.Macc)
		end
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

		gFunc.EquipSet(sets.Ws_Default)
		if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
			gFunc.EquipSet("Ws_" .. gcdisplay.GetCycle("MeleeSet"))
		end

		if string.match(ws.Name, "Blade: Hi") then
			gFunc.EquipSet(sets.Hi_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Hi_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		elseif string.match(ws.Name, "Blade: Metsu") then
			gFunc.EquipSet(sets.Metsu_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Metsu_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		elseif string.match(ws.Name, "Blade: Shun") then
			gFunc.EquipSet(sets.Shun_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Shun_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		elseif
			string.match(ws.Name, "Blade: Chi")
			or string.match(ws.Name, "Blade: Teki")
			or string.match(ws.Name, "Blade: To")
		then
			gFunc.EquipSet(sets.Chi_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Chi_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		end
	end
end

return profile
