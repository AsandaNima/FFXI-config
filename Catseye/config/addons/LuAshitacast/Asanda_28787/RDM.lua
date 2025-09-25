local profile = {}
gcinclude = gFunc.LoadFile("common\\gcinclude.lua")

local Settings = {
	CurrentLevel = 0,
}

local sets = {
	Idle_Priority = {
		Main = "Earth Staff",
		Head = { "Gambler's Chapeau" },
		Ear1 = { "Pigeon Earring" },
		Ear2 = { "Pigeon Earring" },

		Hands = { "Savage Gauntlets", "Garrison gloves +1" },
		Legs = { "Savage Loincloth" },
		Feet = { "Sandals" },
	},
	Resting_Priority = {
		Main = { "Iridal Staff", "Pilgrim's Wand" },
		--         Body = "Seer's Tunic",
		Legs = "Baron's Slops",
	},
	Idle_Regen = {
		Head = "Garrison Sallet +1",
	},
	Idle_Refresh = {
		Body = "Garrison Tunica +1",
	},
	Town = {},

	Dt_Priority = {
		--         Sub = 'Genmei Shield',
		--         Ammo = 'Staunch Tathlum',
		--         Head = 'Malignance Chapeau',
		--         Neck = { Name = 'Loricate Torque +1', AugPath='A' },
		--         Ear1 = { Name = 'Odnowa Earring +1', AugPath='A' },
		--         Ear2 = 'Etiolation Earring',
		--         Body = 'Nyame Mail',
		--         Hands = 'Malignance Gloves',
		--         Ring1 = 'Defending Ring',
		--         Ring2 = { Name = 'Gelatinous Ring +1', AugPath='A' },
		--         Back = 'Solemnity Cape',
		--         Waist = 'Flume Belt +1',
		--         Legs = { Name = 'Carmine Cuisses +1', AugPath='D' },
		--         Feet = 'Nyame Sollerets',
	},

	Tp_Default_Priority = {
		Head = { "Cmp. Eye Circlet" },
		Neck = { "Pile Chain" },
		Ear1 = { "Pigeon Earring", "Optical Earring" },
		Ear2 = { "Pigeon Earring" },

		Body = { "Robe", "Rambler's Cloak", "Mithran Separates" },
		Hands = { "Linen Cuffs", "Gloves", "Mithran Gauntlets" },
		Ring1 = { "Bastokan Ring" },
		Ring2 = { "San d'Orian Ring" },

		Back = { "Mist Silk Cape" },
		Legs = { "Mithran Loincloth" },
		Feet = { "Mithran Gaiters" },
	},
	Tp_Hybrid = {
		Ring1 = "Defending Ring",
	},
	Tp_Acc = {
		Ring1 = "Cacoethic Ring +1",
		Ring2 = "Chirich Ring +1",
	},

	Precast_Priority = { --30 from traits, 53 from gear
		Head = { "Entrancing Ribbon" },
		Legs = { "Garrison Hose +1" },
	},
	Cure_Precast = {},
	Enhancing_Precast = {
		Head = { "Garrison Sallet +1" },
		Neck = { "Justice Badge" },

		--         Body = {"Seer's Tunic"},
		Hands = { "Savage gauntlets" },
		Ring1 = { "Saintly Ring" },
		Ring2 = { "Saintly Ring" },

		Waist = { "Friar's rope" },
		Legs = { "Savage Loincloth" },
		--         Feet = {"Seer's Pumps"},
	},
	Stoneskin_Precast = {},

	Cure_Priority = { --I cap is 50, II cap is 30
		Main = { "Iridal Staff" },
		Head = { "Seer's Crown", "Garrison Sallet +1" },
		Neck = { "Justice Badge" },

		--         Body = {"Seer's Tunic"},
		Hands = { "Savage gauntlets" },
		Ring1 = { "Saintly Ring" },
		Ring2 = { "Saintly Ring" },

		Waist = { "Friar's rope" },
		Legs = { "Savage Loincloth" },
		--         Feet = {"Seer's Pumps"},
	},
	Self_Cure = { --cap 30
	},
	Regen_Priority = {},
	Cursna = {},

	Enhancing_Priority = {
		Head = { "Garrison Sallet +1" },
		Neck = { "Justice Badge" },

		--         Body = {"Seer's Tunic"},
		Hands = { "Savage gauntlets" },
		Ring1 = { "Saintly Ring" },
		Ring2 = { "Saintly Ring" },

		Waist = { "Friar's rope" },
		Legs = { "Savage Loincloth" },
		--         Feet = {"Seer's Pumps"},
	},
	Self_Enhancing = {},
	Skill_Enhancing = {},
	Stoneskin_Priority = {},
	Phalanx_Priority = {},
	Refresh_Priority = {},
	Self_Refresh = {},

	Enfeebling_Priority = {
		Main = { "Iridal Staff" },
		Head = { "Seer's Crown", "Garrison Sallet +1" },
		Neck = { "Justice Badge" },

		--         Body = {"Seer's Tunic"},
		Hands = { "Savage gauntlets" },
		Ring1 = { "Saintly Ring" },
		Ring2 = { "Saintly Ring" },

		Waist = { "Friar's rope" },
		Legs = { "Savage Loincloth" },
		--         Feet = {"Seer's Pumps"},
	},
	EnfeeblingACC_Priority = {},
	Mind_Enfeebling_Priority = {},
	Int_Enfeebling_Priority = {},
	Potency_Enfeebling_Priority = {},

	Drain_Priority = { --INT and acc
	},

	Nuke_Priority = {
		Main = { "Iridal Staff" },
		Head = { "Gambler's Chapeau" },
		Hands = { "Garrison Gloves +1" },
		Ring1 = { "Windurstian Ring" },
		Ring2 = { "Hermit's Ring" },
		--         Legs = {"Seer's Slacks"},
		Feet = { "Garrison boots +1" },
	},
	NukeACC_Priority = {},
	Burst_Priority = {},
	Helix = {},
	Mp_Body = {
		--         Body = 'Seidr Cotehardie',
	},

	Preshot = {},
	Midshot = {},

	Ws_Default_Priority = {},
	Ws_Hybrid = {},
	Ws_Acc = {},

	Savage_Default = {},
	Savage_Hybrid = {},
	Savage_Acc = {},

	Chant_Default = {},
	Chant_Hybrid = {},
	Chant_Acc = {},

	CS = {
		-- 		Body = 'Viti. Tabard +3',
	},
	TH = {},
	Movement = {
		--         Legs = 'Carmine Cuisses +1',
	},
}
profile.Sets = sets

