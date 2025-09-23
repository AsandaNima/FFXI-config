local profile = {};
gcdisplay = gFunc.LoadFile("common\\gcdisplay.lua");
gcinclude = gFunc.LoadFile("common\\gcinclude.lua");
local isTargetTagged = gFunc.LoadFile("common\\isTargetTagged.lua");
--[[
    Range
        Range = "Ungur Boomerang",-- +8evasion

    Head
		Head = "Empress Hairpin",-- +3dex +3agi
        Head = "Optical Hat",-- +10acc +10racc +10evasion
        Head = "Asn. Bonnet +1",-- +6dex +1mug
        Head = "Rogue's Bonnet",-- +2dex +5int +1steal
        Head = "Homam Zucchetto",-- +3haste +4acc
    Neck
		Neck = "Spike Necklace",-- +3dex +3str
        Neck = "Peacock Amulet",-- +10acc +10racc
        Neck = "Nanaa's Charm",-- +3acc +1TH
        Neck = "Evasion Torque",-- +7evasion
        Neck = "Love Torque",-- +5dex +7dagger

    Ear1
		Ear1 = "Suppanomimi",-- +2dex +5dagger +5evasion +5katana
        Ear1 = "Stealth Earring",-- +5DW

    Ear2
		Ear2 = "Ethereal Earring",-- +5attack +5evasion
        Ear2 = "Novia Earring",-- +7eva
        Ear2 = "Brutal Earring",-- +5DA +1Store TP
        Ear2 = "Minuet Earring",-- +1dex
        Ear2 = "Drone Earring",-- +3agi

    Body
		Body = "Dragon Harness",--6dex +6agi +10attk
        Body = "Homam Corazza",--15acc +1tripple attack
		Body = "Scorpion Harness",-- +10acc +10evasion
        Body = "Assassin's Vest",-- +4agi
        Body = "Rogues's Vest",-- +3str +3acc +1hide
        Body = "Rapparee Harness",-- +2racc +4haste
        Body = "Noct Doublet +1",-- +3racc

    Hands
        Hands = "Hecatomb Mittens",-- +4dex +7str
        Hands = "Asn. Armlets +1",-- +5chr +1TH
        Hands = "Dusk Gloves",--+5attack +3haste
        Hands = "Homam Manopolas",--+3haste +4acc
        Hands = "Rog. Armlets +1",-- +3dex +1steal
        Hands = "Noct Gloves",-- +1racc
        Hands = "Thief's Kote",-- +3steal
        Hands = "War Gloves",-- +5acc +5evasion

    Ring1
        Ring1 = "Rajas Ring",-- +5dex +5str +5tp +5subtle
        Ring1 = "Breeze Ring",-- +5 agi
        Ring1 = "Rogue's Ring",-- +3 steal

    Ring2
        Ring2 = "Flourite Ring",-- +3 dex
        Ring2 = "Thunder Ring",-- +5 dex
        Ring2 = "Crossbowman Ring",-- +5 rattack
        Ring2 = "Venerer Ring",-- +3 acc
        Ring2 = "Toreador's Ring",-- +7 acc
        Ring2 = "Breeze Ring",-- +5 agi
        Ring2 = "Rogue's Ring",-- +3steal

    Back
        Back = "Amemet mantle",-- +1str +10att +10ratt
        Back = "Jaguar Mantle",-- +3att +1evasion
        Back = "Assassin's Cape",-- +4dex +4agi
        Back = "Boxer's" Mantle",-- +10Eva +10Shield +10Parry

    Waist
		Waist = "Ryl.Kgt. Belt",-- +2dex +2agi
        Waist = "Life Belt",-- +10acc
        Waist = "Swift Belt",-- +3acc +4haste
        Waist = "Scouter's Rope",-- +4AGI +10evasion
        Waist = "Warwolf Belt",-- +5STR +5DEX +5VIT

    Legs
		Legs = "Noct Brais",-- +1dex
        Legs = "Assassin's Culottes",-- +5steal
        Legs = "Rogue's Culottes",-- +4agi +1steal +10shield
        Legs = "Dragon Subligar",-- +4dex
        Legs = "Crow Hose",-- +5evasion

    Feet
		Feet = "Bounding Boots",-- +3dex +3agi
        Feet = "Asn. Pouln. +1",-- +6chr +1tripple
        Feet = "Rogue's Poelaines",-- +3dex +2steal +1flee
        Feet = "Dance Shoes",-- +3chr +6evasion
        Feet = "Homam Gambieras",-- +3haste +6acc +6racc

]]
local sets = {
    Idle = {
        Head = "President. Hairpin"
        --Body = "Federation Aketon",
		--Hands = "Asn. Armlets +1",-- +5chr +1TH
        --Legs = "Dragon Subligar",-- +4dex
        --Feet = "Homam Gambieras",-- +3haste +6acc +6racc
	},
    Resting = {},
    Idle_Regen = {
        Head = "President. Hairpin",
    },
    Idle_Refresh = {},
	
    Town = {
        Body = "Ducal Aketon",
    },

    Dt = {
        --Range = "Ungur Boomerang",-- +8evasion
        Head = "Optical Hat",-- +10acc +10racc +10evasion-- +10acc +10racc +10evasion
        Neck = "Evasion Torque",-- +7evasion
		Ear1 = "Suppanomimi",-- +2dex +5dagger +5evasion +5katana
		Ear2 = "Novia Earring",-- +7eva
		Body = "Scorpion Harness",-- +10acc +10evasion
        Hands = "War Gloves",-- +5acc +5evasion
		Back = "Boxer's Mantle",-- +10Eva +10Shield +10Parry
        Waist = "Scouter's Rope",-- +4AGI +10evasion
        Legs = "Crow Hose",-- +5evasion
        Feet = "Dance Shoes",-- +3chr +6evasion
	},

    Evasion = {
        --Range = "Ungur Boomerang",-- +8evasion
        Head = "Optical Hat",-- +10acc +10racc +10evasion-- +10acc +10racc +10evasion
        Neck = "Evasion Torque",-- +7evasion
		Ear1 = "Suppanomimi",-- +2dex +5dagger +5evasion +5katana
		Ear2 = "Novia Earring",-- +7eva
		Body = "Scorpion Harness",-- +10acc +10evasion
        Hands = "War Gloves",-- +5acc +5evasion
		Back = "Boxer's Mantle",-- +10Eva +10Shield +10Parry
        Waist = "Scouter's Rope",-- +4AGI +10evasion
        Legs = "Crow Hose",-- +5evasion
        Feet = "Dance Shoes",-- +3chr +6evasion
	},

    Tp_Default = {
        Head = "Homam Zucchetto",-- +3haste +4acc
        Neck = "Love Torque",-- +5dex +7dagger
        Ear1 = "Stealth Earring",-- +5DW
        Ear2 = "Brutal Earring",-- +5DA +1Store TP
        Body = "Rapparee Harness",-- +2racc +4haste
        Hands = "Dusk Gloves",--+5attack +3haste
        Ring1 = "Rajas Ring",-- +5dex +5str +5tp +5subtle
        Ring2 = "Toreador's Ring",-- +7 acc
        Back = "Assassin's Cape",-- +4dex +4agi
        Waist = "Swift Belt",-- +3acc +4haste
        Legs = "Dragon Subligar",-- +4dex
        Feet = "Homam Gambieras",-- +3haste +6acc +6racc
    },
    Tp_Hybrid = {
        Head = "Homam Zucchetto",-- +3haste +4acc
        Neck = "Love Torque",-- +5dex +7dagger
        Ear1 = "Stealth Earring",-- +5DW
        Ear2 = "Brutal Earring",-- +5DA +1Store TP
        Body = "Homam Corazza",--15acc +1tripple attack
        Hands = "Homam Manopolas",--+3haste +4acc
        Waist = "Swift Belt",-- +3acc +4haste
        Feet = "Homam Gambieras",-- +3haste +6acc +6racc

    },
    Tp_Acc = {
		Head = "Optical Hat",-- +10acc +10racc +10evasion
		Ear1 = "Suppanomimi",-- +2dex +5dagger +5evasion +5katana
		Body = "Homam Corazza",--15acc +1tripple attack
        Hands = "War Gloves",-- +5acc +5evasion
        Neck = "Peacock Amulet",-- +10acc +10racc,
		Waist = "Life Belt",-- +10acc
        Feet = "Homam Gambieras",-- +3haste +6acc +6racc
    },


    Precast = {
        BaseSet = "Dt",
        Head = "Homam Zucchetto",-- +3haste +4acc
        Ear2 = "Loquac. Earring",--2haste
		Body = "Rapparee Harness",-- +2racc +4haste
		Hands = "Homam Manopolas",--+3haste +4acc
		Waist = "Swift Belt",-- +3acc +4haste
        Feet = "Homam Gambieras",-- +3haste +6acc +6racc
	},

    Preshot = {},
    Midshot = {
		Head = "Optical Hat",-- +10acc +10racc +10evasion
        Neck = "Peacock Amulet",-- +10acc +10racc,
        Ear1 = "Drone Earring",-- +3agi
        Ear2 = "Drone Earring",-- +3agi
        Body = "Rapparee Harness",-- +2racc +4haste
		Hands = "Noct Gloves",-- +1racc
        Ring1 = "Merman's Ring",
		Ring2 = "Merman's Ring",
        Waist = "Ryl.Kgt. Belt",-- +2dex +2agi
		Feet = "Homam Gambieras",-- +3haste +6acc +6racc
    },

    Ws_Default = {
        Head = "Asn. Bonnet +1",-- +6dex +1mug
        Neck = "Love Torque",-- +5dex +7dagger
        Ear1 = "Suppanomimi",-- +2dex +5dagger +5evasion +5katana
        Ear2 = "Ethereal Earring",-- +5attack +5evasion
        Body = "Dragon Harness",--6dex +6agi +10attk
        Hands = "Hecatomb Mittens",-- +4dex +7str
        Ring1 = "Rajas Ring",-- +5dex +5str +5tp +5subtle
        Ring2 = "Toreador's Ring",-- +7 acc
        Back = "Amemet mantle",-- +1str +10att +10ratt
        Waist = "Warwolf Belt",-- +5STR +5DEX +5VIT
        Legs = "Dragon Subligar",-- +4dex
        Feet = "Bounding Boots",-- +3dex +3agi
    },
    Ws_Default_SA = {
		Head = "Asn. Bonnet +1",-- +6dex +1mug
		Neck = "Love Torque",-- +5dex +7dagger
        Ear2 = "Minuet Earring",-- +1dex
		Body = "Dragon Harness",--6dex +6agi
        Hands = "Hecatomb Mittens",-- +4dex +7str
        Ring1 = "Rajas Ring",-- +5dex +5str +5tp +5subtle
        Ring2 = "Thunder Ring",-- +3 dex
		Waist = "Warwolf Belt",-- +5STR +5DEX +5VIT
		Legs = "Dragon Subligar",-- +4dex
		Feet = "Bounding Boots",--+3dex +3agi
    },
    Ws_Default_TA = {
		Head = "Empress Hairpin",-- +3dex +3agi
        Neck = "Love Torque",-- +5dex +7dagger
        Ear1 = "Suppanomimi",-- +2dex +5dagger +5evasion +5katana
        Ear2 = "Drone Earring",-- +3agi
		Body = "Dragon Harness",--6dex +6agi
        Ring1 = "Breeze Ring",-- +5 agi
        Ring2 = "Breeze Ring",-- +5 agi
        Hands = "Rog. Armlets +1",-- +3dex +1steal
		Waist = "Scouter's Rope",-- +4AGI +10evasion
		Legs = "Rogue's Culottes",-- +4agi +1steal +10shield
		Feet = "Bounding Boots",--+3dex +3agi
    },
    Ws_Default_SATA = {
		Head = "Asn. Bonnet +1",-- +6dex +1mug
		Neck = "Love Torque",-- +5dex +7dagger
        Ear1 = "Suppanomimi",-- +2dex +5dagger +5evasion +5katana
        Ear2 = "Drone Earring",-- +3agi
		Body = "Dragon Harness",--6dex +6agi
        Hands = "Hecatomb Mittens",-- +4dex +7str
        Ring1 = "Rajas Ring",-- +5dex +5str +5tp +5subtle
        Ring2 = "Thunder Ring",-- +3 dex
		Waist = "Warwolf Belt",-- +5STR +5DEX +5VIT
		Legs = "Dragon Subligar",-- +4dex
		Feet = "Bounding Boots",--+3dex +3agi
    },
    Ws_Hybrid = {},
    Ws_Hybrid_SA = {},
    Ws_Hybrid_TA = {},
    Ws_Hybrid_SATA = {},
    Ws_Acc = {
		Head = "Optical Hat",-- +10acc +10racc +10evasion
        Neck = "Peacock Amulet",-- +10acc +10racc,
        Body = "Homam Corazza",--15acc +1tripple attack
        Waist = "Warwolf Belt",-- +5STR +5DEX +5VIT
    },
    Ws_Acc_SA = {},
    Ws_Acc_TA = {},
    Ws_Acc_SATA = {},

-- Evisceration
    Evis_Default = {
		Head = "Asn. Bonnet +1",-- +6dex +1mug
		Neck = "Love Torque",-- +5dex +7dagger
        Ear2 = "Minuet Earring",-- +1dex
		Body = "Dragon Harness",--6dex +6agi
        Hands = "Hecatomb Mittens",-- +4dex +7str
        Ring1 = "Rajas Ring",-- +5dex +5str +5tp +5subtle
        Ring2 = "Thunder Ring",-- +3 dex
		Waist = "Warwolf Belt",-- +5STR +5DEX +5VIT
		Legs = "Dragon Subligar",-- +4dex
		Feet = "Bounding Boots",--+3dex +3agi
    },
    Evis_Default_SA = {
    },
    Evis_Default_TA = {
        
    },
    Evis_Default_SATA = {
    },
    Evis_Hybrid = {
    },
    Evis_Hybrid_SA = {},
    Evis_Hybrid_TA = {},
    Evis_Hybrid_SATA = {},
    Evis_Acc = {
    },
    Evis_Acc_SA = {},
    Evis_Acc_TA = {},
    Evis_Acc_SATA = {},

--Shark Bite
Shark_Default = {
    Head = "Asn. Bonnet +1",-- +6dex +1mug
    Neck = "Love Torque",-- +5dex +7dagger
    Ear2 = "Drone Earring",-- +3agi
    Body = "Dragon Harness",--6dex +6agi
    Hands = "Hecatomb Mittens",-- +4dex +7str
    Ring1 = "Rajas Ring",-- +5dex +5str +5tp +5subtle
    Ring2 = "Thunder Ring",-- +3 dex
    Waist = "Warwolf Belt",-- +5STR +5DEX +5VIT
    Legs = "Dragon Subligar",-- +4dex
    Feet = "Bounding Boots",--+3dex +3agi
},
Shark_Default_SA = {},
Shark_Default_TA = {},
Shark_Default_SATA = {},
Shark_Hybrid = {},
Shark_Hybrid_SA = {},
Shark_Hybrid_TA = {},
Shark_Hybrid_SATA = {},
Shark_Acc = {},
Shark_Acc_SA = {},
Shark_Acc_TA = {},
Shark_Acc_SATA = {},


    SATA = {
		Head = "Asn. Bonnet +1",-- +6dex +1mug
		Neck = "Love Torque",-- +5dex +7dagger
        Ear2 = "Drone Earring",-- +3agi
		Body = "Dragon Harness",--6dex +6agi
        Hands = "Hecatomb Mittens",-- +4dex +7str
        Ring1 = "Rajas Ring",-- +5dex +5str +5tp +5subtle
        Ring2 = "Thunder Ring",-- +5 dex
        Back = "Assassin's Cape",-- +4dex +4agi
		Waist = "Warwolf Belt",-- +5STR +5DEX +5VIT
		Legs = "Rogue's Culottes",-- +4agi +1steal +10shield
		Feet = "Bounding Boots",--+3dex +3agi
        
    },
    SA = {
		Head = "Asn. Bonnet +1",-- +6dex +1mug
		Neck = "Love Torque",-- +5dex +7dagger
        Ear2 = "Minuet Earring",-- +1dex
		Body = "Dragon Harness",--6dex +6agi
        Hands = "Hecatomb Mittens",-- +4dex +7str
        Ring1 = "Rajas Ring",-- +5dex +5str +5tp +5subtle
        Ring2 = "Thunder Ring",-- +3 dex
        Back = "Assassin's Cape",-- +4dex +4agi
		Waist = "Warwolf Belt",-- +5STR +5DEX +5VIT
		Legs = "Dragon Subligar",-- +4dex
		Feet = "Bounding Boots",--+3dex +3agi
    },
    TA = {
		Head = "Empress Hairpin",-- +3dex +3agi
        Neck = "Love Torque",-- +5dex +7dagger
        Ear1 = "Drone Earring",-- +3agi
        Ear2 = "Drone Earring",-- +3agi
		Body = "Dragon Harness",--6dex +6agi
        Hands = "Rog. Armlets +1",-- +3dex +1steal
        Ring1 = "Breeze Ring",-- +5 agi
        Ring2 = "Breeze Ring",-- +5 agi
        Back = "Assassin's Cape",-- +4dex +4agi
		Waist = "Scouter's Rope",-- +4AGI +10evasion
		Legs = "Rogue's Culottes",-- +4agi +1steal +10shield
		Feet = "Bounding Boots",--+3dex +3agi
    },
    TH = {
		Neck = "Nanaa's Charm",-- +3acc +1TH
        Hands = "Asn. Armlets +1",-- +5chr +1TH
    },
    Flee = {
        Feet = "Rogue's Poulaines",
    },
	Steal = {
		Head = "Rogue's Bonnet",-- +2dex +5int +1steal",
		Hands = "Thief's Kote",-- +3steal
        Ring2 = "Rogue's Ring",-- +3steal
		Legs = "Assassin's Culottes",-- +5steal
		Feet = "Rogue's Poulaines",-- +2steal
	},
	Mug = {
		Head = "Asn. Bonnet +1",-- +6dex +1mug
	},
    Hide = {
        Body = "Rogue's Vest",
    },
    Movement = {
	},
    Sneak = {
		Feet = "Dream Boots +1",
	},
	Invisible = {
		Hands = "Dream Mittens +1",
	},

};
profile.Sets = sets;

