local profile = {}
gcinclude = gFunc.LoadFile("common\\gcinclude.lua")
local Settings = {
	CurrentLevel = 0,
}
local sets = {
	Idle = {
	},
	Resting = {},
	Idle_Regen = {
	},
	Idle_Refresh = {
	},
	Town = {
	},

	Dt = {
	},

	Tp_Default_Priority = {
		Head = { "Noct Beret", "Empress Hairpin", "Garrison Sallet +1", "Fungus Hat", "Cmp. Eue Circlet" },
		Neck = { "Peacock Charm", "Spike Necklace", "Armiger's Lace", "Pile Chain" },
		Ear1 = { "Brutal earring", "Pigeon Earring", "Optical Earring" },
		Ear2 = { "Pigeon Earring", "Tribal Earring" },
		Body = { "Scorpion Harness", "Brigandine +1", "Garrison Tunica +1", "Solid Mail", "Leather Vest", "Blksmith. Smock" },
		Hands = { "Guerilla Gloves", "Smithy's Mitts" },
		Ring1 = { "Zilant Ring", "Sniper's Ring", "Archer's Ring", "Balance Ring +1", "Bastokan Ring" },
		Ring2 = { "Sniper's Ring", "Archer's Ring", "Balance Ring +1", "San d'Orian Ring" },
		Back = { "Nomad's Mantle" },
		Waist = { "Swift Belt", "Leather Belt", "Bronze Bandolier" },
		Legs = { "Noct Brais", "Garrison Hose +1", "Phl. Trousers", "Solid Cuisses", "Mithran Loincloth" },
		Feet = { "Leaping Boots", "Mithran Gaiters" },
	},
	Tp_Hybrid = {
	},
	Tp_Acc = {
	},

	Precast = {
	},

	Cure = {
	},

	Enhancing = {
	},

	Enfeebling = {
	},
	Macc = {},

	Drain = {
	},

	Nuke = {
	},

	Preshot_Priority = { --base preshot, no flurry, 70cap, 10 from gifts
		Back = { "Frugal cape" },
	},
	Preshot_FlurryI = { --with flurry I on, gives 15, 10 from gifts
	},
	Preshot_FlurryII = { --with flurry II on, gives 30, 10 from gifts
	},
	Barrage = {
	},
	Midshot_Priority = {
		Neck = { "Ranger's Necklace" },
		Body = { "Noct Doublet" },
		Hands = { "Noct gloves" },
		Ring1 = { "Bone Ring +1" },
		Ring2 = { "Bone Ring +1" },

		Back = { "Sniper's Shroud" },
		Waist = { "Bronze Bandolier" },
		Legs = { "Noct Brais" },
		Feet = { "Noct Gaiters" },
	},
	DoubleShot = {},

	Ws_Default = {
	},
	Ws_Hybrid = {},
	Ws_Acc = {},
	WsObi = { --puts elemental obi on for trueflight/wildfire under light/fire situations
	},

	Savage_Default = {
	},
	Savage_Hybrid = {},
	Savage_Acc = {},
	Aedge_Default = {
	},
	Aedge_Hybrid = {},
	Aedge_Acc = {},
	TrueFlight_Default = {
	},
	TrueFlight_Hybrid = {},
	TrueFlight_Acc = {},

	Scavenge = {
	},
	Sharpshot = {
	},
	TH = {
	},
	Movement = {
	},
	Relic = {
		head = "Scouts Beret",
		body = "Scouts Jerkin",
		hands = "Scouts Bracers",
		waist = "Scouts Belt",
		legs = "Scouts Braccae",
		feet = "Scouts Socks",
	},
	Artifact = {
		head = "Hunters Beret",
		body = "Hunters Jerkin",
		hands = "Hunters Bracers",
		legs = "Hunters Braccae",
		feet = "Hunters Socks",
	},

	['upgrade'] = {
		Main = { Name = 'Beestinger', Augment = { [1] = 'Crit.hit rate+1', [2] = 'DMG:+3' } },
		Sub = 'Kupo Shield',
		Range = 'Light Crossbow +1',
		Ammo = 'Crossbow Bolt',
		Head = 'Tlahtlamah Glasses',
		Neck = 'Pile Chain',
		Body = { Name = 'Leather Vest', Augment = { [1] = 'VIT+1', [2] = 'INT+1' } },
		Hands = 'Smithy\'s Mitts',
		Ring1 = 'San d\'Orian Ring',
		Ring2 = 'Windurstian Ring',
		Back = { Name = 'Sniper\'s Shroud', Augment = { [1] = 'AGI+1', [2] = 'HP+8' } },
		Waist = 'Bronze Bandolier',
		Legs = 'Mithran Loincloth',
		Feet = 'Leaping Boots',
	},
}
profile.Sets = sets

