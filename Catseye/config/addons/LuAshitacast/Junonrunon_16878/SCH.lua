local profile = {};
gcdisplay = gFunc.LoadFile("common\\gcdisplay.lua");
gcinclude = gFunc.LoadFile("common\\gcinclude.lua");

local sets = {
    Idle = {
        Head = "Scholar's M.board",

        Body = "Scholar's Gown",
        Hands = "Scholar's Bracers",

        Legs = "Scholar's Pants",
        Feet = "Scholar's Loafers",
    },
    Idle_Staff = {
    },
    Resting = {

    },
    Idle_Regen = {
    },
    Idle_Refresh = {
    },
    Town = {
    },

    Dt = {
    },

    Tp_Default = {
        Head = "Walahra Turban",
        Neck = "Wivre Gorget",

        Body = "Scholar's Gown",
        Hands = "Scholar's Bracers",
        Ring1 = "Sniper's Ring",
        Ring2 = "Sniper's Ring",

        Back = "Aesir Mantle",
        Waist = "Swift Belt",
        Legs = "Scholar's Pants",
        Feet = "Scholar's Loafers",

    },
    Tp_Hybrid = {
    },
    Tp_Acc = {
        Head = "Optical Hat",
        Neck = "Wivre Gorget",

        Body = "Scholar's Gown",
        Hands = "Scholar's Bracers",
        Ring1 = "Sniper's Ring",
        Ring2 = "Sniper's Ring",

        Back = "Aesir Mantle",
        Waist = "Virtuoso Belt",
        Legs = "Scholar's Pants",
        Feet = "Scholar's Loafers",
    },


    Precast = {
    },
    Cure_Precast = {
    },
    Enhancing_Precast = {
    },
    Stoneskin_Precast = {
    },


    Cure = {--I cap is 50, II cap is 30
    },
    Self_Cure = {--cap 30
    },
    Regen = {
    },
    Cursna = {
    },

    Enhancing = {
    },
    Self_Enhancing = {},
    Skill_Enhancing = {},
    Stoneskin = {
    },
    Phalanx = {},
    Refresh = {
    },
    Self_Refresh = {},

    Enfeebling = {
    },

    Drain = {
    },

    Nuke = {
        Main = 'Iridal Staff',
        Ammo = 'Mana Ampulla',
        Head = 'Scholar\'s M.board',
        Neck = 'Aesir Torque',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Yigit Gomlek',
        Hands = 'Seer\'s Mitts',
        Back = 'Black Cape',
        Waist = 'Mantra Belt',
        Legs = 'Seer\'s Slacks',
        Feet = 'Scholar\'s Loafers',

    },
    NukeACC = {
    },
    Burst = {
    },
    Helix = {
    },
    HelixBurst = {
    },
    Storm = {
    },
    Kaustra = {--need to refine this set
    },
    Mp_Body = {
    },

    Preshot = {
    },
    Midshot = {
    },

    Ws_Default = {
    },
    Ws_Hybrid = {
    },
    Ws_Acc = {
    },
    Mykyr_Default = {
    },
    Mykyr_Hybrid = {
    },
    Mykyr_Acc = {
    },
    Cataclysm_Default = {
    },
    Cataclysm_Hybrid = {
    },
    Cataclysm_Acc = {
    },

    Sublimation = {
        Head = "Scholar's M.board",
        Body = "Argute Gown",
    },
    Power = {--rapture/ebullience

	},
    Klimaform = {--klimaform dmg boost
	},
    TH = {--/th will force this set to equip for 10 seconds
	},
    Movement = {
        Body = "Kupo Suit",
        Legs = "displaced",
	},
    ['int'] = {
        Main = 'Iridal Staff',
        Sub = 'Rose Strap',
        Ammo = 'Mana Ampulla',
        Head = 'Scholar\'s M.board',
        Neck = 'Aesir Torque',
        Ear1 = 'Moldavite Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Yigit Gomlek',
        Hands = 'Seer\'s Mitts',
        Back = 'Black Cape',
        Waist = 'Mantra Belt',
        Legs = 'Seer\'s Slacks',
        Feet = 'Scholar\'s Loafers',
    },
};
profile.Sets = sets;

profile.Packer = {
    {Name = "Tropical Crepe", Quantity = "all"},
    {Name = "Rolan. Daifuku", Quantity = "all"},
};

profile.OnLoad = function()
	gSettings.AllowAddSet = true;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 8");
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 2");
end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
    gcinclude.SetCommands(args);
end

