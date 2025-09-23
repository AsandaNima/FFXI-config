local profile = {};
gcdisplay = gFunc.LoadFile("common\\gcdisplay.lua");
gcinclude = gFunc.LoadFile("common\\gcinclude.lua");

--[[
        Ammo = "",
        Head = "",
        Neck = "",
        Ear1 = "",
        Ear2 = "",
        Body = "",
        Hands = "",
        Ring1 = "",
        Ring2 = "",
        Back = "",
        Waist = "",
        Legs = "",
        Feet = "",

]]--


local sets = {
    Idle = {
        Neck = "Parade Gorget",
    },
    Resting = {},
    Idle_Regen = {
    },
    Idle_Refresh = {
        Neck = "Parade Gorget",
    },
    Town = {
        Body = "Ducal Aketon",
    },

    Dt = {
    },

    Tp_Default = {
        Ammo = "Happy Egg",
        Head = {"Gallant Coronet" ,"Irn.Msk. Armet", "Eisenschaller"},
        Neck = "Peacock Amulet",
        Ear1 = "Optical Earring",
        Ear2 = "Drone Earring",
        Body = {"Gallant Surcoat" , "Scorpion Harness", "Brigandine", "Ryl.Sqr. Chainmail", "Eisenbrust"},
        Hands = {"Gallant Gauntlets", "Ryl.Sqr. Mufflers"},
        Ring1 = "Rajas Ring",
        Ring2 = { "Toreador's Ring", "Venerer Ring"},
        Back = "High Brth. Mantle",
        Waist = { "Ryl.Kgt. Belt", "Warrior\'s Belt"},
        Legs = {"Gallant Breeches" ,"Cuisses", "Eisendiechlings"},
        Feet = {"Gallant leggings" , "Eisenschuhs"},
    },

    Tp_Hybrid = {
    },

    Tp_Acc = {
        Body = "Scorpion Harness",
    },

    --These will overwrite any above TP profile.Sets if /tankset is used
    Tank_Main_Priority = {
        Ammo = "Happy Egg",
        Head = {"Gallant Coronet" ,"Irn.Msk. Armet", "Eisenschaller"},
        Neck = "Peacock Amulet",
        Ear1 = "Optical Earring",
        Ear2 = "Drone Earring",
        Body = {"Gallant Surcoat" , "Scorpion Harness", "Brigandine", "Ryl.Sqr. Chainmail", "Eisenbrust"},
        Hands = {"Gallant Gauntlets", "Ryl.Sqr. Mufflers"},
        Ring1 = "Rajas Ring",
        Ring2 = { "Toreador's Ring", "Venerer Ring"},
        Back = "High Brth. Mantle",
        Waist = { "Ryl.Kgt. Belt", "Warrior\'s Belt"},
        Legs = {"Gallant Breeches" ,"Cuisses", "Eisendiechlings"},
        Feet = {"Gallant leggings" , "Eisenschuhs"},
    },

    Tank_MEVA = {
    },

    Precast = {--44 w/o Loquac due to HP drop
    Waist = "Swift Belt",
    },

    Cure_Precast = {},

    Enhancing_Precast = {
        Waist = "Siegel Sash",
    },
    SIR = {--10 merits,101 gear
    },
    Enmity = {
    },

    Cure = {
        Neck = "Promise Badge",
        --Hands = "Savage Gauntlets",
        Ring1 = "Saintly Ring",
        Ring2 = "Saintly Ring",
        Waist = "Friar's Rope",
       -- Legs = "Savage Loincloth",
    },
    Phalanx = {
    },
    Reprisal = {
    },
    Flash = {
    },

    Preshot = {},

    Midshot = {},

    Ws_Default = {
        Neck = "Spike Necklace",
--        Body = "Savage Separates",
--        Hands = "Lgn. Mittens",
        Ring1 = "Rajas Ring",
        Ring2 = "San d\'Orian Ring",
        Waist = "Ryl.Kgt. Belt",
--        Legs = "Republic Subligar",
--        Feet = "Savage Gaiters",
    },
    Ws_Hybrid = {},

    Ws_Acc = {},

    Savage_Default = {
    },
    Savage_Hybrid = {
    },
    Savage_Acc = {
    },
    Atone_Default = {
    },
    Atone_Hybrid = {
    },
    Atone_Acc = {
    },

    Fealty = {
        Body = "Cab. Surcoat +3",
    },
    Sentinel = {
        Feet = "Cab. Leggings +1",
    },
    Bash = {
        Hands = "Cab. Gauntlets +2",
    },
    Invincible = {
        Legs = "Cab. Breeches +1",
    },
    Cover = {
        Body = "Cab. Surcoat +3",
        Head = "Rev. Coronet +1",
    },
    Rampart = {
        Head = "Cab. Coronet +1",
    },
    HolyCircle = {
        Feet = "Gallant leggings",
    },
    Movement = {
        Legs = "Crimson Cuisses",
	},
    Sneak = {
		Feet = "Dream Boots +1",
	},
	Invisible = {
		Hands = "Dream Mittens +1",
	},

};

local Settings = {
    CurrentLevel = 0,
};

profile.Sets = sets;

profile.Packer = {
    {Name = "Om. Sandwich", Quantity = "all"},
    {Name = "Black Curry Bun", Quantity = "all"},
};

