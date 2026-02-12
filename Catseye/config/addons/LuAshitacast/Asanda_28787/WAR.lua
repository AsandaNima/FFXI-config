local profile = {}
gcinclude = gFunc.LoadFile("common\\gcinclude.lua")
local Settings = {
	CurrentLevel = 0,
}
local sets = {
	Idle = {},
	Resting = {},
	Idle_Regen_Priority = {
		Body = { "Scorpion Harness" },
	},
	Idle_Refresh = {},
	Town = {},

	Dt = {},

	Tp_Default_Priority = {
		Ammo = { "Savage Shiv" },
		Head = { "Sakpata's Helm", "Optical Hat", "Mythril Sallet", "Empress Hairpin", "Garrison Sallet +1" },
		Neck = { "Peacock Charm", "Spike Necklace", "Armiger's Lace" },
		Ear1 = { "Brutal earring", "Outlaw's Earring", "Pigeon Earring", "Optical Earring" },
		Ear2 = { "Suppanomimi", "Pigeon Earring" },
		Body = { "Sakpata's Plate", "Scorpion Harness", "Mtl. Breastplate", "Brigandine +1", "Eisenbrust", "Garrison Tunica +1", "Solid Mail", "Mithran Separates" },
		Hands = { "Sakpata's Gauntlets", "Axe. Gauntlets", "Guerilla Gloves", "Mithran Gauntlets" },
		Ring1 = { "Sniper's Ring", "Archer's Ring", "Balance Ring +1", "San d'Orian Ring" },
		Ring2 = { "Sniper's Ring", "Archer's Ring", "Balance Ring +1", "Bastokan Ring" },
		Back = { "Amemet Mantle +1", "Earth Mantle", "Lizard Mantle" },
		Waist = { "Ninurta's Sash", "Swift Belt", "Ryl.Kgt. Belt", "Tilt Belt", "Plate Belt" },
		Legs = { "Sakpata's Cuisses", "Dino Trousers", "Eisendiechlings", "Garrison Hose +1", "Solid Cuisses", "Solid Cuisses", "Mithran Loincloth" },
		Feet = { "Sakpata's Leggings", "Mythril Leggings", "Eisenschuhs", "Leaping Boots", "Mithran Gaiters" },
	},
	Tp_Hybrid = {
	},
	Tp_Acc = {
		Hands = { "Mythril Gauntlets", "Eisenhentzes", "Guerilla Gloves", "Mithran Gauntlets" },
	},

	Precast = {},

	Cure = {},

	Enhancing = {
	},

	Enfeebling = {
	},
	Macc = {},

	Drain = {
	},

	Nuke = {
	},

	Preshot = {},
	Midshot = {
	},

	Ws_Default_Priority = {
		Head = { "Mythril Sallet", "Shade Tiara" },
		Neck = { "Spike Necklace", "Armiger's Lace" },
		Ear1 = { "Pigeon Earring" },
		Ear2 = { "Pigeon Earring" },
		Body = { "Brigandine +1", "Savage Separates" },
		Hands = { "Mythril Gauntlets", "Shade Mittens" },
		Ring1 = { "Rajas Ring", "Courage Ring +1" },
		Ring2 = { "Courage Ring +1", "San d'Orian Ring" },
		Back = { "Amemet Mantle +1", "Earth Mantle", "Lizard Mantle" },
		Waist = { "Ryl.Kgt. Belt", "Plate Belt" },
		Legs = { "Share Tights", "Garrison Hose +1", "Phl. Trousers" },
		Feet = { "Savage Gaiters" },
	},
	Ws_Hybrid = {
	},
	Ws_Acc = {},
	Aedge_Default = {
	},
	Aedge_Hybrid = {},
	Aedge_Acc = {},
	Savage_Default = {
	},
	Savage_Hybrid = {},
	Savage_Acc = {},
	Impulse_Default = {
	},
	Impulse_Hybrid = {},
	Impulse_Acc = {},

	Tomahawk = {
	},
	Warcry = {
	},
	Aggressor = {
	},
	Defender = {
	},
	Berserk = {
	},
	BloodRage = {
	},

	TH = {
	},
	Movement = {
	},
	Relic = {},
	Artifact = {},
}
profile.Sets = sets

profile.Packer = {
	{ Name = "Thr. Tomahawk", Quantity = "all" },
	{ Name = "Red Curry Bun", Quantity = "all" },
}

profile.OnLoad = function()
	gSettings.AllowAddSet = true
	gcinclude.Initialize()

	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 2")
	AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1")

	gcinclude.settings.RegenGearHPP = 900
	gcinclude.settings.RefreshGearMPP = 40
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

	if ability.Name == "Tomahawk" then
		gFunc.EquipSet(sets.Tomahawk)
	elseif ability.Name == "Berserk" then
		gFunc.EquipSet(sets.Berserk)
	elseif ability.Name == "Aggressor" then
		gFunc.EquipSet(sets.Aggressor)
	elseif ability.Name == "Warcry" then
		gFunc.EquipSet(sets.Warcry)
	elseif ability.Name == "Defender" then
		gFunc.EquipSet(sets.Defender)
	elseif ability.Name == "Blood Rage" then
		gFunc.EquipSet(sets.BloodRage)
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

		if string.match(ws.Name, "Aeolian Edge") then
			gFunc.EquipSet(sets.Aedge_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Aedge_" .. gcdisplay.GetCycle("MeleeSet"))
			end
			if gcdisplay.GetCycle("MeleeSet") == "Default" then
				gcinclude.DoMoonshade()
			end
		elseif string.match(ws.Name, "Savage Blade") then
			gFunc.EquipSet(sets.Savage_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Savage_" .. gcdisplay.GetCycle("MeleeSet"))
			end
			if gcdisplay.GetCycle("MeleeSet") == "Default" then
				gcinclude.DoMoonshade()
			end
		elseif string.match(ws.Name, "Impulse Drive") then
			gFunc.EquipSet(sets.Impulse_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Impulse_" .. gcdisplay.GetCycle("MeleeSet"))
			end
			if gcdisplay.GetCycle("MeleeSet") == "Default" then
				gcinclude.DoMoonshade()
			end
		end
	end
end

return profile
