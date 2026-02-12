local profile = {}
gcinclude = gFunc.LoadFile("common\\gcinclude.lua")
local Settings = {
	CurrentLevel = 0,
}
local sets = {
	Idle = {},
	Resting = {},
	Idle_Regen = {
		body = "Myn. Domaru +1",
		hands = "Ryuo Tekko",
	},
	Idle_Refresh = {},
	Town = {},

	Dt = {},

	Tp_Default_Priority = {
		Head = {
			"Ryuo Somen", --5% haste
			"Yagudo Crown", "Optical Hat", "Empress Hairpin", "Garrison Sallet +1" },
		Neck = { "Peacock Charm", "Spike Necklace", "Armiger's Lace", "Pile Chain" },
		Ear1 = { "Brutal earring", -- 1DA 1STP
			"Pigeon Earring", "Optical Earring" },
		Ear2 = { "Bushinomimi", "Aesir Ear Pendant", "Pigeon Earring", "Tribal Earring" },

		Body = { "Ryuo Domaru", "Shinobi Gi", "Brigandine +1", "Soil Gi +1", "Garrison Tunica +1", "Solid Mail", "Leather Vest", "Mithran Separates" },
		Hands = { "Shinobi Tekko", "Soil Tekko +1", "Guerilla Gloves", "Mithran Gauntlets" },
		Ring1 = { "Rajas Ring", -- 5STP
			"Sniper's Ring", "Archer's Ring", "Balance Ring +1", "Bastokan Ring" },
		Ring2 = { "Sniper's Ring", "Archer's Ring", "Balance Ring +1", "San d'Orian Ring" },

		Back = { "Exile's Cloak", "Ram Mantle", "Lizard Mantle" },
		Waist = { "Ninurta's Sash", -- 6% haste
			"Swift Belt", "Tilt Belt", "Lizard Belt", "Leather Belt" },
		Legs = { "Myn. Haidate +1", -- 5% haste 9STP
			"Ryuo Hakama", "Shinobi Hakama", "Jujitsu Sitabaki", "Soil Sitabaki +1", "Garrison Hose +1", "Phl. Trousers",
			"Solid Cuisses", "Mithran Loincloth" },
		Feet = { "Ryuo Sune-Ate", -- 3% haste
			"Fuma Kyahan", "Savage Gaiters", "Leaping Boots", "Mithran Gaiters" },
	},
	Tp_Hybrid = {},
	Tp_Acc = {},
	Tp_Proc = {},

	Precast_Priority = {
		head = { "Ryuo Somen" },
		Waist = { "Ninurta's Sash", "Swift Belt" },
		Feet = { "Ryuo Sune-Ate", "Fuma Kyahan" },
	},

	Cure = {},

	Enhancing = {},

	Preshot_Priority = {
		Back = { "Frugal Cape" },
	},
	Midshot_Priority = {
		Head = { "Optical Hat" },
		Neck = { "Peacock Charm" },

		Ring1 = { "Marid Ring" },
		Ring2 = { "Marid Ring" },

		Back = { "Jaeger Mantle", "Sniper's Shroud" },
		Waist = { "Sao. Koshi-ate" },
	},

	Ws_Default_Priority = {
		Head = { "Myn. Kabuto +1", "Shade Tiara" },
		Neck = { "Spike Necklace", "Armiger's Lace" },
		Ear1 = { "Pigeon Earring" },
		Ear2 = { "Pigeon Earring" },
		Body = { "Ryuo Domaru", "Brigandine +1", "Savage Separates" },
		Hands = { "Ochiudo's Kote", "Shade Mittens", "Cotton Tekko" },
		Ring1 = { "Rajas Ring", "Courage Ring +1" },
		Ring2 = { "Courage Ring +1", "San d'Orian Ring" },
		Back = { "Charger Mantle", "Earth Mantle", "Lizard Mantle" },
		Waist = { "Warwolf Belt", "Ryl.Kgt. Belt", "Plate Belt" },
		Legs = { "Ryuo Hakama", "Shade Tights", "Garrison Hose +1", "Phl. Trousers" },
		Feet = { "Savage Gaiters" },
	},
	Ws_Hybrid = {},
	Ws_Acc = {},
	Ws_Proc = {},

	Savage_Default = {},
	Savage_Hybrid = {},
	Savage_Acc = {},

	Shoha_Default = {      --str > attack > acc >
		Head = "Myn. Kabuto +1", -- +5str
		Neck = "Fotia Gorget",
		Ear1 = "Brutal Earring", -- +5 DA
		Ear2 = "Bushinomimi", -- +2str

		body = "Myn. Domaru +1", -- +6str
		Hands = "Myn. Kote +1", -- +7str
		Ring1 = "Rajas Ring", -- +5str
		Ring2 = "Flame Ring", -- +5str

		Back = "Exile's Cloak", -- +4str
		Waist = "Warwolf Belt", -- +5str
		legs = "Ryuo Hakama", -- +5str and WS acc. Better than Haidate?
		Feet = "Savage Gaiters", -- +3str
		-- TODO: update ring2, feet
	},
	Shoha_Hybrid = {},
	Shoha_Acc = {},

	Apex_Default = {

	},
	Apex_Hybrid = {},
	Apex_Acc = {},

	Jinpu_Default = {},
	Jinpu_Hybrid = {},
	Jinpu_Acc = {},

	Ageha_Default = {},
	Ageha_Hybrid = {},
	Ageha_Acc = {},

	Stardiver_Default = {},
	Stardiver_Hybrid = {},
	Stardiver_Acc = {},

	Hasso = {},
	ThirdEye = {
		legs = "Saotome Haidate",
		feet = "Ryuo Sune-Ate",
	},
	Seigan = {},
	Sekkanoki = {},
	Sengikori = {},
	Meditate = {
		head = "Myn. Kabuto +1",
		body = "Myn. Domaru +1",
		hands = "Saotome Kote",
	},
	Meikyo = {},
	Enmity = {},

	TH = {},
	Movement = {},
	Relic = {
		head = "Saotome Kabuto",
		body = "Saotome Domaru",
		hands = "Saotome Kote",
		legs = "Saotome Haidate",
		feet = "Saotome Sune-ate",
		waist = "Sao. Koshi-ate",
	},
	Artifact = {
		head = "Myn. Kabuto +1",
		body = "Myn. Domaru +1",
		hands = "Myn. Kote +1",
		legs = "Myn. Haidate +1",
		feet = "Myn. Sune-ate +1",
	},
	Crystal_Warrior = {
		head = "Ryuo Somen",
		body = "Ryuo Domaru",
		hands = "Ryuo Tekko",
		legs = "Ryuo Hakama",
		feet = "Ryuo Sune-Ate",
	},

}
profile.Sets = sets

