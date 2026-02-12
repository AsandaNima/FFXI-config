local profile = {}
gcinclude = gFunc.LoadFile("common\\gcinclude.lua")
local Settings = {
	CurrentLevel = 0,
}

local sets = {
	Idle = {
	},
	Resting = {},
	Idle_Regen_Priority = {
		Body = { "Scorpion Harness" },
	},
	Idle_Refresh = {
	},
	Town = {
	},

	Dt = {
	},

	Tp_Default_Priority = {
		Head = { "Yagudo Crown", -- 5% haste
			"Optical Hat", "Empress hairpin", "Garrison Sallet +1", "Fungus Hat", "Cmp. Eye Circlet" },
		Neck = { "Peacock Charm", "Pile Chain" },
		Ear1 = { "Brutal Earring", "Outlaw's Earring", "Pigeon Earring", "Tribal Earring" },
		Ear2 = { "Suppanomimi", "Pigeon Earring", "Optical Earring" },

		Body = { "Scorpion Harness", "Dino Jerkin", "Brigandine +1", "Garrison Tunica +1", "Leather Vest", "Mithran Separates" },
		Hands = { "Battle Gloves", "Mithran Gauntlets" },
		Ring1 = { "Rajas Ring", "Archer's Ring", "Balance Ring +1" },
		Ring2 = { "Zilant Ring", "Ulthalam's Ring", "Archer's Ring", "Balance Ring +1" },

		Back = { "Nomad's Mantle", "Lizard Mantle" },
		Waist = { "Ninurta's Sash", -- 6%
			"Swift Belt", "Tilt Belt", "Leather Belt" },
		Legs = { "Dino Trousers", "Garrison Hose", "Phl. Trousers", "Mithran Loincloth" },
		Feet = { "Dino Ledelsens", "Leaping Boots", "Mithran Gaiters" },
	},
	Tp_Hybrid = {},
	Tp_Acc = {
	},

	Precast_Priority = { --74
		Range = { "Rouser" },

		Head = { "Optical Hat", "Heroic Hairpin", "Entrancing Ribbon" },
		Ear1 = { "Loquac. Earring" },

		Waist = { "Ninurta's Sash", "Swift Belt" },
		Legs = { "White Slacks", "Garrison Hose +1" },
		Feet = { "Adsilion Boots +1" },
	},
	Cure_Precast = {
	},
	Enhancing_Precast = {
	},
	Stoneskin_Precast = {
	},
	Song_Precast = { --87
	},

	Cure = {   --I cap is 50, II cap is 30
	},
	Self_Cure = { --cap 30
	},
	Regen = {
	},
	Cursna = {
	},

	Enhancing = {
	},
	Stoneskin = {
	},
	Phalanx = {},
	Refresh = {
	},

	Enfeebling = { --need update
	},
	Singing_Priority = {
		Head = { "Bard's Roundlet" },
		Hands = { "Choral Cuffs" },
	},
	Wind_Priority = {
		Range = { "Rouser", "Flute +2" },

		Head = { "Entrancing Ribbon" },
		Neck = { "Pegasus Collar" },

		Body = { "Dino Jerkin", "Garrison Tunica +1", },
		Hands = { "Bard's Cuffs", "Raptor Gloves" },
		Ring1 = { "Hope Ring +1" },
		Ring2 = { "Hope Ring +1" },

		Back = { "Tundra Mantle" },
		Waist = { "Ryl.Kgt. Belt", "Mrc.Cpt. Belt" },
		Feet = { "Choral CAnnions", "Dino Ledelsens", "Savage Gaiters", "Sandals" },
	},
	Harp_Priority = { --use /forcestring in game to lock this on all songs, I personally just use Paeons
		Body = { "Choral Jstcorps" },
		Feet = { "Bard's Slippers" },
	},
	Foe_Priority = {
	},
	Horde_Priority = {
	},
	Requiem_Priority = {
		Range = { "Rouser", "Flute +2" },
	},
	Elegy = {
	},
	Buff_Priority = { -- like the first set that will be called
		Range = { "Rouser", "Maple Harp" },
	},
	Paeon_Priority = { --I personally use paeons to force my extra song harp, you can also use /forcestring if you want
		Range = { "Rouser" },
	},
	March_Priority = {
		Range = { "Rouser", "Battle Horn +1" },
	},
	Madrigal_Priority = {
	},
	Minuet_Priority = {
		Range = { "Cornette +1" },
	},
	Ballad_Priority = {
	},
	Scherzo_Priority = {
	},

	Drain = {},
	Nuke = {},
	Preshot = {},
	Midshot = {
	},

	Ws_Default = {
	},
	Ws_Hybrid = {},
	Ws_Acc = {},

	Savage_Default = {
	},
	Savage_Hybrid = {},
	Savage_Acc = {},

	Nitro = { --includes legs for soul voice as well
	},

	TH = {
	},
	Movement = {
		Neck = "Pegasus Collar",
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

	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 23")
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

	if
		string.match(ability.Name, "Troubadour")
		or string.match(ability.Name, "Nightingale")
		or string.match(ability.Name, "Soul Voice")
	then
		gFunc.EquipSet(sets.Nitro)
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
	elseif spell.Skill == "Singing" then
		gFunc.EquipSet(sets.Song_Precast)
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

	local weather = gData.GetEnvironment()
	local spell = gData.GetAction()
	local target = gData.GetActionTarget()
	local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)

	if spell.Skill == "Enhancing Magic" then
		gFunc.EquipSet(sets.Enhancing)

		if string.match(spell.Name, "Phalanx") then
			gFunc.EquipSet(sets.Phalanx)
		elseif string.match(spell.Name, "Stoneskin") then
			gFunc.EquipSet(sets.Stoneskin)
		elseif string.contains(spell.Name, "Refresh") then
			gFunc.EquipSet(sets.Refresh)
		elseif string.contains(spell.Name, "Regen") then
			gFunc.EquipSet(sets.Regen)
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

		if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
			gFunc.Equip("Waist", "Hachirin-no-Obi")
		end
	elseif spell.Skill == "Enfeebling Magic" then
		gFunc.EquipSet(sets.Enfeebling)
	elseif spell.Skill == "Dark Magic" then
		gFunc.EquipSet(sets.Enfeebling) -- mostly macc anyways
		if string.contains(spell.Name, "Aspir") or string.contains(spell.Name, "Drain") then
			gFunc.EquipSet(sets.Drain)
		end
	elseif spell.Skill == "Singing" then
		gFunc.EquipSet(sets.Singing)
		if (string.contains(spell.Name, "Paeon")) or (string.contains(spell.Name, "Mazurka")) then
			gFunc.EquipSet(sets.Paeon)
		else
			gFunc.EquipSet(sets.Buff)
			--print(chat.header('GCinclude'):append(chat.message("Buff Set.")));
		end
		if (string.contains(spell.Name, "Requiem"))
			or (string.contains(spell.Name, "Elegy"))
			or (string.contains(spell.Name, "Threnody"))
			or (string.contains(spell.Name, "Finale"))
			or (string.contains(spell.Name, "Lullaby"))
		then
			gFunc.EquipSet(sets.Wind)
		end
		if string.contains(spell.Name, "Horde Lullaby") then
			gFunc.EquipSet(sets.Horde)
		elseif string.contains(spell.Name, "Foe Lullaby") then
			gFunc.EquipSet(sets.Foe)
		elseif string.contains(spell.Name, "Requiem") then
			gFunc.EquipSet(sets.Requiem)
		elseif string.contains(spell.Name, "Elegy") then
			gFunc.EquipSet(sets.Elegy)
		elseif string.contains(spell.Name, "March") then
			gFunc.EquipSet(sets.March)
		elseif string.contains(spell.Name, "Madrigal") then
			gFunc.EquipSet(sets.Madrigal)
		elseif string.contains(spell.Name, "Minuet") then
			gFunc.EquipSet(sets.Minuet)
		elseif string.contains(spell.Name, "Scherzo") then
			gFunc.EquipSet(sets.Scherzo)
		elseif string.contains(spell.Name, "Ballad") then
			gFunc.EquipSet(sets.Ballad)
		end

		--if gcdisplay.GetToggle("String") == true then
		--gFunc.EquipSet(sets.Harp)
		--end
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

		if string.match(ws.Name, "Savage Blade") then
			gFunc.EquipSet(sets.Savage_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Savage_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		end
	end
end

return profile
