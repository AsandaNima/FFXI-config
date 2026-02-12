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
		Head = { "Dino Helm", "Shade Tiara", "Gambler's Chapeau", "Fungus Hat", "Cmp. Eye Circlet", "Eyepatch" },
		Neck = { "Peacock Charm", "Armiger's Lace", "Pile Chain" },
		Ear1 = { "Brutal earring", "Pigeon Earring", "Optical Earring" },
		Ear2 = { "Pigeon Earring", "Tribal Earring" },

		Body = { "Scorpion Harness", "Brigandine +1", "Garish Tunic", "Garrison Tunica +1", "Solid Mail", "Coarse Breastplate", "Blksmith. Smock" },
		Hands = { "Raptor Gloves", "Axe. Gauntlets", "Battle Gloves", "Mithran Gauntlets" },
		Ring1 = { "Sattva Ring", "Balance Ring +1", "San d'Orian Ring" },
		Ring2 = { "Sniper's Ring", "Archer's Ring", "Balance Ring +1", "Bastokan Ring" },

		Back = { "Exile's Cloak", "Ram Mantle", "Nomad's Mantle", "Shaper's Shawl" },
		Waist = { "Swift Belt", "Tilt Belt", "Mrc.Cpt. Belt", "Leather Belt" },
		Legs = { "Dino Trousers", "Garish Slacks", "Garrison Hose +1", "Solid Cuisses", "Mithran Loincloth" },
		Feet = { "Dino Ledelsens", "Savage Gaiters", "Leaping Boots", "Mithran Gaiters" },
	},
	Tp_Hybrid = {
	},
	Tp_Acc = {
	},

	--These will overwrite any above TP profile.Sets if /tankset is used
	Tank_Main_Priority = { --Default Tanking,  dt
	},
	Tank_MEVA = {
	},

	Precast = {
	},
	Precast_Inspiration = { --this set I use for when my 5/5 inspire merits kicking in with val/vall up
	},
	Cure_Precast = {
	},
	Enhancing_Precast = {
	},
	SIR = { --10 merits + 90
	},
	Enmity = {
	},
	SIRenmity = { -- Foil and blue spells mostly
	},

	Cure = {
	},
	Regen = {
	},
	Enhancing = {
	},
	Phalanx = {
	},
	Stoneskin = {
	},
	Temper = {
	},

	Preshot = {},
	Midshot = {
	},

	Ws_Default = {
	},
	Ws_Hybrid = {},
	Ws_Acc = {},
	Dimi_Default = {
	},
	Dimi_Hybrid = {},
	Dimi_Acc = {},
	Reso_Default = {
	},
	Reso_Hybrid = {},
	Reso_Acc = {},
	Shockwave_Default = {
	},
	Shockwave_Hybrid = {},
	Shockwave_Acc = {},

	Sforzo = {
	},
	Swipe = {
	},
	Pulse = {
	},
	Vallation = {
	},
	Battuta = {
	},
	Swordplay = {
	},

	TH = {
	},
	Movement = {
	},
	Relic = {},
	Artifact = {},
	['gear'] = {

	},

}
profile.Sets = sets

profile.Packer = {
	{ Name = "Om. Sandwich",    Quantity = "all" },
	{ Name = "Black Curry Bun", Quantity = "all" },
}

profile.OnLoad = function()
	gSettings.AllowAddSet = true
	gcinclude.Initialize()

	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 22")
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

	if player.Status == "Engaged" then
		gFunc.EquipSet(sets.Tp_Default)
		if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
			gFunc.EquipSet("Tp_" .. gcdisplay.GetCycle("MeleeSet"))
		end
		if gcdisplay.GetToggle("TH") == true then
			gFunc.EquipSet(sets.TH)
		end
		--		if gcdisplay.GetCycle("TankSet") ~= "None" then
		--			gFunc.EquipSet("Tank_" .. gcdisplay.GetCycle("TankSet"))
		--		end
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
	local runes = T({ "Ignis", "Gelus", "Flabra", "Tellus", "Sulpor", "Unda", "Lux", "Tenebrae" })

	if runes:contains(ability.Name) then
		return
	end

	gFunc.EquipSet(sets.Enmity)

	if string.match(ability.Name, "Swipe") or string.match(ability.Name, "Lunge") then
		gFunc.EquipSet(sets.Swipe)
	elseif string.match(ability.Name, "Vallation") or string.match(ability.Name, "Valiance") then
		gFunc.EquipSet(sets.Vallation)
	elseif string.contains(ability.Name, "Pulse") then
		gFunc.EquipSet(sets.Pulse)
	elseif string.contains(ability.Name, "Swordplay") then
		gFunc.EquipSet(sets.Swordplay)
	elseif string.contains(ability.Name, "Sforzo") then
		gFunc.EquipSet(sets.Sforzo)
	elseif string.match(ability.Name, "Battuta") then
		gFunc.EquipSet(sets.Battuta)
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
	local val = gData.GetBuffCount("Valiance")
	local vall = gData.GetBuffCount("Vallation")
	gFunc.EquipSet(sets.Precast)

	if (val >= 1) or (vall >= 1) then
		gFunc.EquipSet(sets.Precast_Inspiration)
	elseif spell.Skill == "Enhancing Magic" then
		gFunc.EquipSet(sets.Enhancing_Precast)
	elseif spell.Skill == "Healing Magic" then
		gFunc.EquipSet(sets.Cure_Precast)
	end

	gcinclude.CheckCancels()
end

profile.HandleMidcast = function() --sloppy set handling here, need to clean this up
	-- handle levelsync
	local player = gData.GetPlayer()
	local myLevel = player.MainJobSync

	if myLevel ~= Settings.CurrentLevel then
		gFunc.EvaluateLevels(profile.Sets, myLevel)
		Settings.CurrentLevel = myLevel
	end

	local spell = gData.GetAction()

	gFunc.EquipSet(sets.SIR)
	gFunc.EquipSet(sets.Enhancing)

	if string.contains(spell.Name, "Cur") or string.contains(spell.Name, "Carrot") then
		gFunc.EquipSet(sets.Cure)
	elseif string.contains(spell.Name, "Regen") then
		gFunc.EquipSet(sets.Regen)
	elseif string.match(spell.Name, "Phalanx") then
		gFunc.EquipSet(sets.Phalanx)
	elseif string.match(spell.Name, "Stoneskin") then
		gFunc.EquipSet(sets.Stoneskin)
	elseif string.match(spell.Name, "Temper") then
		gFunc.EquipSet(sets.Temper)
	elseif string.match(spell.Name, "Foil") or (spell.Skill == "Blue Magic") then
		gFunc.EquipSet(sets.SIRenmity)
	end

	if gcdisplay.GetToggle("SIR") == true then
		gFunc.EquipSet(sets.SIR)
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

		if string.match(ws.Name, "Dimidiation") then
			gFunc.EquipSet(sets.Dimi_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Dimi_" .. gcdisplay.GetCycle("MeleeSet"))
			end
			gcinclude.DoMoonshade()
		elseif string.match(ws.Name, "Resolution") then
			gFunc.EquipSet(sets.Reso_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Reso_" .. gcdisplay.GetCycle("MeleeSet"))
			end
			gcinclude.DoMoonshade()
		elseif string.match(ws.Name, "Shockwave") then
			gFunc.EquipSet(sets.Shockwave_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Shockwave_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		end
	end
end

return profile
