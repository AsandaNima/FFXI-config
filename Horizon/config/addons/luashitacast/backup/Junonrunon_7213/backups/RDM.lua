local profile = {};
gcdisplay = gFunc.LoadFile("common\\gcdisplay.lua");
gcinclude = gFunc.LoadFile("common\\gcinclude.lua");

local sets = {
    Idle = {
        --Head =  "Warlock's Chapeau",
        --Body =  "Warlock's Tabard",
        Hands = "Duelist's Gloves",
        --Legs =  "Warlock's Tights",
        --Feet = "Warlock's Boots",
    },
    Resting_Priority = {
		Main = { "Pluto's Staff", "Pilgrim's Wand" },
        Ear1 = "Relaxing Earring",
        Body = "Errant Hpl.",
        Waist = "Duelist's Belt",
        Legs = "Baron's Slops",
	},
    Idle_Regen = {
    },
    Idle_Refresh = {
        Head = "Dls. Chapeau +1",
    },
    Town = {
        --Main = "Fencing Degen",
        --Head =  "Warlock's Chapeau",
        Body = "Ducal Aketon",
        --Hands =  "Warlock's Gloves",
        --Legs =  "Warlock's Tights",
        --Feet = "Warlock's Boots",
    },

    Dt = {},

    Tp_Default = {
        Head = "Optical Hat",-- +10acc +10racc +10evasion
        Neck = "Peacock Amulet",-- +10acc +10racc
        Ear1 = "Brutal Earring",-- +5DA +1Store TP
        Ear2 = "Ethereal Earring",-- +5attack +5evasion
        Body = "Scorpion Harness",-- +10acc +10evasion
        Hands = "Dusk Gloves",--+5attack +3haste
        Ring1 = "Rajas Ring",-- +5dex +5str +5tp +5subtle
        Ring2 = "Toreador's Ring",-- +7 acc
        Back = "Amemet mantle",-- +1str +10att +10ratt
        Waist = "Swift Belt",-- +3acc +4haste
        Legs = "Crow Hose",-- +5evasion
        Feet = "Bounding Boots",-- +3dex +3agi
    },
    Tp_Hybrid = {
    },
    Tp_Acc = {
    },


    Precast = {--fast cast 
        Head =  "Warlock's Chapeau",--10
        Ear2 = "Loquac. Earring",--2
        Body = "Dls. Tabard +1",--10
        Hands = "Dusk Gloves",--+3haste
        Waist = "Swift Belt",-- +4haste
        Feet = "Nashira Crackows",-- +1haste
    },
    Cure_Precast = {
    },
    Enhancing_Precast = {
    },
    Stoneskin_Precast = {
    },


    Cure = {--I cap is 50, II cap is 30
        Head = "Dls. Chapeau +1",
        Neck = "Promise Badge",
        Ear1 = "Novia Earring",
        Body = "Errant Hpl.",
        Hands = "Savage Gauntlets",
        Ring1 = "Saintly Ring",
        Ring2 = "Saintly Ring",
        Waist = "Duelist's Belt",
        Legs =  "Warlock's Tights",
        Back = "Red Cape",
        Legs = "Errant Slops",
        Feet = "Duelist's Boots",
    },
    Self_Cure = {--cap 30
    },
    Regen = {
    },
    Cursna = {
    },

    Enhancing = {
        Neck = "Enhancing Torque",
        Hands = "Duelist's Gloves",
        Legs =  "Warlock's Tights",
    },
    Self_Enhancing = {
        BaseSet = "Enhancing",
    },
    Skill_Enhancing = {
        BaseSet = "Enhancing",
    },
    Stoneskin = {--extra MND
        BaseSet = "Enhancing",
        Head = "Dls. Chapeau +1",--3
        Body = "Errant Hpl.",--10
        Ring1 = "Saintly Ring",--2
        Ring2 = "Saintly Ring",--2
        Back = "Red Cape",--2
        Waist = "Duelist's Belt",--4
        Feet = "Duelist's Boots",--4
    },
    Phalanx = {
        BaseSet = "Enhancing",
    },
    Refresh = {
        BaseSet = "Enhancing",
    },
    Self_Refresh = {
        BaseSet = "Enhancing",
    },

    Enfeebling = {
        Head = "Dls. Chapeau +1",
        Neck = "Enfeebling Torque",
        Body =  "Warlock's Tabard",
    },
    EnfeeblingACC = {
    },
    EnfeeblingMND = {
        BaseSet  = "Enfeebling",
        Hands = "Savage Gauntlets",--2
        Ring1 = "Saintly Ring",--2
        Ring2 = "Saintly Ring",--2
        Back = "Red Cape",--2
        Waist = "Duelist's Belt",--4
        Legs = "Errant Slops",--7
        Feet = "Duelist's Boots",--4
    },
    EnfeeblingINT = {
        BaseSet  = "Enfeebling",
        Ammo = "Phtm. Tathlum",
        Ear1 = "Cunning Earring",
        Ear2 = "Cunning Earring",
        Hands = "Duelist's Gloves",
        Ring1 = "Snow Ring",
        Ring2 = "Snow Ring",
        Waist = "Duelist's Belt",
        Back = "Red Cape",
        Legs = "Errant Slops",
        Feet = "Warlock's Boots",
        	},
    Potency_Enfeebling = {},
    
    Nuke = {
        Ammo = "Phtm. Tathlum",
        Head =  "Warlock's Chapeau",
        Neck = "Black Neckerchief",
        Ear1 = "Moldavite Earring",
        Ear2 = "Cunning Earring",
        Body = "Errant Hpl.",
        Hands = "Duelist's Gloves",
        Ring1 = "Snow Ring",
        Ring2 = "Snow Ring",
        Waist = "Duelist's Belt",
        Back = "Red Cape",
        Legs = "Duelist's Tights",
        Feet = "Nashira Crackows",
    },
    NukeACC = {};
    Dark ={
        BaseSet = "Nuke",
        Hands = "Crimson Fng. Gnt.",
    };

    Drain = {
        BaseSet = "Dark",
    },

    Divine = {
        Main = "Yew Wand +1",
        Head = "Traveler's Hat",
        Neck = "Promise Badge",
        Body = "Errant Hpl.",
        Ring1 = "Saintly Ring",
        Ring2 = "Saintly Ring",
        Waist = "Duelist's Belt",
        Legs = "Savage Loincloth",
        Back = "Red Cape",
        Legs = "Errant Slops",
        Feet = "Duelist's Boots",
    };
    Burst = {},
    Helix = {},
    Mp_Body = {Body = "Seidr Cotehardie",},

    Preshot = {
    },
    Midshot = {
    },

    Ws_Default = {
        Ring1 = "Rajas Ring",-- +5dex +5str +5tp +5subtle
        Ring2 = "Toreador's Ring",-- +7 acc
        Waist = "Warwolf Belt",-- +5STR +5DEX +5VIT
    },
    Ws_Hybrid = {
    },
    Ws_Acc = {
    },

    Savage_Default = {
    },
    Savage_Hybrid = {},
    Savage_Acc = {},

    Chant_Default = {
    },
    Chant_Hybrid = {},
    Chant_Acc = {},

    CS = {
	},
    TH = {--/th will force this set to equip for 10 seconds
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
    {Name = "Tropical Crepe", Quantity = "all"},
    {Name = "Rolan. Daifuku", Quantity = "all"},
};

profile.OnLoad = function()
	gSettings.AllowAddSet = true;
    gcinclude.Initialize();
    gFunc.ApplyBaseSets(profile.Sets);

    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 7");
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1");

    
end

profile.OnUnload = function()
    gcinclude.Unload();

end

profile.HandleCommand = function(args)
    gcinclude.SetCommands(args);
end

profile.HandleDefault = function()

    local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
    if (myLevel ~= Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, myLevel);
        Settings.CurrentLevel = myLevel;
    end


    gFunc.EquipSet(sets.Idle);
	
	local player = gData.GetPlayer();
    if (player.Status == "Engaged") then
        gFunc.EquipSet(sets.Tp_Default)
        if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
			gFunc.EquipSet("Tp_" .. gcdisplay.GetCycle("MeleeSet")) end
		if (gcdisplay.GetToggle("TH") == true) then gFunc.EquipSet(sets.TH) end
        if (gcdisplay.GetToggle("Fight") == false) then
            AshitaCore:GetChatManager():QueueCommand(1, "/fight") end
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

    if ability.Name == "Chainspell" then
        gFunc.EquipSet(sets.CS);
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

        if string.contains(spell.Name, "Stoneskin") then
            gFunc.EquipSet(sets.Stoneskin_Precast);
        end
    elseif (spell.Skill == "Healing Magic") then
        gFunc.EquipSet(sets.Cure_Precast);
    end

    gcinclude.CheckCancels();
end

profile.HandleMidcast = function()
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);
    local player = gData.GetPlayer();

    local ElementalStaffTable = {
        ["Fire"] = "Vulcan's Staff", -- "Vulcan's Staff"
        ["Earth"] = "Terra's Staff",
        ["Water"] = "Neptune's Staff", -- "Neptune's Staff"
        ["Wind"] = "Auster's Staff",
        ["Ice"] = "Aquilo's Staff",
        ["Thunder"] = "Jupiter's Staff",
        ["Light"] = "Apollo's Staff",
        ["Dark"] = "Pluto's Staff"
    };

    local ElementalWaistTable = {
        --["Fire"] = "Karin Obi",
        --["Earth"] = "Dorin Obi",
        --["Water"] = "Suirin Obi",
        --["Wind"] = "Furin Obi",
        ["Ice"] = "Hyorin Obi",
        --["Thunder"] = "Rairin Obi",
        --["Light"] = "Korin Obi",
        --["Dark"] = "Anrin Obi"
    };

    if (spell.Skill == "Enhancing Magic") then
        gFunc.EquipSet(sets.Enhancing);
        if (target.Name == me) then
            gFunc.EquipSet(sets.Self_Enhancing);
        end

        if string.match(spell.Name, "Phalanx") then
            gFunc.EquipSet(sets.Phalanx);
        elseif string.match(spell.Name, "Stoneskin") then
            gFunc.EquipSet(sets.Stoneskin);
        elseif string.contains(spell.Name, "Temper") then
            gFunc.EquipSet(sets.Skill_Enhancing);
        elseif string.contains(spell.Name, "Regen") then
            gFunc.EquipSet(sets.Regen);
        elseif string.contains(spell.Name, "Refresh") then
            gFunc.EquipSet(sets.Refresh);
            if (target.Name == me) then
                gFunc.EquipSet(sets.Self_Refresh);
            end
        elseif (target.Name == me) and string.contains(spell.Name, "En") then
            gFunc.EquipSet(sets.Skill_Enhancing);
		elseif string.match(spell.Name, "Sneak") then
            gFunc.EquipSet(sets.Sneak);
        elseif string.match(spell.Name, "Invisible") then
            gFunc.EquipSet(sets.Invisible);
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

        if (gcdisplay.GetToggle("NukeSet") == "Macc") then
            gFunc.EquipSet(sets.NukeACC);
        end
        if (gcdisplay.GetToggle("Burst") == true) then
            gFunc.EquipSet(sets.Burst);
        end
        if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
            gFunc.Equip("Waist", ElementalWaistTable[spell.Element]);
        end
        if string.match(spell.Name, "helix") then
            gFunc.EquipSet(sets.Helix);
        end
        if (player.MPP <= 40) then
            gFunc.EquipSet(sets.Mp_Body);
        end
        if (spell.MppAftercast < 51) then
            gFunc.Equip("neck", "Uggalepih Pendant");
        end
    elseif (spell.Skill == "Enfeebling Magic") then
        gFunc.EquipSet(sets.Enfeebling);
        if string.contains(spell.Type , "White Magic") then
        gFunc.EquipSet(sets.EnfeeblingMND);
        end
        if string.contains(spell.Type , "Black Magic") then
        gFunc.EquipSet(sets.EnfeeblingINT);
        end
    
