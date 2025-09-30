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
		Ring1 = { "Serket Ring" },
		Ring2 = { "Mana Ring" },
		Hands = { "Savage Gauntlets", "Garrison gloves +1" },
		Legs = { "Savage Loincloth", "Seer's Slacks" },
		Feet = { "Sandals" },
	},
	Idle_Staff = {},
	Resting_Priority = {
		Main = { "Iridal Staff", "Pilgrim's Wand" },
		Body = "Seer's Tunic",
		Legs = "Baron's Slops",
	},
	Idle_Regen = {},
	Idle_Refresh = {},
	Town = {},

	Dt = {},

	Tp_Default_Priority = {
		Head = { "Empress hairpin", "Cmp. Eye Circlet" },
		Neck = { "Peacock Charm", "Pile Chain" },
		Ear1 = { "Pigeon Earring", "Optical Earring" },
		Ear2 = { "Pigeon Earring" },

		Body = { "Robe", "Rambler's Cloak", "Mithran Separates" },
		Hands = { "Black mitts", "Linen Cuffs", "Gloves", "Mithran Gauntlets" },
		Ring1 = { "Rajas Ring", "Archer's Ring", "Bastokan Ring" },
		Ring2 = { "Zilant Ring", "Ulthalam's Ring", "Archer's Ring", "San d'Orian Ring" },

		Back = { "Mist Silk Cape" },
		Waist = { "Ninurta's Sash", "Virtuoso Belt", "Tilt Belt", "Leather Belt" },
		Legs = { "White Slacks", "Garrison Hose +1", "Mithran Loincloth" },
		Feet = { "Garrison Boots +1", "Mithran Gaiters" },
	},
	Tp_Hybrid = {},
	Tp_Acc = {},

	Precast_Priority = { --fast cast prio
		Head = { "Entrancing Ribbon" },
		Legs = { "Garrison Hose +1" },
	},
	Cure_Precast = {},
	Enhancing_Precast = {},
	Stoneskin_Precast = {},

	Cure_Priority = { -- MND and cure extra
		Head = { "Seer's Crown", "Garrison Sallet +1" },
		Neck = { "Justice Badge" },

		Body = { "Seer's Tunic" },
		Hands = { "Savage gauntlets" },
		Ring1 = { "Saintly Ring" },
		Ring2 = { "Saintly Ring" },

		Waist = { "Friar's rope" },
		Legs = { "Savage Loincloth" },
		Feet = { "Seer's Pumps" },
	},
	Self_Cure = { --cap 30
	},
	Regen = {},
	Cursna = {},

	Enhancing_Priority = {
		Head = { "Seer's Crown", "Garrison Sallet +1" },
		Neck = { "Justice Badge" },

		Body = { "Seer's Tunic" },
		Hands = { "Savage gauntlets" },
		Ring1 = { "Saintly Ring" },
		Ring2 = { "Saintly Ring" },

		Waist = { "Friar's rope" },
		Legs = { "Savage Loincloth" },
		Feet = { "Seer's Pumps" },
	},
	Self_Enhancing = {},
	Skill_Enhancing = {},
	Stoneskin = {
		Head = { "Seer's Crown", "Garrison Sallet +1" },
		Neck = { "Justice Badge" },

		Body = { "Seer's Tunic" },
		Hands = { "Savage gauntlets" },
		Ring1 = { "Saintly Ring" },
		Ring2 = { "Saintly Ring" },

		Waist = { "Friar's rope" },
		Legs = { "Savage Loincloth" },
		Feet = { "Seer's Pumps" },
	},
	Phalanx = {},
	Refresh = {},
	Self_Refresh = {},

	Enfeebling_Priority = {
		Head = { "Seer's Crown", "Garrison Sallet +1" },
		Neck = { "Justice Badge" },

		Body = { "Seer's Tunic" },
		Hands = { "Savage gauntlets" },
		Ring1 = { "Saintly Ring" },
		Ring2 = { "Saintly Ring" },

		Waist = { "Friar's rope" },
		Legs = { "Savage Loincloth" },
		Feet = { "Seer's Pumps" },
	},

	Drain = {},

	Nuke_Priority = {
		Main = { "Iridal Staff" },
		Head = { "Gambler's Chapeau" },
		Body = { "Seer's Tunic" },
		Hands = { "Garrison Gloves +1" },
		Ring1 = { "Windurstian Ring" },
		Ring2 = { "Hermit's Ring" },
		Legs = { "Seer's Slacks" },
		Feet = { "Garrison boots +1" },
	},
	NukeACC = {
		Main = { "Iridal Staff" },
	},
	Burst = {
		Main = { "Iridal Staff" },
	},
	Helix = {
		Main = { "Iridal Staff" },
	},
	HelixBurst = {
		Main = { "Iridal Staff" },
	},
	Storm = {},
	Kaustra = { --need to refine this set
	},
	Mp_Body = {},

	Preshot = {},
	Midshot = {},

	Ws_Default = {},
	Ws_Hybrid = {},
	Ws_Acc = {},
	Mykyr_Default = {},
	Mykyr_Hybrid = {},
	Mykyr_Acc = {},
	Cataclysm_Default = {},
	Cataclysm_Hybrid = {},
	Cataclysm_Acc = {},

	Sublimation = {},
	Power = {  --rapture/ebullience
	},
	Klimaform = { --klimaform dmg boost
	},
	TH = {     --/th will force this set to equip for 10 seconds
	},
	Movement = {
		Body = "Kupo Suit",
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
	gFunc.ApplyBaseSets(profile.Sets)

	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 12")
	AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1")
end

profile.OnUnload = function()
	gcinclude.Unload()
end

profile.HandleCommand = function(args)
	gcinclude.HandleCommands(args)
end

profile.HandleDefault = function()
	local environment = gData.GetEnvironment()
	-- handle levelsync
	local player = gData.GetPlayer()
	local myLevel = player.MainJobSync

	if myLevel ~= Settings.CurrentLevel then
		gFunc.EvaluateLevels(profile.Sets, myLevel)
		Settings.CurrentLevel = myLevel
	end

	-- 	local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel()
	if myLevel ~= Settings.CurrentLevel then
		gFunc.EvaluateLevels(profile.Sets, myLevel)
		Settings.CurrentLevel = myLevel
	end

	if (gcdisplay.GetToggle("Death") == true) and (player.MPP > 50) then
		gFunc.EquipSet(sets.Death)
		return
	end

	if gcdisplay.GetCycle("craft") == "none" then
		gFunc.EquipSet(sets.Idle)
	end


	-- 	gFunc.EquipSet(sets.Idle)

	if player.Status == "Engaged" then
		gFunc.EquipSet(sets.Tp_Default)
		if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
			gFunc.EquipSet("Tp_" .. gcdisplay.GetCycle("MeleeSet"))
		end
	elseif player.Status == "Resting" then
		gFunc.EquipSet(sets.Resting)
	elseif player.IsMoving == true then
		gFunc.EquipSet(sets.Movement)
	end

	gcinclude.CheckDefault()
	if gcdisplay.GetCycle("Weapon") == "Staff" then
		gFunc.EquipSet(sets.Idle_Staff)
	end
	if gcdisplay.GetToggle("DTset") == true then
		gFunc.EquipSet(sets.Dt)
	end
	if gcdisplay.GetToggle("Kite") == true then
		gFunc.EquipSet(sets.Movement)
	end
end

profile.HandleAbility = function()
	local ability = gData.GetAction()

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

	if gcdisplay.GetToggle("Death") == true then
		gFunc.EquipSet(sets.Death)
	else
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
		if gcdisplay.GetCycle("Weapon") == "Staff" then
			gFunc.EquipSet(sets.Idle_Staff)
		end
	end
end

profile.HandleMidcast = function()
	-- handle levelsync
	local player = gData.GetPlayer()
	local myLevel = player.MainJobSync

	if myLevel ~= Settings.CurrentLevel then
		gFunc.EvaluateLevels(profile.Sets, myLevel)
		Settings.CurrentLevel = myLevel
	end
	local weather = gData.GetEnvironment()
	local spell = gData.GetAction()
	local target = gData.GetActionTarget()
	local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)
	local mw = gData.GetBuffCount("Manawell")

	if gcdisplay.GetToggle("Death") == true then
		gFunc.EquipSet(sets.Death)
		if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
			gFunc.Equip("Waist", "Hachirin-no-Obi")
		end
	else
		if spell.Skill == "Enhancing Magic" then
			gFunc.EquipSet(sets.Enhancing)
			if target.Name == me then
				gFunc.EquipSet(sets.Self_Enhancing)
			end

			if string.match(spell.Name, "Phalanx") then
				gFunc.EquipSet(sets.Phalanx)
			elseif string.match(spell.Name, "Stoneskin") then
				gFunc.EquipSet(sets.Stoneskin)
			elseif string.contains(spell.Name, "Regen") then
				gFunc.EquipSet(sets.Regen)
			elseif string.contains(spell.Name, "Refresh") then
				gFunc.EquipSet(sets.Refresh)
				if target.Name == me then
					gFunc.EquipSet(sets.Self_Refresh)
				end
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

			if gcdisplay.GetCycle("NukeSet") == "Macc" then
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
				if gcdisplay.GetToggle("Burst") == true then
					gFunc.EquipSet(sets.Burst)
				end
			end
			if (player.MPP <= 40) and (mw == 0) then
				gFunc.EquipSet(sets.Af_Body)
			end
			if string.contains(spell.Name, "ja") then
				gFunc.EquipSet(sets.EmpyLegs)
			end
		elseif spell.Skill == "Enfeebling Magic" then
			gFunc.EquipSet(sets.Enfeebling)
			if gcdisplay.GetCycle("NukeSet") == "Macc" then
				gFunc.EquipSet(sets.Macc)
			end
		elseif spell.Skill == "Dark Magic" then
			gFunc.EquipSet(sets.Macc)
			if string.contains(spell.Name, "Aspir") or string.contains(spell.Name, "Drain") then
				gFunc.EquipSet(sets.Drain)
			end
		end

		if gcdisplay.GetCycle("Weapon") == "Staff" then
			gFunc.EquipSet(sets.Idle_Staff)
		end
	end

	if player.MainJobSync >= 73 then
		if spell.Element == weather.DayElement then
			gFunc.Equip("Legs", "Sorcerer's Tonban")
		end
	end
end

profile.HandlePreshot = function()
	gFunc.EquipSet(sets.Preshot)
end

profile.HandleMidshot = function()
	gFunc.EquipSet(sets.Midshot)
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
