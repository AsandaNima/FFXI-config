local profile = {}
gcinclude = gFunc.LoadFile("common\\gcinclude.lua")

local sets = {
	Idle = {},
	Resting = {},
	Idle_Regen = {},
	Idle_Refresh = {},
	Town = {},

	Dt = {},
	Pet_Dt = {},

	Tp_Default = {
		Head = { "Entrancing Ribbon", "Tlahtlamah Glasses" },
		Neck = { "Armiger's Lace" },
		Ear1 = { "Optical Earring" },
		Ear2 = { "Wilderness Earring" },

		Body = { "Leather Vest", "Fisherman's Smock" },
		Hands = { "Mithran Gauntlets" },
		Ring1 = { "Bastokan Ring" },
		Ring2 = { "San d'Orian Ring" },

		Waist = { "Leather Belt" },
		Legs = { "Herder's Subligar", "Mithran Loincloth" },
		Feet = { "Leaping Boots", "Mithran Gaiters" },
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

	Ws_Default = {},
	Ws_Hybrid = {},
	Ws_Acc = {},
	Aedge_Default = {},
	Aedge_Hybrid = {},
	Aedge_Acc = {},

	Call = {},
	Reward = {},
	Killer = {},
	Spur = {},
	Ready = {},
	PetReadyDefault = {},
	PetAttack = {},
	PetMagicAttack = {},
	PetMagicAccuracy = {},

	TH = {},
	Movement = {},
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
	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 9")
	AshitaCore:GetChatManager():QueueCommand(1, "/macro set 10")

	gcinclude.settings.RefreshGearMPP = 50
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
	if petAction ~= nil then
		HandlePetAction(petAction)
		return
	end

	local player = gData.GetPlayer()
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
	local spell = gData.GetAction()
	gFunc.EquipSet(sets.Precast)

	gcinclude.CheckCancels()
end

profile.HandleMidcast = function()
	local player = gData.GetPlayer()
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
