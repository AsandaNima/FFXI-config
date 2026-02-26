local profile = {}
gcinclude = gFunc.LoadFile("common\\gcinclude.lua")

local Settings = {
	CurrentLevel = 0,
}

local sets = {
	Idle = {
	},
	Resting = {
		Waist = "Hierarch Belt",
	},
	Idle_Regen_Priority = {
		Body = { "Scorpion Harness" },
	},
	Idle_Refresh = {
		Neck = "Parade Gorget",
	},
	Town = {
	},

	Dt = {
	},

	Tp_Default_Priority = {
		Head = { "Gleti's Mask", "Optical Hat", "Mythril Sallet", "Empress Hairpin", "Garrison Sallet +1", "Fungus Hat" },
		Neck = { "Peacock Charm", "Spike Necklace", "Armiger's Lace" },
		Ear1 = { "Brutal earring", "Outlaw's Earring", "Pigeon Earring", "Optical Earring" },
		Ear2 = { "Suppanomimi", "Pigeon Earring" },
		Body = { "Gleti's Cuirass", "Scorpion Harness", "Mtl. Breastplate", "Brigandine +1", "Eisenbrust", "Garrison Tunica +1", "Solid Mail", "Coarse Breastplate", "Mithran Separates" },
		Hands = { "Gleti's Gauntlets", "Axe. Gauntlets", "Guerilla Gloves", "Mithran Gauntlets" },
		Ring1 = { "Sniper's Ring", "Archer's Ring", "Balance Ring +1", "San d'Orian Ring" },
		Ring2 = { "Sniper's Ring", "Archer's Ring", "Balance Ring +1", "Bastokan Ring" },
		Back = { "Amemet Mantle +1", "Earth Mantle", "Lizard Mantle" },
		Waist = { "Ninurta's Sash", "Swift Belt", "Ryl.Kgt. Belt", "Tilt Belt", "Plate Belt" },
		Legs = { "Gleti's Breeches", "Dino Trousers", "Eisendiechlings", "Garrison Hose +1", "Solid Cuisses", "Solid Cuisses", "Mithran Loincloth" },
		Feet = { "Gleti's Boots", "Mythril Leggings", "Eisenschuhs", "Leaping Boots", "Mithran Gaiters" },
	},
	Tp_Hybrid = {
	},
	Tp_Acc = {
	},

	Precast = {
		head = { "Optical Hat", "Heroic Hairpin" },
		Waist = { "Swift Belt" },
	},

	Cure = {
	},

	Enhancing = {
	},
	Dread_Spikes = { -- HP+++++ at cast for max potency
	},

	Enfeebling = {
	},
	Macc_Priority = {
		--		Ammo = { "Morion Tathlum" },
		Head = { "Gambler's Chapeau", "Fungus Hat" },
		Ear1 = { "Moldavite Earring", "Morion Earring" },
		Ear2 = { "Morion Earring" },
		Body = { "Illusionist's Garb", "Seer's Tunic" },
		Hands = { "Shade Mittens", "Garrison Gloves +1" },
		Ring1 = { "Tamas Ring", "Eremite's Ring", "Windurstian Ring" },
		Ring2 = { "Eremite's Ring +1" },
		Back = { "Black Cape +1", "Bronze Cape" },
		Waist = { "Ryl.Kgt. Belt" },
		Legs = { "Mythril Cuisses", "Shade Tights" },
		Feet = { "Mythril leggings", "Garrison boots +1" },

	},

	Drain_Priority = {
		--		Ammo = { "Morion Tathlum" },
		Head = { "Gleti's Mask", "Gambler's Chapeau", "Fungus Hat" },
		Ear1 = { "Moldavite Earring", "Morion Earring" },
		Ear2 = { "Morion Earring" },
		Body = { "Illusionist's Garb", "Seer's Tunic" },
		Hands = { "Vampiric Mitts", "Shade Mittens", "Garrison Gloves +1" },
		Ring1 = { "Tamas Ring", "Eremite's Ring", "Windurstian Ring" },
		Ring2 = { "Eremite's Ring +1" },
		Back = { "Black Cape +1", "Bronze Cape" },
		Waist = { "Ryl.Kgt. Belt" },
		Legs = { "Gleti's Breeches", "Mythril Cuisses", "Shade Tights" },
		Feet = { "Vampiric Boots", "Mythril leggings", "Garrison boots +1" },

	},

	Nuke_Priority = {
		--		Ammo = { "Morion Tathlum" },
		Head = { "Gambler's Chapeau", "Fungus Hat" },
		Ear1 = { "Moldavite Earring", "Morion Earring" },
		Ear2 = { "Morion Earring" },
		Body = { "Brigandine +1" },
		Hands = { "Shade Mittens", "Garrison Gloves +1" },
		Ring1 = { "Tamas Ring", "Eremite's Ring", "Windurstian Ring" },
		Ring2 = { "Eremite's Ring +1" },
		Back = { "Bronze Cape" },
		Waist = { "Ryl.Kgt. Belt", "Mrc.Cpt. Belt" },
		Legs = { "Mythril Cuisses", "Shade Tights" },
		Feet = { "Mythril leggings", "Garrison boots +1" },
	},

	Preshot = {},
	Midshot = {
	},

	Ws_Default = { -- WSD for all scythe basically
		Head = { "Gleti's Mask", "Mythril Sallet", "Empress Hairpin", "Garrison Sallet +1" },
		Neck = { "Peacock Charm", "Spike Necklace", "Armiger's Lace" },
		Ear1 = { "Brutal earring", "Outlaw's Earring", "Pigeon Earring", "Optical Earring" },
		Ear2 = { "Suppanomimi", "Pigeon Earring" },
		Body = { "Gleti's Cuirass", "Mtl. Breastplate", "Brigandine +1", "Eisenbrust", "Garrison Tunica +1", "Solid Mail", "Coarse Breastplate", "Mithran Separates" },
		Hands = { "Gleti's Gauntlets", "Axe. Gauntlets", "Guerilla Gloves", "Mithran Gauntlets" },
		Ring1 = { "Sniper's Ring", "Archer's Ring", "Balance Ring +1", "San d'Orian Ring" },
		Ring2 = { "Sniper's Ring", "Archer's Ring", "Balance Ring +1", "Bastokan Ring" },
		Back = { "Amemet Mantle +1", "Earth Mantle", "Lizard Mantle" },
		Waist = { "Ninurta's Sash", "Virtuoso Belt", "Ryl.Kgt. Belt", "Tilt Belt", "Plate Belt" },
		Legs = { "Gleti's Breeches", "Mythril Cuisses", "Eisendiechlings", "Garrison Hose +1", "Solid Cuisses", "Solid Cuisses", "Mithran Loincloth" },
		Feet = { "Gleti's Boots", "Mythril Leggings", "Eisenschuhs", "Leaping Boots", "Mithran Gaiters" },
	},
	Ws_Hybrid = {},
	Ws_Acc = {},

	Aedge_Default = {
	},
	Aedge_Hybrid = {},
	Aedge_Acc = {},

	Spikes = { -- set to leave body on with dread spikes up, only body here!
	},
	BloodWeapon = {
	},
	Souleater = {
		Head = "Chaos Burgeonet",
	},
	LastResort = {
		Feet = "Abyss Sollerets",
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
	--{Name = 'Chonofuda', Quantity = 'all'},
}

profile.OnLoad = function()
	gSettings.AllowAddSet = true
	gcinclude.Initialize()

	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 16")
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
	-- 	print(chat.header("GCinclude"):append(chat.message("Handle Default")))

	if gcdisplay.GetCycle("craft") == "none" then
		gFunc.EquipSet(sets.Idle)
	end
	local spikes = gData.GetBuffCount("Dread Spikes")

	if player.Status == "Engaged" then
		gFunc.EquipSet(sets.Tp_Default)
		if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
			gFunc.EquipSet("Tp_" .. gcdisplay.GetCycle("MeleeSet"))
		end
		if gcdisplay.GetToggle("TH") == true then
			gFunc.EquipSet(sets.TH)
		end
	elseif player.Status == "Resting" then
		-- 		print(chat.header("GCinclude"):append(chat.message("Resting?")))
		gFunc.EquipSet(sets.Resting)
	elseif player.IsMoving == true then
		gFunc.EquipSet(sets.Movement)
	end

	if spikes ~= 0 then
		gFunc.EquipSet(sets.Spikes)
	end
	-- 	gFunc.Message("Handle Default ?");
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

	if string.match(ability.Name, "Blood Weapon") then
		gFunc.EquipSet(sets.BloodWeapon)
	elseif string.match(ability.Name, "Souleater") then
		gFunc.EquipSet(sets.Souleater)
	elseif string.match(ability.Name, "Last Resort") then
		gFunc.EquipSet(sets.LastResort)
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
		elseif string.match(spell.Name, "Dread Spikes") then
			gFunc.EquipSet(sets.Dread_Spikes)
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
		end
	end
end

return profile