profile.Packer = {
	{ Name = "Red Curry Bun", Quantity = "all" },
}

profile.OnLoad = function()
	gSettings.AllowAddSet = true
	gcinclude.Initialize()

	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 18")
	AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1")

	AshitaCore:GetChatManager():QueueCommand(-1, "/bind F9 /hasso")
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
	local hasso = gData.GetBuffCount("Hasso")
	local thirdeye = gData.GetBuffCount("Third Eye")
	local seigan = gData.GetBuffCount("Seigan")

	if player.Status == "Engaged" then
		gFunc.EquipSet(sets.Tp_Default)
		if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
			gFunc.EquipSet("Tp_" .. gcdisplay.GetCycle("MeleeSet"))
		end
		-- if engaged and no Hasso or Seigan, use it accordingly
		if hasso == 0 and seigan == 0 then
			if player.MainJobSync >= 25 and gcinclude.Hasso then
				AshitaCore:GetChatManager():QueueCommand(1, '/ja "Hasso" <me>')
			elseif player.MainJobSync >= 35 and not gcinclude.Hasso then
				AshitaCore:GetChatManager():QueueCommand(1, '/ja "Seigan" <me>')
			end
		end

		if hasso >= 1 then
			gFunc.EquipSet(sets.Hasso)
		end
		if (thirdeye >= 1) and (seigan >= 1) then
			gFunc.EquipSet(sets.ThirdEye)
		elseif seigan >= 1 then
			gFunc.EquipSet(sets.Seigan)
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
	-- handle levelsync
	local player = gData.GetPlayer()
	local myLevel = player.MainJobSync

	if myLevel ~= Settings.CurrentLevel then
		gFunc.EvaluateLevels(profile.Sets, myLevel)
		Settings.CurrentLevel = myLevel
	end

	if string.match(ability.Name, "Provoke") then
		gFunc.EquipSet(sets.Enmity)
	elseif string.match(ability.Name, "Meditate") then
		gFunc.EquipSet(sets.Meditate)
	elseif string.match(ability.Name, "Third Eye") then
		gFunc.EquipSet(sets.ThirdEye)
	elseif string.match(ability.Name, "Sengikori") then
		gFunc.EquipSet(sets.Sengikori)
	elseif string.contains(ability.Name, "Meikyo") then
		gFunc.EquipSet(sets.Meikyo)
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
	-- handle levelsync
	local player = gData.GetPlayer()
	local myLevel = player.MainJobSync

	if myLevel ~= Settings.CurrentLevel then
		gFunc.EvaluateLevels(profile.Sets, myLevel)
		Settings.CurrentLevel = myLevel
	end

	gFunc.EquipSet(sets.Precast)

	gcinclude.CheckCancels()