profile.Packer = {
    "Odious Blood",
    "Odious Pen",
    "Odious Skull",
    "Odious Horn",
    {Name = "Forgotten Hope", Quantity = "all"},
    {Name = "Frgtn. Thought", Quantity = "all"},
    "Shrouded Bijou",
    {Name = "T. Whiteshell", Quantity = "all"},
    {Name = "O. Bronzepiece", Quantity = "all"},
    {Name = "1 Byne Bill", Quantity = "all"},
};

profile.OnLoad = function()
	gSettings.AllowAddSet = true;
    gcinclude.Initialize();
    gFunc.ApplyBaseSets(profile.Sets);


    --[[ Set you job macro defaults here]]
    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 1");
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
    local equipment = gData.GetEquipment();
    local sa = gData.GetBuffCount("Sneak Attack");
    local ta = gData.GetBuffCount("Trick Attack");

	
	
	local player = gData.GetPlayer();
    if (player.Status == "Engaged") then
        gFunc.EquipSet(sets.Tp_Default)
        if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
			gFunc.EquipSet("Tp_" .. gcdisplay.GetCycle("MeleeSet")) end
		if (not isTargetTagged()) then
            gFunc.EquipSet(sets.TH);
			--print("isTargetTagged: ".. (isTargetTagged() and "true" or "false"));
        end
        if (gcdisplay.GetToggle("TH") == true) then gFunc.EquipSet(sets.TH) end
    elseif (player.Status == "Resting") then
        gFunc.EquipSet(sets.Resting);
    elseif (player.IsMoving == true) then
        if(gData.GetEquipment().Hands ~= nil) then
            if(gData.GetEquipment().Hands.Name == "Dusk Gloves") then
                --gFunc.Echo(200, gData.GetEquipment().Hands.Name)
            gFunc.Equip("hands", "remove");
            end
        end
        

		gFunc.EquipSet(sets.Movement);
    end
	
    if (sa == 1) and (ta == 1) then
        gFunc.EquipSet("SATA");
    elseif (sa == 1) then
        gFunc.EquipSet("SA");
    elseif (ta == 1) then
        gFunc.EquipSet("TA");
    end
    
    gcinclude.CheckDefault ();
    if (gcdisplay.GetToggle("DTset") == true) then gFunc.EquipSet(sets.Dt) end;
    if (gcdisplay.GetToggle("Kite") == true) then gFunc.EquipSet(sets.Movement) end;

    
        if (gcdisplay.GetToggle("TH") == true) then gFunc.EquipSet(sets.TH) end
    

