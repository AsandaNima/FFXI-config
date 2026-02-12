local profile = {}
gcinclude = gFunc.LoadFile("common\\gcinclude.lua")

local Settings = {
	CurrentLevel = 0,
}

local sets = {
	Idle = {
		head = "Beast Helm",
		body = "Beast Jackcoat",
		hands = "Beast Gloves",
		legs = "Beast Trousers",
		feet = "Beast Gaiters",
	},
	Resting = {},
	Idle_Regen_Priority = {
		Body = { "Scorpion Harness" },
	},
	Idle_Refresh = {},
	Town = {},

	Dt = {},
	Pet_Dt = {},

	Tp_Default_Priority = {
		Head = { "Entrancing Ribbon", "Tlahtlamah Glasses" },
		Neck = { "Peacock Charm", "Spike Necklace", "Armiger's Lace", "Pile Chain" },
		Ear1 = { "Wilder. Earring +1", "Optical Earring" },
		Ear2 = { "Tribal Earring" },

		Body = { "Scorpion Harness", "Dino Jerkin", "Brigandine +1", "Garrison Tunica +1", "Solid Mail", "Leather Vest", "Fisherman's Smock" },
		Hands = { "Axe. Gauntlets", "Guerilla Gloves", "Mithran Gauntlets" },
		Ring1 = { "Rajas Ring", "Balance Ring +1", "Bastokan Ring" },
		Ring2 = { "Sniper's Ring", "Archer's Ring", "Balance Ring +1", "San d'Orian Ring" },

		Back = { "Amemet Mantle +1", "Ram Mantle", "Lizard Mantle" },
		Waist = { "Swift Belt", "Tilt Belt", "Lizard Belt", "Leather Belt" },
		Legs = { "Herder's Subligar", "Garrison Hose +1", "Solid Cuisses", "Mithran Loincloth" },
		Feet = { "Dino Ledelsens", "Leaping Boots", "Mithran Gaiters" },
	},
	Tp_Hybrid = {},
	Tp_Acc = {},
	Pet_Only_Tp = {},

	Precast = {},

	Enhancing = {},
	Phalanx = {},
	Stoneskin = {},
	Refresh = {},

	Cure = {},

	Enfeebling = {},

	Ws_Default_Priority = {
		Head = { "Shade Tiara" },
		Neck = { "Spike Necklace" },
		Ear1 = { "Pigeon Earring" },
		Ear2 = { "Pigeon Earring" },
		Body = { "Brigandine +1", "Savage Separates" },
		Hands = { "Axe. Gauntlets", "Shade Mittens" },
		Ring1 = { "Rajas Ring", "Courage Ring +1" },
		Ring2 = { "Courage Ring +1", "San d'Orian Ring" },

		Back = { "Amemet Mantle +1", "Exile's Cloak", "Earth Mantle", "Lizard Mantle" },
		Waist = { "Warwolf Belt", "Ryl.Kgt. Belt" },
		Legs = { "Shade Tights", "Garrison Hose +1", "Phl. Trousers" },
		Feet = { "Dino Ledelsens", "Savage Gaiters" },
	},
	Ws_Hybrid = {},
	Ws_Acc = {},
	Aedge_Default = {},
	Aedge_Hybrid = {},
	Aedge_Acc = {},

	Call_Priority = { --CHR
		Head = { "Dino Helm", "Entrancing Ribbon" },
		Neck = { "Beast Whistle" },
		-- 		Ear1 = { "Wilder. Earring +1", "Optical Earring" },
		-- 		Ear2 = { "Tribal Earring" },

		Body = { "Dino Jerkin", "Garrison Tunica +1" },
		Hands = { "Monster Gloves", "Raptor Gloves", "Guerilla Gloves" },
		Ring1 = { "Hope Ring +1" },
		Ring2 = { "Hope Ring +1" },

		-- 		Back = { "Lizard Mantle" },
		Waist = { "Ryl.Kgt. Belt" },
		Legs = { "Herder's Subligar" },
		Feet = { "Dino Ledelsens", "Savage Gaiters" },

	},
	Reward_Priority = {
		Head = { "Garrison Sallet +1" },
		Neck = { "Justice Badge" },
		Ear1 = { "Outlaw's Earring" },
		Body = { "Beast Jackcoat", "Shade Harness" },
		Hands = { "Savage Gauntlets" },
		Ring1 = { "Tamas Ring" },
		Ring2 = { "San d'Orian Ring" },
		Waist = { "Ryl.Kgt. Belt" },
		Legs = { "Savage Loincloth" },
		Feet = { "Monster Gaiters", "Beast Gaiters", "Shade Leggings", "Garrison Boots +1" },
	},
	Killer = {},
	Spur = {},
	Ready_Priority = {},
	PetReadyDefault = {
		Head = { "Entrancing Ribbon" },
		Neck = { "Beast Whistle" },
		-- 		Ear1 = { "Wilder. Earring +1", "Optical Earring" },
		-- 		Ear2 = { "Tribal Earring" },

		Body = { "Garrison Tunica +1" },
		Hands = { "Raptor Gloves", "Guerilla Gloves" },
		Ring1 = { "Hope Ring +1" },
		Ring2 = { "Hope Ring +1" },

		-- 		Back = { "Lizard Mantle" },
		Waist = { "Ryl.Kgt. Belt" },
		Legs = { "Herder's Subligar" },
		Feet = { "Savage Gaiters" },
	},
	PetAttack_Priority = {},
	PetMagicAttack = {},
	PetMagicAccuracy = {},

	TH = {},
	Movement = {},
	Relic = {
		head = "Monster Helm",
		body = "Monster Jackcoat",
		hands = "Monster Gloves",
		legs = "Monster Trousers",
		feet = "Monster Gaiters",
		waist = "Monster Belt",
	},
	Artifact = {
		head = "Beast Helm",
		body = "Beast Jackcoat",
		hands = "Beast Gloves",
		legs = "Beast Trousers",
		feet = "Beast Gaiters",
	},

}
profile.Sets = sets