end

profile.HandleMidcast = function()
	local spell = gData.GetAction()
	-- handle levelsync
	local player = gData.GetPlayer()
	local myLevel = player.MainJobSync

	if myLevel ~= Settings.CurrentLevel then
		gFunc.EvaluateLevels(profile.Sets, myLevel)
		Settings.CurrentLevel = myLevel
	end

	if spell.Skill == "Enhancing Magic" then
		gFunc.EquipSet(sets.Enhancing)
	elseif spell.Skill == "Healing Magic" then
		gFunc.EquipSet(sets.Cure)
	end
	if gcdisplay.GetToggle("TH") == true then
		gFunc.EquipSet(sets.TH)
	end
end

profile.HandlePreshot = function()
	-- handle levelsync
	local player = gData.GetPlayer()
	local myLevel = player.MainJobSync

	if myLevel ~= Settings.CurrentLevel then
		gFunc.EvaluateLevels(profile.Sets, myLevel)
		Settings.CurrentLevel = myLevel
	end

	gFunc.EquipSet(sets.Preshot)
end

profile.HandleMidshot = function()
	-- handle levelsync
	local player = gData.GetPlayer()
	local myLevel = player.MainJobSync

	if myLevel ~= Settings.CurrentLevel then
		gFunc.EvaluateLevels(profile.Sets, myLevel)
		Settings.CurrentLevel = myLevel
	end

	gFunc.EquipSet(sets.Midshot)
end

profile.HandleWeaponskill = function()
	local meikyo = gData.GetBuffCount("Meikyo Shisui")
	local sekkanoki = gData.GetBuffCount("Sekkanoki")
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

		if string.match(ws.Name, "Savage Blade") then
			gFunc.EquipSet(sets.Savage_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Savage_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		elseif string.match(ws.Name, "Tachi: Jinpu") then
			gFunc.EquipSet(sets.Jinpu_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Jinpu_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		elseif string.match(ws.Name, "Tachi: Shoha") then
			gFunc.EquipSet(sets.Shoha_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Shoha_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		elseif string.match(ws.Name, "Apex Arrow") then
			gFunc.EquipSet(sets.Apex_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Apex_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		elseif string.match(ws.Name, "Tachi: Ageha") then
			gFunc.EquipSet(sets.Ageha_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Ageha_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		elseif string.match(ws.Name, "Stardiver") then
			gFunc.EquipSet(sets.Stardiver_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Stardiver_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		end

		if meikyo >= 1 then
			gFunc.EquipSet(sets.Meikyo)
		end
		if sekkanoki >= 1 then
			gFunc.EquipSet(sets.Sekkanoki)
		end
	end
end

return profile
