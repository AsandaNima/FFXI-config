local profile = {}
gcinclude = gFunc.LoadFile("common\\gcinclude.lua")
local Settings = {
	CurrentLevel = 0,
}
local sets = {
	Idle_Priority = {
		Head = { "Chironic Hat", "Gambler's Chapeau" },
		Ear1 = { "Pigeon Earring" },
		Ear2 = { "Pigeon Earring" },
		Body = { "Chironic Doublet" },
		Hands = { "Chironic Gloves", "Carbuncle Mitts" },
		Ring1 = { "Serket Ring", "Astral Ring" },
		Ring2 = { "Eidolon Ring", "Tamas Ring" },
		Back = { "Variable Cape" },
		Waist = { "Hierarch Belt" },
		Legs = { "Chironic Hose", "Savage Loincloth", "Seer's Slacks" },
		Feet = { "Chironic Slippers", "River Gaiters", "Sandals" },
	},
	Pet_Idle = { --only need 14, rest 512|575|670 skill for favor then refresh
		main = "Chatoyant Staff",
	},
	Resting = {
		main = "Chatoyant Staff",
	},
	Idle_Regen = {
		Hands = "Chironic Gloves",
	},
	Idle_Refresh = {
		Main = { "Radiance" },
		Body = { "Chironic Doublet", "Royal cloak" },
	},
	Town = {
	},

	Dt = {
	},
	Pet_Dt = {
		main = "Chatoyant Staff",
	},

	Tp_Default = {
		Head = { "Empress hairpin", "Fungus Hat", "Cmp. Eye Circlet" },
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
	Tp_Hybrid = {
	},
	Tp_Acc = {
	},
	Pet_Only_Tp = {
		main = "Chatoyant Staff",
	},

	Precast = {
		Waist = { "Swift Belt" },
	},
	Cure_Precast = {
	},
	Enhancing_Precast = {
	},
	Stoneskin_Precast = {
	},

	Cure = { --I cap is 50, II cap is 30
	},
	Regen = {
	},
	Cursna = {
	},

	Enhancing = {
	},
	Stoneskin = {
		Neck = "Stone Gorget",
	},
	Refresh = {
	},

	SIR = {
	},

	Drain = {
	},

	Nuke_Priority = {
		Ammo = { "Morion Tathlum" },
		Main = { "Chatoyant Staff" },
		Head = { "Gambler's Chapeau", "Fungus Hat" },
		Ear1 = { "Moldavite Earring", "Morion Earring" },
		Ear2 = { "Morion Earring" },
		Body = { "Illusionist's Garb", "Seer's Tunic" },
		Hands = { "Garrison Gloves +1" },
		Ring1 = { "Tamas Ring", "Eremite's Ring", "Windurstian Ring" },
		Ring2 = { "Eremite's Ring +1" },
		Back = { "Black Cape +1", "Bronze Cape" },
		Waist = { "Mrc.Cpt. Belt" },
		Legs = { "Seer's Slacks" },
		Feet = { "Garrison boots +1" },
	},

	Ws_Default = {
	},
	Ws_Hybrid = {},
	Ws_Acc = {},

	BP = { --I/II cap at 15, the rest need 680 skill total
		head = "Summoner's Horn",
		Body = "Yinyang Robe",
		Hands = "Summoner's Brcr.",
		Ring2 = "Eidolon Ring",
		Legs = "Chironic Hose",
	},
	Siphon = {
	},

	SmnPhysical = {
	},
	SmnMagical = {
	},
	SmnSkill = {
		main = "Chatoyant Staff",
		Head = "Evoker's Horn",
		Hands = "Summoner's Brcr.",
		Feet = "Chironic Slippers",
		Ring2 = "Eidolon Ring",
	},
	SmnAttributes = { --mostly for Wind's Blessing'
	},
	SmnHealing = { --avatar HP+
	},
	SmnEnfeebling = {
	},
	SmnHybrid = { --special set for flamming crush and burning strike (for now)
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

local function HandlePetAction(PetAction)
	-- handle levelsync
	local player = gData.GetPlayer()
	local myLevel = player.MainJobSync

	if myLevel ~= Settings.CurrentLevel then
		gFunc.EvaluateLevels(profile.Sets, myLevel)
		Settings.CurrentLevel = myLevel
	end

	if gcinclude.SmnSkill:contains(PetAction.Name) then
		gFunc.EquipSet(sets.SmnSkill)
		if PetAction.Name == "Wind's Blessing" then
			gFunc.EquipSet(sets.SmnAttributes)
		end
	elseif gcinclude.SmnMagical:contains(PetAction.Name) then
		gFunc.EquipSet(sets.SmnMagical)
	elseif gcinclude.SmnHybrid:contains(PetAction.Name) then
		gFunc.EquipSet(sets.SmnHybrid)
	elseif gcinclude.SmnHealing:contains(PetAction.Name) then
		gFunc.EquipSet(sets.SmnHealing)
	elseif gcinclude.SmnEnfeebling:contains(PetAction.Name) then
		gFunc.EquipSet(sets.SmnEnfeebling)
	else
		gFunc.EquipSet(sets.SmnPhysical)
	end
end

profile.OnLoad = function()
	gSettings.AllowAddSet = true
	gcinclude.Initialize()
	gcinclude.settings.RegenGearHPP = 50
	gcinclude.settings.RefreshGearMPP = 60
	gcinclude.settings.PetDTGearHPP = 30
	--[[ Set you job macro defaults here]]
	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 21")
	AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1")
end

profile.OnUnload = function()
	gcinclude.Unload()
end

profile.HandleCommand = function(args)
	gcinclude.HandleCommands(args)
end

profile.HandleDefault = function()
	local pet = gData.GetPet()
	local petAction = gData.GetPetAction()

	-- handle levelsync
	local player = gData.GetPlayer()
	local myLevel = player.MainJobSync

	if myLevel ~= Settings.CurrentLevel then
		gFunc.EvaluateLevels(profile.Sets, myLevel)
		Settings.CurrentLevel = myLevel
	end

	if petAction ~= nil then
		HandlePetAction(petAction)
		return
	end

	if player.Status == "Engaged" then
		gFunc.EquipSet(sets.Tp_Default)
		if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
			gFunc.EquipSet("Tp_" .. gcdisplay.GetCycle("MeleeSet"))
		end
	elseif pet ~= nil and pet.Status == "Engaged" then
		gFunc.EquipSet(sets.Pet_Only_Tp)
	elseif player.Status == "Resting" then
		gFunc.EquipSet(sets.Resting)
	else
		if gcdisplay.GetCycle("craft") == "none" then
			gFunc.EquipSet(sets.Idle)
		end
	end

	if (pet ~= nil) and (pet.Status == "Idle") then
		gFunc.EquipSet(sets.Pet_Idle)
	end

	if pet ~= nil then
		if (player.Status == "Engaged") and (pet.Status ~= "Engaged") then
			AshitaCore:GetChatManager():QueueCommand(1, '/ja "Assault" <t>')
		end
	end

	if player.IsMoving == true then
		gFunc.EquipSet(sets.Movement)
	end

	gcinclude.CheckDefault()
	if gcdisplay.GetToggle("DTset") == true then
		gFunc.EquipSet(sets.Dt)
		if pet ~= nil then
			gFunc.EquipSet(sets.Pet_Dt)
		end
	end
	if gcdisplay.GetToggle("Kite") == true then
		gFunc.EquipSet(sets.Movement)
	end
end

profile.HandleAbility = function()
	local ability = gData.GetAction()
	local ac = gData.GetBuffCount("Astral Conduit")
	if ac > 0 then
		return
	end

	if
		(ability.Name == "Release")
		or (ability.Name == "Avatar's Favor")
		or (ability.Name == "Assault")
		or (ability.Name == "Retreat")
		or (ability.Name == "Apogee")
	then
		return
	end

	gFunc.EquipSet(sets.BP)

	if ability.Name == "Elemental Siphon" then
		gFunc.EquipSet(sets.Siphon)
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

	local spell = gData.GetAction()
	local weather = gData.GetEnvironment()

	gFunc.EquipSet(sets.SIR)

	if spell.Skill == "Enhancing Magic" then
		gFunc.EquipSet(sets.Enhancing)

		if string.match(spell.Name, "Stoneskin") then
			gFunc.EquipSet(sets.Stoneskin)
		elseif string.contains(spell.Name, "Regen") then
			gFunc.EquipSet(sets.Regen)
		elseif string.contains(spell.Name, "Refresh") then
			gFunc.EquipSet(sets.Refresh)
		end
	elseif spell.Skill == "Healing Magic" then
		gFunc.EquipSet(sets.Cure)
		if string.match(spell.Name, "Cursna") then
			gFunc.EquipSet(sets.Cursna)
		end
	elseif spell.Skill == "Summoning Magic" then
		gFunc.EquipSet(sets.SIR)
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
	elseif spell.Skill == "Dark Magic" then
		gFunc.EquipSet(sets.Drain)
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
	end
end

return profile