profile.Packer = {
	{ Name = "Tropical Crepe", Quantity = "all" },
	{ Name = "Rolan. Daifuku", Quantity = "all" },
}

profile.OnLoad = function()
	gSettings.AllowAddSet = true
	gcinclude.Initialize()

	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 3")
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

	gFunc.EquipSet(sets.Idle)

	local player = gData.GetPlayer()
	if player.Status == "Engaged" then
		gFunc.EquipSet(sets.Tp_Default)
		if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
			gFunc.EquipSet("Tp_" .. gcdisplay.GetCycle("MeleeSet"))
		end
		if gcdisplay.GetToggle("TH") == true then
			gFunc.EquipSet(sets.TH)
		end
		if gcdisplay.GetToggle("Fight") == false then
			AshitaCore:GetChatManager():QueueCommand(1, "/fight")
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

	if ability.Name == "Chainspell" then
		gFunc.EquipSet(sets.CS)
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
	gFunc.EquipSet(sets.Precast)

	if spell.Skill == "Enhancing Magic" then
		gFunc.EquipSet(sets.Enhancing_Precast)

		if string.contains(spell.Name, "Stoneskin") then
			gFunc.EquipSet(sets.Stoneskin_Precast)
		end
	elseif spell.Skill == "Healing Magic" then
		gFunc.EquipSet(sets.Cure_Precast)
	end

	gcinclude.CheckCancels()
