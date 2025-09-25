local profile = {}
gcinclude = gFunc.LoadFile("common\\gcinclude.lua")

local Settings = {
	CurrentLevel = 0,
}

local sets = {
	Idle = {},
	Resting = {},
	Idle_Regen = {},
	Idle_Refresh = {},
	Town = {},

	Dt = {},

	Tp_Default = {
		Head = { "Empress hairpin", "Garrison Sallet +1", "Cmp. Eye Circlet" },
		Neck = { "Peacock Charm", "Pile Chain" },
		Ear1 = { "Optical Earring" },
		Ear2 = { "Outlaw's Earring" },

		Body = { "Garrison Tunica +1", "Leather Vest", "Mithran Separates" },
		Hands = { "Guerilla Gloves", "Mithran Gauntlets" },
		Ring1 = { "Archer's Ring", "Bastokan Ring" },
		Ring2 = { "Archer's Ring", "San d'Orian Ring" },

		Back = { "Ram Mantle", "Traveler's Mantle" },
		Waist = { "Virtuoso Belt", "Tilt Belt", "Leather Belt" },
		Legs = { "Garrison Hose", "Phl. Trousers", "Mithran Loincloth" },
		Feet = { "Leaping Boots", "Mithran Gaiters" },
	},
	Tp_Hybrid = {},
	Tp_Acc = {},
	Tp_Proc = {},

	Precast = {},

	Utsu = {},
	Nuke = {},
	Macc = {},

	Preshot = {},
	Midshot = {},

	Ws_Default = {},
	Ws_Hybrid = {},
	Ws_Acc = {},
	Ws_Proc = {},

	Hi_Default = {},
	Hi_Hybrid = {},
	Hi_Acc = {},

	Metsu_Default = {},
	Metsu_Hybrid = {},
	Metsu_Acc = {},

	Shun_Default = {},
	Shun_Hybrid = {},
	Shun_Acc = {},

	Chi_Default = {},
	Chi_Hybrid = {},
	Chi_Acc = {},

	Enmity = {},

	Futae = {},
	Yonin = {},
	Innin = {},
	Migawari = {},
	Mijin = {},
	TH = {},
	Movement = {},
	Movement_Night = {},
	Extra1 = {},
	Extra2 = {},
	Extra3 = {},
}
profile.Sets = sets

profile.Packer = {
	{ Name = "Toolbag (Ino)", Quantity = "all" },
	{ Name = "Toolbag (Shika)", Quantity = "all" },
	{ Name = "Toolbag (Cho)", Quantity = "all" },
	{ Name = "Toolbag (Shihe)", Quantity = "all" },
	{ Name = "Shihei", Quantity = "all" },
	{ Name = "Inoshishinofuda", Quantity = "all" },
	{ Name = "Chonofuda", Quantity = "all" },
	{ Name = "Shikanofuda", Quantity = "all" },
	{ Name = "Forbidden Key", Quantity = "all" },
	{ Name = "Date Shuriken", Quantity = "all" },
}

profile.OnLoad = function()
	gSettings.AllowAddSet = true
	gcinclude.Initialize()

	AshitaCore:GetChatManager():QueueCommand(1, "/macro book 10")
	AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1")
end

profile.OnUnload = function()
	gcinclude.Unload()
end

profile.HandleCommand = function(args)
	gcinclude.HandleCommands(args)
end

profile.HandleDefault = function()
	gFunc.EquipSet(sets.Idle)
	local game = gData.GetEnvironment()
	local player = gData.GetPlayer()
	local yonin = gData.GetBuffCount("Yonin")
	local innin = gData.GetBuffCount("Innin")
	local migawari = gData.GetBuffCount("Migawari")

	if player.Status == "Engaged" then
		gFunc.EquipSet(sets.Tp_Default)
		if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
			gFunc.EquipSet("Tp_" .. gcdisplay.GetCycle("MeleeSet"))
		end
		if yonin > 0 then
			gFunc.EquipSet(sets.Yonin)
		elseif innin > 0 then
			gFunc.EquipSet(sets.Innin)
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
		if (game.Time < 6.00) or (game.Time > 18.00) then
			gFunc.EquipSet(sets.Movement_Night)
		else
			gFunc.EquipSet(sets.Movement)
		end
	end

	gcinclude.CheckDefault()
	if gcdisplay.GetToggle("DTset") == true then
		gFunc.EquipSet(sets.Dt)
	end
	if migawari > 0 then
		gFunc.EquipSet(sets.Migawari)
	end
	if gcdisplay.GetToggle("Kite") == true then
		if (game.Time < 6.00) or (game.Time > 18.00) then
			gFunc.EquipSet(sets.Movement_Night)
		else
			gFunc.EquipSet(sets.Movement)
		end
	end
end

profile.HandleAbility = function()
	local ability = gData.GetAction()

	if string.match(ability.Name, "Provoke") then
		gFunc.EquipSet(sets.Enmity)
	elseif string.match(ability.Name, "Mijin Gakure") then
		gFunc.EquipSet(sets.Mijin)
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
	gcinclude.DoShadows(spell)

	gFunc.EquipSet(sets.Precast)
	gcinclude.CheckCancels()
end

profile.HandleMidcast = function()
	local spell = gData.GetAction()
	local futae = gData.GetBuffCount("Futae")

	if spell.Skill == "Ninjutsu" then
		if string.contains(spell.Name, "Utsusemi") then
			gFunc.EquipSet(sets.Utsu)
		elseif gcinclude.NinNukes:contains(spell.Name) then
			gFunc.EquipSet(sets.Nuke)
			if futae > 0 then
				gFunc.EquipSet(sets.futae)
			end
		else
			gFunc.EquipSet(sets.Macc)
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
	elseif gcdisplay.GetToggle("PROC") == true then
		gFunc.EquipSet(sets.Ws_Proc)
	else
		local ws = gData.GetAction()

		gFunc.EquipSet(sets.Ws_Default)
		if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
			gFunc.EquipSet("Ws_" .. gcdisplay.GetCycle("MeleeSet"))
		end

		if string.match(ws.Name, "Blade: Hi") then
			gFunc.EquipSet(sets.Hi_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Hi_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		elseif string.match(ws.Name, "Blade: Metsu") then
			gFunc.EquipSet(sets.Metsu_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Metsu_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		elseif string.match(ws.Name, "Blade: Shun") then
			gFunc.EquipSet(sets.Shun_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Shun_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		elseif
			string.match(ws.Name, "Blade: Chi")
			or string.match(ws.Name, "Blade: Teki")
			or string.match(ws.Name, "Blade: To")
		then
			gFunc.EquipSet(sets.Chi_Default)
			if gcdisplay.GetCycle("MeleeSet") ~= "Default" then
				gFunc.EquipSet("Chi_" .. gcdisplay.GetCycle("MeleeSet"))
			end
		end
	end
end
