local profile = {}
gcinclude = gFunc.LoadFile("common\\gcinclude.lua")

local sets = {
	Idle = {},
	Resting = {},
	Idle_Regen = {},
	Idle_Refresh = {},
	Town = {},

	Dt = {},

	Tp_Default = {},
	Tp_Hybrid = {},
	Tp_Acc = {},
	Tp_Proc = {},

	Precast = {},

	Cure = {},

	Enhancing = {},

	Preshot = {},
	Midshot = {},

	Ws_Default = {
		Head = { "Empress Hairpin", "Garrison Sallet +1" },
		Neck = { "Peacock Charm", "Spike Necklace", "Pile Chain" },
		Ear1 = { "Brutal earring", "Outlaw's Earring", "Pigeon Earring", "Optical Earring" },
		Ear2 = { "Wilderness Earring", "Pigeon Earring" },

		Body = { "Garrison Tunica +1", "Rambler's Cloak", "Mithran Separates" },
		Hands = { "Battle Gloves", "Mithran Gauntlets" },
		Ring1 = { "Rajas Ring", "Archer's Ring", "Bastokan Ring" },
		Ring2 = { "Ulthalam's Ring", "Archer's Ring", "San d'Orian Ring" },

		Back = { "Exile's Cloak", "Ram Mantle", "Traveler's Mantle" },
		Waist = { "Ninurta's Sash", "Virtuoso Belt", "Tilt Belt", "Purple Belt", "Lizard Belt", "Leather Belt" },
		Legs = { "Shinobi Hakama", "Garrison Hose +1", "Mithran Loincloth" },
		Feet = { "Savage Gaiters", "Garrison Boots +1", "Mithran Gaiters" },
	},
	Ws_Hybrid = {},
	Ws_Acc = {},
	Ws_Proc = {},

	Savage_Default = {},
	Savage_Hybrid = {},
	Savage_Acc = {},

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
	ThirdEye = {},
	Seigan = {},
	Sekkanoki = {},
	Sengikori = {},
	Meditate = {},
	Meikyo = {},
	Enmity = {},

	TH = {},
	Movement = {},
}
profile.Sets = sets

profile.Packer = {
	{ Name = "Red Curry Bun", Quantity = "all" },
}

profile.OnLoad = function()
	gSettings.AllowAddSet = true
	gcinclude.Initialize()

	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 4")
	AshitaCore:GetChatManager():QueueCommand(1, "/macro set 8")
end

profile.OnUnload = function()
	gcinclude.Unload()
end

profile.HandleCommand = function(args)
	gcinclude.HandleCommands(args)
end

profile.HandleDefault = function()
	gFunc.EquipSet(sets.Idle)
	local hasso = gData.GetBuffCount("Hasso")
	local thirdeye = gData.GetBuffCount("Third Eye")
	local seigan = gData.GetBuffCount("Seigan")
	local player = gData.GetPlayer()

	if player.Status == "Engaged" then
		gFunc.EquipSet(sets.Tp_Default)
		if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
			gFunc.EquipSet("Tp_" .. gcdisplay.GetCycle("MeleeSet"))
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
	gFunc.EquipSet(sets.Precast)

	gcinclude.CheckCancels()
end

profile.HandleMidcast = function()
	local spell = gData.GetAction()

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
	gFunc.EquipSet(sets.Preshot)
end

profile.HandleMidshot = function()
	gFunc.EquipSet(sets.Midshot)
	if gcdisplay.GetToggle("TH") == true then
		gFunc.EquipSet(sets.TH)
	end
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