end

profile.HandleMidcast = function()
	local weather = gData.GetEnvironment()
	local spell = gData.GetAction()
	local target = gData.GetActionTarget()
	local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)
	-- handle levelsync
	local player = gData.GetPlayer()
	local myLevel = player.MainJobSync

	if myLevel ~= Settings.CurrentLevel then
		gFunc.EvaluateLevels(profile.Sets, myLevel)
		Settings.CurrentLevel = myLevel
	end

	if spell.Skill == "Enhancing Magic" then
		gFunc.EquipSet(sets.Enhancing)
		if target.Name == me then
			gFunc.EquipSet(sets.Self_Enhancing)
		end

		if string.match(spell.Name, "Phalanx") then
			gFunc.EquipSet(sets.Phalanx)
		elseif string.match(spell.Name, "Stoneskin") then
			gFunc.EquipSet(sets.Stoneskin)
		elseif string.contains(spell.Name, "Temper") then
			gFunc.EquipSet(sets.Skill_Enhancing)
		elseif string.contains(spell.Name, "Regen") then
			gFunc.EquipSet(sets.Regen)
		elseif string.contains(spell.Name, "Refresh") then
			gFunc.EquipSet(sets.Refresh)
			if target.Name == me then
				gFunc.EquipSet(sets.Self_Refresh)
			end
		elseif (target.Name == me) and string.contains(spell.Name, "En") then
			gFunc.EquipSet(sets.Skill_Enhancing)
		end
	elseif spell.Skill == "Healing Magic" then
		gFunc.EquipSet(sets.Cure)
		if target.Name == me then
			gFunc.EquipSet(sets.Self_Cure)
		end
		if string.match(spell.Name, "Cursna") then
			gFunc.EquipSet(sets.Cursna)
		end
	elseif spell.Skill == "Elemental Magic" then
		gFunc.EquipSet(sets.Nuke)

		if gcdisplay.GetToggle("NukeSet") == "Macc" then
			gFunc.EquipSet(sets.NukeACC)
		end
		if gcdisplay.GetToggle("Burst") == true then
			gFunc.EquipSet(sets.Burst)
		end
		if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
			gFunc.Equip("Waist", "Hachirin-no-Obi")
		end
		if string.match(spell.Name, "helix") then
			gFunc.EquipSet(sets.Helix)
		end
		if player.MPP <= 40 then
			gFunc.EquipSet(sets.Mp_Body)
		end
	elseif spell.Skill == "Enfeebling Magic" then
		gFunc.EquipSet(sets.Enfeebling)
		if gcdisplay.GetToggle("NukeSet") == "Macc" then
			gFunc.EquipSet(sets.EnfeeblingACC)
		end
		if
			string.contains(spell.Name, "Paralyze")
			or string.contains(spell.Name, "Slow")
			or string.contains(spell.Name, "Addle")
		then
			gFunc.EquipSet(sets.Mind_Enfeebling)
		elseif string.contains(spell.Name, "Poison") then
			gFunc.EquipSet(sets.Int_Enfeebling)
		elseif string.contains(spell.Name, "Distract") or string.match(spell.Name, "Frazzle III") then
			gFunc.EquipSet(sets.Potency_Enfeebling)
		end
	elseif spell.Skill == "Dark Magic" then
		gFunc.EquipSet(sets.EnfeeblingACC) -- mostly MACC anyways
		if string.contains(spell.Name, "Aspir") or string.contains(spell.Name, "Drain") then
			gFunc.EquipSet(sets.Drain)
		end
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

		if string.match(ws.Name, "Chant du Cygne") then
			gFunc.EquipSet(sets.Chant_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Chant_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		elseif string.match(ws.Name, "Savage Blade") then
			gFunc.EquipSet(sets.Savage_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Savage_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		end
	end
end

return profile