end

profile.HandleAbility = function()
    local ability = gData.GetAction();
	if string.match(ability.Name, "Flee") then
		gFunc.EquipSet(sets.Flee);
	end
	
	if string.match(ability.Name, "Hide") then
		gFunc.EquipSet(sets.Hide);
	end

	if string.match(ability.Name, "Steal") then
		gFunc.EquipSet(sets.Steal);
	end
	
	if string.match(ability.Name, "Mug") then
		gFunc.EquipSet(sets.Mug);
	end
		
    gcinclude.CheckCancels();
end

profile.HandleItem = function()
    local item = gData.GetAction();

	if string.match(item.Name, "Holy Water") then gFunc.EquipSet(gcinclude.sets.Holy_Water) end
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    gFunc.EquipSet(sets.Dt);
    gFunc.EquipSet(sets.Precast);

    gcinclude.CheckCancels();
end

profile.HandleMidcast = function()
    local player = gData.GetPlayer();
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);

    if (spell.Skill == "Enhancing Magic") then
		if string.match(spell.Name, "Sneak") then
            gFunc.EquipSet(sets.Sneak);
        elseif string.match(spell.Name, "Invisible") then
            gFunc.EquipSet(sets.Invisible);
        end
	end
    --if (gcdisplay.GetToggle("TH") == true) then gFunc.EquipSet(sets.TH) end
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Midshot);
    if (not isTargetTagged()) then
            gFunc.EquipSet(sets.TH);
			--print("isTargetTagged: ".. (isTargetTagged() and "true" or "false"));
        end
    if (gcdisplay.GetToggle("TH") == true) then gFunc.EquipSet(sets.TH) end