--[[        gFunc.EquipSet(sets.Enfeebling);
        if (gcdisplay.GetToggle("NukeSet") == "Macc") then
            gFunc.EquipSet(sets.EnfeeblingACC);
        end
        if string.contains(spell.Name, "Dia")
        or string.contains(spell.Name, "Paralyze") 
        or string.contains(spell.Name, "Slow") 
        or string.contains(spell.Name, "Silence") then
            gFunc.EquipSet(sets.Mind_Enfeebling);
        elseif string.contains(spell.Name, "Poison") 
            or string.contains(spell.Name, "Blind") 
            or string.contains(spell.Name, "Bind") 
            or string.contains(spell.Name, "Sleep") 
            or string.contains(spell.Name, "Gravity") then
            gFunc.EquipSet(sets.Int_Enfeebling);
        elseif string.contains(spell.Name, "Distract") or string.match(spell.Name, "Frazzle III") then
            gFunc.EquipSet(sets.Potency_Enfeebling);
        end
        ]]
    elseif (spell.Skill == "Dark Magic") then
        gFunc.EquipSet(sets.Dark); -- mostly MACC anyways
        if (string.contains(spell.Name, "Aspir") or string.contains(spell.Name, "Drain")) then
            gFunc.EquipSet(sets.Drain);
        end
    elseif (spell.Skill == "Divine Magic") then
        gFunc.EquipSet(sets.Divine);
    end
	
    gFunc.Equip("main", ElementalStaffTable[spell.Element]) 

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
	    elseif string.match(ws.Name, "Savage Blade") then
            gFunc.EquipSet(sets.Savage_Default)
            if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
            gFunc.EquipSet("Savage_" .. gcdisplay.GetCycle("MeleeSet")); end
        end
    end
end

return profile;