profile.OnLoad = function()
	gSettings.AllowAddSet = true;
    gcinclude.Initialize();
    gFunc.ApplyBaseSets(profile.Sets);

    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 8");
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
    local player = gData.GetPlayer();

    local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
    if (myLevel ~= Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, myLevel);
        Settings.CurrentLevel = myLevel;
    end

    if (player.Status == "Engaged") then
        gFunc.EquipSet(sets.Tp_Default)
        if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
			gFunc.EquipSet("Tp_" .. gcdisplay.GetCycle("MeleeSet")) end
		if (gcdisplay.GetToggle("TH") == true) then gFunc.EquipSet(sets.TH) end
        if (gcdisplay.GetCycle("TankSet") ~= "None") then
			gFunc.EquipSet("Tank_" .. gcdisplay.GetCycle("TankSet")) end
    elseif (player.Status == "Resting") then
        gFunc.EquipSet(sets.Resting);
    elseif (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
    end
	
    local cover = gData.GetBuffCount("Cover");
	if (cover >= 1) then
		gFunc.EquipSet(sets.Fealty); -- same set as fealty
	end
	
--if HP over 85% put on parade gorget
if ( player.MainJobSync >= 50) then
    if (player.HPP >= 85 and player.MPP <= 50 ) then
        gFunc.Equip("Neck", "Parade Gorget" );
    end
end


    gcinclude.CheckDefault ();
    if (gcdisplay.GetToggle("DTset") == true) then gFunc.EquipSet(sets.Dt) end;
    if (gcdisplay.GetToggle("Kite") == true) then gFunc.EquipSet(sets.Movement) end;
end

profile.HandleAbility = function()
    local ability = gData.GetAction();
    gFunc.EquipSet(sets.Enmity)
	if string.match(ability.Name, "Fealty") then
		gFunc.EquipSet(sets.Fealty);
    elseif string.match(ability.Name, "Sentinel") then
		gFunc.EquipSet(sets.Sentinel);
    elseif string.match(ability.Name, "Shield Bash") or string.match(ability.Name, "Chivalry") then
		gFunc.EquipSet(sets.Bash);
    elseif string.match(ability.Name, "Invincible") then
		gFunc.EquipSet(sets.Invincible);
    elseif string.match(ability.Name, "Cover") then
		gFunc.EquipSet(sets.Cover);
    elseif string.match(ability.Name, "Rampart") then
		gFunc.EquipSet(sets.Rampart);
	elseif string.match(ability.Name, "Holy Circle") then
		gFunc.EquipSet(sets.HolyCircle);
	end

    gcinclude.CheckCancels();
end

profile.HandleItem = function()
    local item = gData.GetAction();

	if string.match(item.Name, "Holy Water") then gFunc.EquipSet(gcinclude.sets.Holy_Water) end
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    gFunc.EquipSet(sets.Precast)

    if (spell.Skill == "Enhancing Magic") then
        gFunc.EquipSet(sets.Enhancing_Precast);
    elseif (spell.Skill == "Healing Magic") then
        gFunc.EquipSet(sets.Cure_Precast);
    end

    gcinclude.CheckCancels();
end

profile.HandleMidcast = function()
    local spell = gData.GetAction();
    gFunc.EquipSet(sets.SIR);

    if string.contains(spell.Name, "Cure") then
        gFunc.EquipSet(sets.Cure);
    elseif string.match(spell.Name, "Phalanx") then
        gFunc.EquipSet(sets.Phalanx);
    elseif string.match(spell.Name, "Reprisal") then
        gFunc.EquipSet(sets.Reprisal);
        return;--dont want to override this with SIR even with SIR toggle
    elseif string.match(spell.Name, "Flash") then
        gFunc.EquipSet(sets.Flash);
    elseif string.match(spell.Name, "Sneak") then
        gFunc.EquipSet(sets.Sneak);
    elseif string.match(spell.Name, "Invisible") then
        gFunc.EquipSet(sets.Invisible);

    else
        gFunc.EquipSet(sets.Enmity);
    end

    if (gcdisplay.GetToggle("SIR") == true) then
        gFunc.EquipSet(sets.SIR);
    end
	--if (gcdisplay.GetToggle("TH") == true) then gFunc.EquipSet(sets.TH) end
    
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
   
        if string.match(ws.Name, "Chant du Cygne") then
            gFunc.EquipSet(sets.Chant_Default)
            if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
            gFunc.EquipSet("Chant_" .. gcdisplay.GetCycle("MeleeSet")); end
	    elseif string.match(ws.Name, "Savage Blade") or string.match(ws.Name, "Knights of Round") then
            gFunc.EquipSet(sets.Savage_Default)
            if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
            gFunc.EquipSet("Savage_" .. gcdisplay.GetCycle("MeleeSet")); end
        elseif string.match(ws.Name, "Atonement") then
            gFunc.EquipSet(sets.Atone_Default)
            if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
            gFunc.EquipSet("Atone_" .. gcdisplay.GetCycle("MeleeSet")); end
        elseif string.match(ws.Name, "Aeolian Edge") then
            gFunc.EquipSet(sets.Aedge_Default)
            if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
            gFunc.EquipSet("Aedge_" .. gcdisplay.GetCycle("MeleeSet")); end
        end
    end
end

return profile;
