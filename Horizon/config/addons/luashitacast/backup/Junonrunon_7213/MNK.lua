local profile = {};
gcdisplay = gFunc.LoadFile("common\\gcdisplay.lua");
gcinclude = gFunc.LoadFile("common\\gcinclude.lua");

local sets = {
    Idle = {},
    Resting = {},
    Idle_Regen = {},
    Idle_Refresh = {},
    Town = {
        Body = "Federation Aketon",
    },

    Dt = {},

    Tp_Default = {
        Head = "Mrc. Hachimaki",
        Neck = "Wing Pendant",
        Ear1 = "Beetle Earring",
        Ear2 = "Beetle Earring",
        Body = "Power Gi",
        Hands = "Mrc. Tekko",
        Ring1 =  "Sardonyx Ring",
        Ring2 = "Sardonyx Ring",
        Waist = "Warrior's Belt",
        Legs = "Mrc. Sitabaki",
        Feet = "Mrc. Kyahan",
    },
    Tp_Hybrid = {},
    Tp_Acc = {},


    Precast = {},

    Preshot = {},
    Midshot = {},

    Ws_Default = {
        Hands = "Lgn. Mittens",
    },
    Ws_Hybrid = {},
    Ws_Acc = {},

    Victory_Default = {},
    Victory_Hybrid = {},
    Victory_Acc = {},

    Shijin_Default = {},
    Shijin_Hybrid = {},
    Shijin_Acc = {},

    Impetus = {},

    TH = {},
    Movement = {},
    Sneak = {
		Feet = "Dream Boots +1",
	},
	Invisible = {
		Hands = "Dream Mittens +1",
	},


};
profile.Sets = sets;

profile.Packer = {
    --{Name = "Chonofuda", Quantity = "all"},
};

profile.OnLoad = function()
	gSettings.AllowAddSet = true;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 3");
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1");
end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
    gcinclude.SetCommands(args);
end

profile.HandleDefault = function()
    gFunc.EquipSet(sets.Idle);
    local impetus = gData.GetBuffCount("Impetus");
	
	local player = gData.GetPlayer();
    
    if (player.Status == "Engaged") then
        gFunc.EquipSet(sets.Tp_Default);
        if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
            gFunc.EquipSet("Tp_" .. gcdisplay.GetCycle("MeleeSet")) end
        if (impetus >= 1) then gFunc.EquipSet(sets.Impetus) end
		if (gcdisplay.GetToggle("TH") == true) then gFunc.EquipSet(sets.TH) end
    elseif (player.Status == "Resting") then
        gFunc.EquipSet(sets.Resting);
    elseif (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
    end
	
    gcinclude.CheckDefault ();
    if (gcdisplay.GetToggle("DTset") == true) then gFunc.EquipSet(sets.Dt) end;
    if (gcdisplay.GetToggle("Kite") == true) then gFunc.EquipSet(sets.Movement) end;
end

profile.HandleAbility = function()
    local ability = gData.GetAction();

    if string.match(ability.Name, "Provoke") then gFunc.EquipSet(sets.Enmity) end

    gcinclude.CheckCancels();
end

profile.HandleItem = function()
    local item = gData.GetAction();

	if string.match(item.Name, "Holy Water") then gFunc.EquipSet(gcinclude.sets.Holy_Water) end
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    gFunc.EquipSet(sets.Precast);

    gcinclude.CheckCancels();
end

profile.HandleMidcast = function()
    local spell = gData.GetAction();

    if (spell.Skill == "Enhancing Magic") then
		if string.match(spell.Name, "Sneak") then
            gFunc.EquipSet(sets.Sneak);
        elseif string.match(spell.Name, "Invisible") then
            gFunc.EquipSet(sets.Invisible);
        end
	end


	if (gcdisplay.GetToggle("TH") == true) then gFunc.EquipSet(sets.TH) end
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Midshot);
	if (gcdisplay.GetToggle("TH") == true) then gFunc.EquipSet(sets.TH) end
end

profile.HandleWeaponskill = function()
    local canWS = gcinclude.CheckWsBailout();
    if (canWS == false) then gFunc.CancelAction() return;
    else
        local ws = gData.GetAction();
    
        gFunc.EquipSet(sets.Ws_Default)
        if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
        gFunc.EquipSet("Ws_" .. gcdisplay.GetCycle("MeleeSet")) end

	    if string.match(ws.Name, "Victory Smite") then
            gFunc.EquipSet(sets.Victory_Default)
            if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
            gFunc.EquipSet("Victory_" .. gcdisplay.GetCycle("MeleeSet")); end
        elseif string.match(ws.Name, "Shijin Spiral") then
            gFunc.EquipSet(sets.Shijin_Default)
            if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
            gFunc.EquipSet("Shijin_" .. gcdisplay.GetCycle("MeleeSet")); end
        end
    end
end

return profile;
