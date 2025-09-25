local profile = {}
gcinclude = gFunc.LoadFile("common\\gcinclude.lua")

local sets = {
	Idle = {},
	Idle_TPgun = {},
	Resting = {},
	Idle_Regen = {},
	Idle_Refresh = {},
	Town = {},

	Dt = {},

	Tp_Default = {},
	Tp_Hybrid = {},
	Tp_Acc = {},

	Precast = {},

	Cure = {},

	Enhancing = {},

	Enfeebling = {},
	Macc = {},

	Drain = {},

	Nuke = {},

	Preshot = {},
	Preshot_FlurryI = {},
	Preshot_FlurryII = {},
	Midshot = {},
	Midshot_Acc = {},
	TripleShot = {},

	Ws_Default = {},
	Ws_Hybrid = {},
	Ws_Acc = {},
	WsObi = {},

	Savage_Default = {},
	Savage_Hybrid = {},
	Savage_Acc = {},

	Evisceration_Default = {},
	Evisceration_Hybrid = {},
	Evisceration_Acc = {},

	Aedge_Default = {},
	Aedge_Hybrid = {},
	Aedge_Acc = {},

	Laststand_Default = {},
	Laststand_Hybrid = {},
	Laststand_Acc = {},

	Wildfire_Default = {},
	Wildfire_Hybrid = {},
	Wildfire_Acc = {},

	Leaden_Default = {},
	Leaden_Hybrid = {},
	Leaden_Acc = {},
	--Quick Draw
	QD = {},
	QD_Acc = {},
	Rolls = {},
	Fold = {},
	WildCard = {},
	RandomDeal = {},
	SnakeEye = {},
	TH = {},
	Movement = {},
}
profile.Sets = sets

profile.Packer = {
	{ Name = "Decimating Bullet", Quantity = "all" },
	{ Name = "Dec. Bul. Pouch", Quantity = "all" },
	{ Name = "Trump Card", Quantity = "all" },
	{ Name = "Trump Card Case", Quantity = "all" },
}

profile.OnLoad = function()
	gSettings.AllowAddSet = true
	gcinclude.Initialize()

	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 10")
	AshitaCore:GetChatManager():QueueCommand(1, "/macro set 10")

	gcinclude.settings.RefreshGearMPP = 50
	gcinclude.CORmsg = false -- set this to false if you do not want to see lucky/unlucky # messages, can also do /cormsg in game to change on the fly
end

profile.OnUnload = function()
	gcinclude.Unload()
end

profile.HandleCommand = function(args)
	gcinclude.HandleCommands(args)
end

profile.HandleDefault = function()
	gFunc.EquipSet(sets.Idle)
	if gcdisplay.GetToggle("TPgun") == true then
		gFunc.EquipSet(sets.Idle_TPgun)
	end

	local player = gData.GetPlayer()
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

	if ability.Name:contains("Roll") then
		gFunc.EquipSet(sets.Dt)
		gFunc.EquipSet(sets.Rolls)
		gcinclude.DoCORmsg(ability.Name)
	elseif ability.Name == "Wild Card" then
		gFunc.EquipSet(sets.WildCard)
	elseif ability.Name == "Fold" then
		gFunc.EquipSet(sets.Fold)
	elseif ability.Name == "Random Deal" then
		gFunc.EquipSet(sets.RandomDeal)
	elseif ability.Name == "Snake Eye" then
		gFunc.EquipSet(sets.SnakeEye)
	elseif (ability.Name:contains("Shot")) and (ability.Name ~= "Triple Shot") then
		gFunc.EquipSet(sets.QD)
		if
			(gcdisplay.GetCycle("Melee") == "Acc")
			or (ability.Name == "Dark Shot")
			or (ability.Name == "Light Shot")
		then
			gFunc.EquipSet(sets.QD_Acc)
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
	local triple = gData.GetBuffCount("Triple Shot")
	gFunc.EquipSet(sets.Midshot)

	if triple > 0 then
		gFunc.EquipSet(sets.TripleShot)
	end

	if gcdisplay.GetCycle("MeleeSet") == "Acc" then
		gFunc.EquipSet(sets.Midshot_Acc)
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

		gFunc.EquipSet(sets.Ws_Default)
		if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
			gFunc.EquipSet("Ws_" .. gcdisplay.GetCycle("MeleeSet"))
		end

		if string.match(ws.Name, "Savage Blade") then
			gFunc.EquipSet(sets.Savage_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Savage_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		elseif string.match(ws.Name, "Evisceration") then
			gFunc.EquipSet(sets.Evisceration_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Evisceration_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		elseif string.match(ws.Name, "Aeolian Edge") then
			gFunc.EquipSet(sets.Aedge_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Aedge_" .. gcdisplay.GetCycle("MeleeSet"))
			end
			if gcdisplay.GetCycle("MeleeSet") == "Default" then
				gcinclude.DoMoonshade()
			end
		elseif string.match(ws.Name, "Last Stand") then
			gFunc.EquipSet(sets.Laststand_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Laststand_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		elseif string.match(ws.Name, "Wildfire") then
			gFunc.EquipSet(sets.Wildfire_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Wildfire_" .. gcdisplay.GetCycle("MeleeSet"))
			end
			if weather.DayElement == "Fire" or weather.RawWeatherElement == "Fire" then
				gFunc.EquipSet(sets.WsObi)
			end
		elseif string.match(ws.Name, "Leaden Salute") then
			gFunc.EquipSet(sets.Leaden_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Leaden_" .. gcdisplay.GetCycle("MeleeSet"))
			end
			if gcdisplay.GetCycle("MeleeSet") == "Default" then
				gcinclude.DoMoonshade()
			end
			if weather.DayElement == "Dark" or weather.RawWeatherElement == "Dark" then
				gFunc.EquipSet(sets.WsObi)
			end
		end
	end
end

return profile
