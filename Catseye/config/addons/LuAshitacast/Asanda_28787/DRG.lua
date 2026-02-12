local profile = {}
gcinclude = gFunc.LoadFile("common\\gcinclude.lua")

local Settings = {
	CurrentLevel = 0,
}

local sets = {
	Idle_Priority = {
		Head = "Drachen Armet",
		Body = "Drachen Mail",
		Hands = "Drachen Fng. Gnt.",
		Legs = "Drachen Brais",
		Feet = "Drachen Greaves",
	},
	Resting_Priority = {},
	Idle_Regen_Priority = {
		Body = { "Scorpion Harness" },
	},
	Idle_Refresh_Priority = {},
	Town = {},

	Dt_Priority = {},

	Tp_Default_Priority = {
		Head = { "Entrancing Ribbon", "Tlahtlamah Glasses" },
		Neck = { "Peacock Charm", "Armiger's Lace", "Pile Chain" },
		Ear1 = { "Wilder. Earring +1", "Optical Earring" },
		Ear2 = { "Tribal Earring" },

		Body = { "Scorpion Harness", "Brigandine +1", "Eisenbrust", "Garrison Tunica +1", "Solid Mail", "Leather Vest", "Fisherman's Smock" },
		Hands = { "Guerilla Gloves", "Mithran Gauntlets" },
		Ring1 = { "Rajas Ring", "Balance Ring +1", "Bastokan Ring" },
		Ring2 = { "Archer's Ring", "Balance Ring +1", "San d'Orian Ring" },
		Back = { "Amemet Mantle +1", "Excile's Cloack" },
		Waist = { "Swift Belt", "Tilt Belt", "Leather Belt" },
		Legs = { "Dino Trousers", "Herder's Subligar", "Garrison Hose +1", "Solid Cuisses", "Mithran Loincloth" },
		Feet = { "Leaping Boots", "Mithran Gaiters" },
	},
	Tp_Hybrid_Priority = {},
	Tp_Acc_Priority = {},

	Precast_Priority = {
		Head = { "Drachen Armet" },
		Waist = { "Swift Belt" },
	},

	Cure_Priority = {},

	Enhancing_Priority = {},

	Enfeebling_Priority = {},
	Macc_Priority = {},

	Drain_Priority = {},

	Nuke_Priority = {},

	Preshot = {},
	Midshot = {},

	Ws_Default_Priority = {
		Head = { "Empress Hairpin" },
		Neck = { "Spike Nacklace" },
		Body = { "Dino Jerkin", "Savage Separates" },
		Hands = { "Guerilla Gloves" },
		Ring1 = { "Rajas Ring" },
		Wait = { "Lizard Belt" },
		Legs = { "Dino Trousers", "Garrison Hose +1" },
		Feet = { "Savage Gaiters" },
	},
	Ws_Hybrid = {},
	Ws_Acc = {},
	Aedge_Default = {},
	Aedge_Hybrid = {},
	Aedge_Acc = {},

	Jumps_Default = {

	},
	Jumps_Hybrid = {},
	Jumps_Acc = {},

	TH = {},
	Movement = {
		Legs = "Carmine Cuisses +1",
	},
	Artifact = {
		Head = "Drachen Armet",
		Body = "Drachen Mail",
		Hands = "Drachen Fng. Gnt.",
		Legs = "Drachen Brais",
		Feet = "Drachen Greaves",
	},
	Relic = {},

}
profile.Sets = sets

profile.Packer = {
	--{Name = 'Chonofuda', Quantity = 'all'},
}

profile.OnLoad = function()
	gSettings.AllowAddSet = true
	gcinclude.Initialize()

	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 14")
	AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1")

	gcinclude.settings.RefreshGearMPP = 40
	gcinclude.settings.PetDTGearHPP = 0 --remove/edit this line if you care about your wyvern, I clearly do not care about mine.
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

	if string.contains(ability.Name, "Jump") then
		gFunc.EquipSet(sets.Jumps_Default)
		if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
			gFunc.EquipSet("Jumps_" .. gcdisplay.GetCycle("MeleeSet"))
		end
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
		gcinclude.settings.CurrentLevel = myLevel -- set CurrentLevel in gcinclude
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
		gcinclude.settings.CurrentLevel = myLevel -- set CurrentLevel in gcinclude
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
