local profile = {}
gcinclude = gFunc.LoadFile("common\\gcinclude.lua")

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

	Tp_Default = {
		Body = { "Solid Mail", "Mithran Separates" },
		Hands = { "Mithran Gauntlets" },
		Legs = { "Solid Cuisses", "Mithran Loincloth" },
		Feet = { "Mithran Gaiters" },
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

	Preshot = {       --base preshot, no flurry, 70cap, 10 from gifts
	},
	Preshot_FlurryI = { --with flurry I on, gives 15, 10 from gifts
	},
	Preshot_FlurryII = { --with flurry II on, gives 30, 10 from gifts
	},
	Midshot = {
	},
	Barrage = {
	},
	Midshot_Acc = { --will be over written by barrage set still
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
	if gcdisplay.GetCycle("craft") == "none" then
		gFunc.EquipSet(sets.Idle)
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