profile.Packer = {
	{ Name = "Decimating Bullet", Quantity = "all" },
	{ Name = "Dec. Bul. Pouch",   Quantity = "all" },
}

profile.OnLoad = function()
	gSettings.AllowAddSet = true
	gcinclude.Initialize()

	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 17")
	AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1")

	gcinclude.settings.RefreshGearMPP = 35
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
	if gcdisplay.GetToggle("DTset") == true then
		gFunc.EquipSet(sets.Dt)
	end
	if gcdisplay.GetToggle("Kite") == true then
		gFunc.EquipSet(sets.Movement)
	end
end

profile.HandleAbility = function()
	local ability = gData.GetAction()

	if string.match(ability.Name, "Scavenge") then
		gFunc.EquipSet(sets.Scavenge)
	elseif string.match(ability.Name, "Sharpshot") then
		gFunc.EquipSet(sets.Sharpshot)
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
	local weather = gData.GetEnvironment()
	local spell = gData.GetAction()
	local target = gData.GetActionTarget()

	if spell.Skill == "Enhancing Magic" then
		gFunc.EquipSet(sets.Enhancing)
	elseif spell.Skill == "Healing Magic" then
		gFunc.EquipSet(sets.Cure)
	elseif spell.Skill == "Elemental Magic" then
		gFunc.EquipSet(sets.Nuke)
		if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
			gFunc.Equip("Waist", "Hachirin-no-Obi")
		end
	elseif spell.Skill == "Enfeebling Magic" then
		gFunc.EquipSet(sets.Enfeebling)
	elseif spell.Skill == "Dark Magic" then
		gFunc.EquipSet(sets.Macc)
		if string.contains(spell.Name, "Aspir") or string.contains(spell.Name, "Drain") then
			gFunc.EquipSet(sets.Drain)
		end
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

	local flurryI = gData.GetBuffCount(265)
	local flurryII = gData.GetBuffCount(581)

	gFunc.EquipSet(sets.Preshot)

	if flurryII > 0 then
		gFunc.EquipSet(sets.Preshot_FlurryII)
	elseif flurryI > 0 then
		gFunc.EquipSet(sets.Preshot_FlurryI)
	end
end

profile.HandleMidshot = function()
	-- handle levelsync
	local player = gData.GetPlayer()
	local myLevel = player.MainJobSync

	if myLevel ~= Settings.CurrentLevel then
		gFunc.EvaluateLevels(profile.Sets, myLevel)
		Settings.CurrentLevel = myLevel
	end

	local double = gData.GetBuffCount("Double Shot")
	local barrage = gData.GetBuffCount("Barrage")
	gFunc.EquipSet(sets.Midshot)

	if double > 0 then
		gFunc.EquipSet(sets.DoubleShot)
	end

	if gcdisplay.GetCycle("MeleeSet") == "Acc" then
		gFunc.EquipSet(sets.Midshot_Acc)
	end

	if barrage > 0 then --ensure acc as base if barrage up
		gFunc.EquipSet(sets.Midshot_Acc)
		gFunc.EquipSet(sets.Barrage)
	end
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
		local weather = gData.GetEnvironment()

		gFunc.EquipSet(sets.Midshot)
		gFunc.EquipSet(sets.Ws_Default)
		if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
			gFunc.EquipSet("Ws_" .. gcdisplay.GetCycle("MeleeSet"))
		end

		if string.match(ws.Name, "Savage Blade") then
			gFunc.EquipSet(sets.Savage_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Savage_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		elseif string.match(ws.Name, "Aeolian Edge") then
			gFunc.EquipSet(sets.Aedge_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Aedge_" .. gcdisplay.GetCycle("MeleeSet"))
			end
			if gcdisplay.GetCycle("MeleeSet") == "Default" then
				gcinclude.DoMoonshade()
			end
		elseif string.match(ws.Name, "True Flight") then
			gFunc.EquipSet(sets.TrueFlight_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("TrueFlight_" .. gcdisplay.GetCycle("MeleeSet"))
			end
			if gcdisplay.GetCycle("MeleeSet") == "Default" then
				gcinclude.DoMoonshade()
			end
			if weather.DayElement == "Light" or weather.RawWeatherElement == "Light" then
				gFunc.EquipSet(sets.WsObi)
			end
		elseif string.match(ws.Name, "Wildfire") then
			gFunc.EquipSet(sets.Wildfire_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Wildfire_" .. gcdisplay.GetCycle("MeleeSet"))
			end
			if gcdisplay.GetCycle("MeleeSet") == "Default" then
				gcinclude.DoMoonshade()
			end
			if weather.DayElement == "Fire" or weather.RawWeatherElement == "Fire" then
				gFunc.EquipSet(sets.WsObi)
			end
		end
	end
end

return profile