profile.Packer = {
	{ Name = "Pet Food Theta",  Quantity = "all" },
	{ Name = "Furious Broth",   Quantity = "all" },
	{ Name = "Poisonous Broth", Quantity = "all" },
	{ Name = "Livid Broth",     Quantity = "all" },
	{ Name = "Crackling Broth", Quantity = "all" },
	{ Name = "Dire Broth",      Quantity = "all" },
}

local function HandlePetAction(PetAction)
	-- handle levelsync
	local player = gData.GetPlayer()
	local myLevel = player.MainJobSync

	if myLevel ~= Settings.CurrentLevel then
		gFunc.EvaluateLevels(profile.Sets, myLevel)
		Settings.CurrentLevel = myLevel
	end

	gFunc.EquipSet(sets.PetReadyDefault)

	if gcinclude.BstPetAttack:contains(PetAction.Name) then
		gFunc.EquipSet(sets.PetAttack)
	elseif gcinclude.BstPetMagicAttack:contains(PetAction.Name) then
		gFunc.EquipSet(sets.PetMagicAttack)
	elseif gcinclude.BstPetMagicAccuracy:contains(PetAction.Name) then
		gFunc.EquipSet(sets.PetMagicAccuracy)
	end
end

profile.OnLoad = function()
	gSettings.AllowAddSet = true
	gcinclude.Initialize()

	--[[ Set you job macro defaults here]]
	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 15")
	AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1")

	gcinclude.settings.RefreshGearMPP = 50
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

	local pet = gData.GetPet()
	local petAction = gData.GetPetAction()
	if petAction ~= nil then
		HandlePetAction(petAction)
		return
	end

	if player.Status == "Engaged" then
		gFunc.EquipSet("Tp_" .. gcdisplay.GetCycle("MeleeSet"))
		if gcdisplay.GetToggle("TH") == true then
			gFunc.EquipSet(sets.TH)
		end
	elseif (pet ~= nil) and (player.Status == "Engaged") and (pet.Status == "Engaged") then
		gFunc.EquipSet(sets.Tp_Hybrid)
		if gcdisplay.GetToggle("TH") == true then
			gFunc.EquipSet(sets.TH)
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

	if player.IsMoving == true then
		gFunc.EquipSet(sets.Movement)
	end

	gcinclude.CheckDefault()
	if gcdisplay.GetToggle("DTset") == true then
		gFunc.EquipSet(sets.Dt)
		if (pet ~= nil) and (pet.HPP < 60) then
			gFunc.EquipSet(sets.Pet_Dt)
		end
	end
	if gcdisplay.GetToggle("Kite") == true then
		gFunc.EquipSet(sets.Movement)
	end
	if pet ~= nil then
		if (player.Status == "Engaged") and (pet.Status ~= "Engaged") then
			AshitaCore:GetChatManager():QueueCommand(1, '/ja "Fight" <t>')
		end
	end
end

profile.HandleAbility = function()
	local ability = gData.GetAction()
	if string.match(ability.Name, "Call Beast") or string.match(ability.Name, "Bestial Loyalty") then
		gFunc.EquipSet(sets.Call)
	elseif string.match(ability.Name, "Reward") then
		gFunc.EquipSet(sets.Reward)
	elseif string.match(ability.Type, "Killer Instinct") then
		gFunc.EquipSet(sets.Killer)
	elseif string.match(ability.Type, "Spur") then
		gFunc.EquipSet(sets.Spur)
	elseif string.match(ability.Type, "Ready") then
		gFunc.EquipSet(sets.Ready)
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
	local spell = gData.GetAction()

	if spell.Skill == "Enhancing Magic" then
		gFunc.EquipSet(sets.Enhancing)

		if string.match(spell.Name, "Phalanx") then
			gFunc.EquipSet(sets.Phalanx)
		elseif string.match(spell.Name, "Stoneskin") then
			gFunc.EquipSet(sets.Stoneskin)
		elseif string.contains(spell.Name, "Refresh") then
			gFunc.EquipSet(sets.Refresh)
		end
	elseif spell.Skill == "Healing Magic" then
		gFunc.EquipSet(sets.Cure)
	elseif spell.Skill == "Enfeebling Magic" then
		gFunc.EquipSet(sets.Enfeebling)
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
