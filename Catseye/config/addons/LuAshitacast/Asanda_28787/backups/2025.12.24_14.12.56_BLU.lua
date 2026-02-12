local profile = {}
gcinclude = gFunc.LoadFile("common\\gcinclude.lua")
local Settings = {
	CurrentLevel = 0,
}

local sets = {
	Idle = {
	},
	Resting = {
	},
	Idle_Regen = {
	},
	Idle_Refresh = {
	},
	Town = {
	},

	Evasion = { --this set will be my idle set when in /cj mode for evasion pulling
	},

	Dt = {
	},

	Tp_Default = {
		Head = { "Eyepatch" },
		Neck = { "Pile Chain" },

		Body = { "Scorpion Harness", "Brigandine +1", "Solid Mail", "Leather Vest", "Mithran Separates" },
		Hands = { "Mithran Gauntlets" },
		Ring1 = { "Bastokan Ring" },
		Ring2 = { "San d'Orian Ring" },

		Back = { "Shaper's Shawl" },
		Waist = { "Leather Belt" },
		Legs = { "Solid Cuisses", "Mithran Loincloth" },
		Feet = { "Leaping Boots", "Mithran Gaiters" },
	},
	Tp_Hybrid = {
	},
	Tp_Acc = {
	},

	Precast = { --64
		Waist = { "Swift Belt" },
	},
	Blu_Precast = {
	},
	Stoneskin_Precast = {
	},

	Cure = {   --I cap is 50, II cap is 30
	},
	WhiteWind = { --HP+ go!
	},
	BluSkill = {
	},
	BluMagical = {
	},
	BluMagicAccuracy = {
	},
	CJmid = { --same as macc set but with weapons since in CJmode we idle in eva swords
	},
	BluStun = {
	},
	BluPhysical = {
	},
	CMP = {
	},

	Preshot = {},
	Midshot = {
	},

	Ws_Default = {
	},
	Ws_Hybrid = {
	},
	Ws_Acc = {},
	Chant_Default = {
	},
	Chant_Hybrid = {
	},
	Chant_Acc = {},
	Savage_Default = {
	},
	Savage_Hybrid = {
	},
	Savage_Acc = {},
	Expiacion_Default = {
	},
	Expiacion_Hybrid = {
	},
	Expiacion_Acc = {},
	Requiescat_Default = {
	},
	Requiescat_Hybrid = {},
	Requiescat_Acc = {},

	Ca = {
	},
	Ba = {
	},
	Diffusion = {
	},
	Efflux = {
	},

	Enmity = {
	},

	TH = {
	},
	Salvage = {
	},
	Movement = {
	},
	Relic = {},
	Artifact = {},
	['upgrade'] = {
		Main = { Name = 'Sapara +1', Augment = { [1] = 'DEX+3', [2] = 'DMG:+3' } },
		Sub = 'Kupo Shield',
		Head = 'Eyepatch',
		Neck = 'Pile Chain',
		Body = { Name = 'Leather Vest', Augment = { [1] = 'VIT+1', [2] = 'INT+1' } },
		Hands = 'Mithran Gauntlets',
		Ring1 = 'Bastokan Ring',
		Ring2 = 'San d\'Orian Ring',
		Back = 'Shaper\'s Shawl',
		Waist = { Name = 'Leather Belt', Augment = { [1] = 'AGI+1', [2] = 'HP+10' } },
		Legs = 'Mithran Loincloth',
		Feet = 'Leaping Boots',
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

	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 19")
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

	local zone = gData.GetEnvironment()
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
	elseif gcdisplay.GetToggle("CJmode") == true then
		gFunc.EquipSet(sets.Evasion)
	elseif player.IsMoving == true then
		gFunc.EquipSet(sets.Movement)
	end

	if gcdisplay.GetToggle("CJmode") ~= true then
		gcinclude.CheckDefault()
	end
	if gcdisplay.GetToggle("DTset") == true then
		gFunc.EquipSet(sets.Dt)
	end
	if gcdisplay.GetToggle("Kite") == true then
		gFunc.EquipSet(sets.Movement)
	end
	--lazy equip weapons for salvage runs
	if zone.Area:contains("Remnants") then
		gFunc.EquipSet(sets.Salvage)
	end
end

profile.HandleAbility = function()
	local ability = gData.GetAction()

	if string.match(ability.Name, "Provoke") then
		gFunc.EquipSet(sets.Enmity)
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

	if string.contains(spell.Skill, "Blue Magic") then
		gFunc.EquipSet(sets.Blu_Precast)
	elseif string.contains(spell.Name, "Stoneskin") then
		gFunc.EquipSet(sets.Stoneskin_Precast)
	end

	gcinclude.CheckCancels()
end

profile.HandleMidcast = function()
	-- handle levelsync
	local player = gData.GetPlayer()
	local myLevel = player.MainJobSync

	if myLevel ~= Settings.CurrentLevel then
		gFunc.EvaluateLevels(profile.Sets, myLevel)
		Settings.CurrentLevel = myLevel
	end

	local diff = gData.GetBuffCount("Diffusion")
	local ca = gData.GetBuffCount("Chain Affinity")
	local ba = gData.GetBuffCount("Burst Affinity")
	local ef = gData.GetBuffCount("Efflux")
	local spell = gData.GetAction()

	gFunc.EquipSet(sets.BluMagical)
	if gcinclude.BluMagDebuff:contains(spell.Name) then
		gFunc.EquipSet(sets.BluMagicAccuracy)
	elseif gcinclude.BluMagStun:contains(spell.Name) then
		gFunc.EquipSet(sets.BluStun)
	elseif gcinclude.BluMagBuff:contains(spell.Name) then
		gFunc.EquipSet(sets.CMP)
	elseif gcinclude.BluMagSkill:contains(spell.Name) then
		gFunc.EquipSet(sets.BluSkill)
	elseif gcinclude.BluMagCure:contains(spell.Name) then
		gFunc.EquipSet(sets.Cure)
	elseif gcinclude.BluMagEnmity:contains(spell.Name) then
		gFunc.EquipSet(sets.Enmity)
	elseif string.match(spell.Name, "White Wind") then
		gFunc.EquipSet(sets.WhiteWind)
	elseif string.match(spell.Name, "Evryone. Grudge") or string.match(spell.Name, "Tenebral Crush") then
		gFunc.EquipSet(sets.BluDark)
	end

	if ca >= 1 then
		gFunc.EquipSet(sets.Ca)
	end
	if ba >= 1 then
		gFunc.EquipSet(sets.Ba)
	end
	if ef >= 1 then
		gFunc.EquipSet(sets.Efflux)
	end
	if diff >= 1 then
		gFunc.EquipSet(sets.Diffusion)
	end

	if gcdisplay.GetToggle("CJmode") == true then
		gFunc.EquipSet(sets.CJmid)
	end

	if (gcinclude.BluMagTH:contains(spell.Name)) and (gcdisplay.GetToggle("TH") == true) then
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
		elseif string.match(ws.Name, "Expiacion") then
			gFunc.EquipSet(sets.Expiacion_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Expiacion_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		elseif string.match(ws.Name, "Requiescat") then
			gFunc.EquipSet(sets.Requiescat_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Requiescat_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		end
	end
end

return profile