end

profile.HandleWeaponskill = function()
    local canWS = gcinclude.CheckWsBailout();
    if (canWS == false) then gFunc.CancelAction() return;
    else
        local ws = gData.GetAction();
        local sa = gData.GetBuffCount("Sneak Attack");
        local ta = gData.GetBuffCount("Trick Attack");
    
        gFunc.EquipSet(sets.Ws_Default)
        if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
        gFunc.EquipSet("Ws_" .. gcdisplay.GetCycle("MeleeSet")) end
        if (sa == 1) and (ta == 1) then
            gFunc.EquipSet("Ws_" .. gcdisplay.GetCycle("MeleeSet") .. "_SATA");
        elseif (sa == 1) then
            gFunc.EquipSet("Ws_" .. gcdisplay.GetCycle("MeleeSet") .. "_SA");
        elseif (ta == 1) then
            gFunc.EquipSet("Ws_" .. gcdisplay.GetCycle("MeleeSet") .. "_TA");
        end

        if string.match(ws.Name, "Evisceration") then
            gFunc.EquipSet(sets.Evis_Default)
            if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
            gFunc.EquipSet("Evis_" .. gcdisplay.GetCycle("MeleeSet")); end
            if (sa == 1) and (ta == 1) then
                gFunc.EquipSet("Evis_" .. gcdisplay.GetCycle("MeleeSet") .. "_SATA");
            elseif (sa == 1) then
                gFunc.EquipSet("Evis_" .. gcdisplay.GetCycle("MeleeSet") .. "_SA");
            elseif (ta == 1) then
                gFunc.EquipSet("Evis_" .. gcdisplay.GetCycle("MeleeSet") .. "_TA");
            end
		elseif string.match(ws.Name, "Shark Bite") then
            gFunc.EquipSet(sets.Evis_Default)
            if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
            gFunc.EquipSet("Shark_" .. gcdisplay.GetCycle("MeleeSet")); end
            if (sa == 1) and (ta == 1) then
                gFunc.EquipSet("Shark_" .. gcdisplay.GetCycle("MeleeSet") .. "_SATA");
            elseif (sa == 1) then
                gFunc.EquipSet("Shark_" .. gcdisplay.GetCycle("MeleeSet") .. "_SA");
            elseif (ta == 1) then
                gFunc.EquipSet("Shark_" .. gcdisplay.GetCycle("MeleeSet") .. "_TA");
            end
        elseif string.match(ws.Name, "Dancing Edge") then
			gFunc.EquipSet(sets.Ws_Acc_SA);
        end
    end
end

return profile;