profile.HandleDefault = function()
    local player = gData.GetPlayer();
    local sub = gData.GetBuffCount("Sublimation: Activated");
    gFunc.EquipSet(sets.Idle);

    if (player.Status == "Engaged") then
        gFunc.EquipSet(sets.Tp_Default)
        if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
            gFunc.EquipSet("Tp_" .. gcdisplay.GetCycle("MeleeSet")) end
		if (gcdisplay.GetToggle("TH") == true) then gFunc.EquipSet(sets.TH) end
    elseif (player.Status == "Resting") then
        gFunc.EquipSet(sets.Resting);
    elseif (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
    end
	
    gcinclude.CheckDefault ();
    if (gcdisplay.GetCycle("Weapon") == "Staff") then
        gFunc.EquipSet(sets.Idle_Staff);
    end
    if (sub > 0) then
        gFunc.EquipSet(sets.Sublimation);
    end
    if (gcdisplay.GetToggle("DTset") == true) then gFunc.EquipSet(sets.Dt) end;
    if (gcdisplay.GetToggle("Kite") == true) then gFunc.EquipSet(sets.Movement) end;
end

profile.HandleAbility = function()
    local ability = gData.GetAction();

    gcinclude.CheckCancels();
end

profile.HandleItem = function()
    local item = gData.GetAction();

	if string.match(item.Name, "Holy Water") then gFunc.EquipSet(gcinclude.sets.Holy_Water) end
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();

    gFunc.EquipSet(sets.Precast);

    if (spell.Skill == "Enhancing Magic") then
        gFunc.EquipSet(sets.Enhancing_Precast);

        if string.contains(spell.Name, "Stoneskin") then
            gFunc.EquipSet(sets.Stoneskin_Precast);
        end
    elseif (spell.Skill == "Healing Magic") then
        gFunc.EquipSet(sets.Cure_Precast);
    end

    gcinclude.CheckCancels();
    if (gcdisplay.GetCycle("Weapon") == "Staff") then
        gFunc.EquipSet(sets.Idle_Staff);
    end
end

profile.HandleMidcast = function()
    local player = gData.GetPlayer();
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);
    local power = gData.GetBuffCount("Ebullience") +  gData.GetBuffCount("Rapture");
    local klimaform = gData.GetBuffCount("Klimaform");

    if (spell.Skill == "Enhancing Magic") then
        gFunc.EquipSet(sets.Enhancing);
        if (target.Name == me) then
            gFunc.EquipSet(sets.Self_Enhancing);
        end

        if string.match(spell.Name, "Phalanx") then
            gFunc.EquipSet(sets.Phalanx);
        elseif string.match(spell.Name, "Stoneskin") then
            gFunc.EquipSet(sets.Stoneskin);
        elseif string.contains(spell.Name, "Regen") then
            gFunc.EquipSet(sets.Regen);
        elseif string.contains(spell.Name, "storm") then
            gFunc.EquipSet(sets.Storm);
        elseif string.contains(spell.Name, "Refresh") then
            gFunc.EquipSet(sets.Refresh);
            if (target.Name == me) then
                gFunc.EquipSet(sets.Self_Refresh);
            end
        end
    elseif (spell.Skill == "Healing Magic") then
        gFunc.EquipSet(sets.Cure);
        if (target.Name == me) then
            gFunc.EquipSet(sets.Self_Cure);
        end
        if string.match(spell.Name, "Cursna") then
            gFunc.EquipSet(sets.Cursna);
        end
    elseif (spell.Skill == "Elemental Magic") then
        gFunc.EquipSet(sets.Nuke);

        if (gcdisplay.GetCycle("NukeSet") == "Macc") then
            gFunc.EquipSet(sets.NukeACC);
        end
        if (gcdisplay.GetToggle("Burst") == true) then
            gFunc.EquipSet(sets.Burst);
        end
        if (spell.Element == weather.WeatherElement) then
            gFunc.Equip("Waist", "Hachirin-no-Obi");
            if klimaform > 0 then
                gFunc.EquipSet(sets.Klimaform);
            end
        elseif (spell.Element == weather.DayElement) then
            gFunc.Equip("Waist", "Hachirin-no-Obi");
        end
        if (player.MPP <= 40) then
            gFunc.EquipSet(sets.Mp_Body);
        end
        if string.contains(spell.Name, "helix") then
            gFunc.EquipSet(sets.Helix);
            if (gcdisplay.GetToggle("Burst") == true) then
                gFunc.EquipSet(sets.HelixBurst);
            end
            if string.contains(spell.Name, "Nocto") then
                gFunc.Equip("Head", "Pixie Hairpin +1");
            end
        end
    elseif (spell.Skill == "Enfeebling Magic") then
        gFunc.EquipSet(sets.Enfeebling);
    elseif (spell.Skill == "Dark Magic") then
        gFunc.EquipSet(sets.Enfeebling); -- mostly macc anyways
        if (string.contains(spell.Name, "Aspir") or string.contains(spell.Name, "Drain")) then
            gFunc.EquipSet(sets.Drain);
        elseif (string.match(spell.Name, "Kaustra")) then
            gFunc.EquipSet(sets.Kaustra);
        end
    end

    if (power > 0) then
        gFunc.EquipSet(sets.Power);
    end
    if (gcdisplay.GetCycle("Weapon") == "Staff") then
        gFunc.EquipSet(sets.Idle_Staff);
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

        if string.match(ws.Name, "Cataclysm") then
            gFunc.EquipSet(sets.Cataclysm_Default)
            if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
            gFunc.EquipSet("Cataclysm_" .. gcdisplay.GetCycle("MeleeSet")); end
        elseif string.match(ws.Name, "Mykyr") then
            gFunc.EquipSet(sets.Mykyr_Default)
            if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
            gFunc.EquipSet("Mykyr_" .. gcdisplay.GetCycle("MeleeSet")); end
        end
    end
end

return profile;
