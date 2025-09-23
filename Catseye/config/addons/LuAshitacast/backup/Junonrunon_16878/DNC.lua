local profile = {};
gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

--[[
    Range
        Range = 'Ungur Boomerang',-- +8evasion

    Head
		Head = 'Empress Hairpin',-- +3dex +3agi
        Head = 'Optical Hat',-- +10acc +10racc +10evasion
        Head = 'Asn. Bonnet +1',-- +6dex +1mug
        Head = 'Rogue\'s Bonnet',-- +2dex +5int +1steal
        Head = 'Homam Zucchetto',-- +3haste +4acc
    Neck
		Neck = 'Spike Necklace',-- +3dex +3str
        Neck = 'Peacock Amulet',-- +10acc +10racc
        Neck = 'Nanaa\'s Charm',-- +3acc +1TH
        Neck = 'Evasion Torque',-- +7evasion
        Neck = 'Love Torque',-- +5dex +7dagger

    Ear1
		Ear1 = 'Suppanomimi',-- +2dex +5dagger +5evasion +5katana
        Ear1 = 'Stealth Earring',-- +5DW

    Ear2
		Ear2 = 'Ethereal Earring',-- +5attack +5evasion
        Ear2 = 'Brutal Earring',-- +5DA +1Store TP
        Ear2 = 'Minuet Earring',-- +1dex
        Ear2 = 'Drone Earring',-- +3agi

    Body
		Body = 'Dragon Harness',--6dex +6agi +10attk
        Body = 'Homam Corazza',--15acc +1tripple attack
		Body = 'Scorpion Harness',-- +10acc +10evasion
        Body = 'Assault Jerkin',-- +3acc +18attack
        Body = 'Assassin\'s Vest',-- +4agi
        Body = 'Rogues\'s Vest',-- +3str +3acc +1hide
        Body = 'Rapparee Harness',-- +2racc +4haste
        Body = 'Noct Doublet +1',-- +3racc

    Hands
        Hands = 'Hecatomb Mittens',-- +4dex +7str
        Hands = 'Asn. Armlets +1',-- +5chr +1TH
        Hands = 'Dusk Gloves',--+5attack +3haste
        Hands = 'Rog. Armlets +1',-- +3dex +1steal
        Hands = 'Noct Gloves',-- +1racc
        Hands = 'Thief\'s Kote',-- +3steal
        Hands = 'War Gloves',-- +5acc +5evasion

    Ring1
        Ring1 = 'Rajas Ring',-- +5dex +5str +5tp +5subtle
        Ring1 = 'Breeze Ring',-- +5 agi
        Ring1 = 'Sniper\'s Ring',-- +5 acc

    Ring2
        Ring2 = 'Flourite Ring',-- +3 dex
        Ring2 = 'Thunder Ring',-- +5 dex
        Ring2 = 'Crossbowman Ring',-- +5 rattack
        Ring2 = 'Venerer Ring',-- +3 acc
        Ring2 = 'Sniper\'s Ring',-- +5 acc
        Ring2 = 'Toreador\'s Ring',-- +7 acc
        Ring2 = 'Breeze Ring',-- +5 agi

    Back
        Back = 'Amemet mantle',-- +1str +10att +10ratt
        Back = 'Jaguar Mantle',-- +3att +1evasion
        Back = 'Assassin\'s Cape',-- +4dex +4agi
        Back = 'Boxer Mantle',-- +10Eva +10Shield +10Parry

    Waist
		Waist = 'Ryl.Kgt. Belt',-- +2dex +2agi
        Waist = 'Life Belt',-- +10acc
        Waist = 'Swift Belt',-- +3acc +4haste
        Waist = 'Scouter\'s Rope',-- +4AGI +10evasion
        Waist = 'Warwolf Belt',-- +5STR +5DEX +5VIT

    Legs
		Legs = 'Noct Brais',-- +1dex
        Legs = 'Assassin\'s Culottes',-- +5steal
        Legs = 'Rogue\'s Culottes',-- +4agi +1steal +10shield
        Legs = 'Dragon Subligar',-- +4dex
        Legs = 'Crow Hose',-- +5evasion

    Feet
		Feet = 'Bounding Boots',-- +3dex +3agi
        Feet = 'Asn. Pouln. +1',-- +6chr +1tripple
        Feet = 'Rogue\'s Poelaines',-- +3dex +2steal +1flee
        Feet = 'Dance Shoes',-- +3chr +6evasion
        Feet = 'Homam Gambieras',-- +3haste +6acc +6racc

]]

local sets = {
    Idle = {
        Ammo = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },
    Resting = {},
    Idle_Regen = {
        Ammo = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },
    Idle_Refresh = {},
    Town = {
        Ammo = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },

    Dt = {
        Ammo = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },

    Tp_Default = {
        Ammo = '',
        Head = "Walahra Turban",
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = 'Rapparee Harness',-- +2racc +4haste
--        Body = 'Scorpion Harness',-- +10acc +10evasion
--        Body = 'Dancer\'s  Casaque',
        Hands = 'Dancer\'s Bangles',
        Ring1 = 'Sniper\'s Ring',-- +5 acc
        Ring2 = 'Sniper\'s Ring',-- +5 acc
        Back = '',
        Waist = 'Swift Belt',-- +3acc +4haste
        Legs = 'Dancer\'s Tights',
        Feet = 'Bounding Boots',-- +3dex +3agi
    },
    Tp_Hybrid = {
    },
    Tp_Acc = {
    },


    Precast = {
        Ammo = '',
        Head = "Walahra Turban",
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = '',
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },

    Preshot = {
    },
    Midshot = {
    },

    Ws_Default = {
        Ammo = '',
        Head = '',
        Neck = '',
        Ear1 = '',
        Ear2 = '',
        Body = 'Assault Jerkin',-- +3acc +18attack
        Hands = '',
        Ring1 = '',
        Ring2 = '',
        Back = '',
        Waist = '',
        Legs = '',
        Feet = '',
    },
    Ws_Hybrid = {
    },
    Ws_Acc = {
    },

    Aedge_Default = {
    },
    Aedge_Hybrid = {},
    Aedge_Acc = {},

    Waltz = {
        Body = 'Dancer\'s  Casaque',
    },

    Step = {
        Body = 'Scorpion Harness',-- +10acc +10evasion
        Hands = 'Dancer\'s Bangles',
    },

    Samba = {
        Head = 'Dancer\'s Tiara',
    },
   
    Jig = {
        Feet = 'Dancer\'s Toe Shoes',
    },

    TH = {--/th will force this set to equip for 10 seconds
        Ammo = 'Per. Lucky Egg',
		Waist = 'Chaac Belt',
        Feet = { Name = 'Herculean Boots', Augment = { [1] = 'Potency of "Cure" effect received+5%', [2] = 'Mag. Acc.+19', [3] = 'Accuracy+21', [4] = '"Mag. Atk. Bns."+19', [5] = '"Treasure Hunter"+2' } },
	},
    Movement = {
        Feet = 'Herald\'s Gaiters',
	},
};
profile.Sets = sets;

profile.Packer = {
    --{Name = 'Chonofuda', Quantity = 'all'},
};

profile.OnLoad = function()
	gSettings.AllowAddSet = true;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 3');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
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
    
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default);
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Tp_' .. gcdisplay.GetCycle('MeleeSet')) end
		if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH) end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    elseif (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
    end
	
    gcinclude.CheckDefault ();
    if (gcdisplay.GetToggle('DTset') == true) then gFunc.EquipSet(sets.Dt) end;
    if (gcdisplay.GetToggle('Kite') == true) then gFunc.EquipSet(sets.Movement) end;
end

profile.HandleAbility = function()
    local ability = gData.GetAction();

    if string.match(ability.Name, 'Provoke') then gFunc.EquipSet(sets.Enmity);
    elseif string.contains(ability.Name, 'Step') then gFunc.EquipSet(sets.Step);
    elseif string.contains(ability.Name, 'Sambba') then gFunc.EquipSet(sets.Samba);
    elseif string.contains(ability.Name, 'Jig') then gFunc.EquipSet(sets.Jig);
    elseif string.contains(ability.Name, 'Waltz') then gFunc.EquipSet(sets.Waltz) end

    gcinclude.CheckCancels();
end

profile.HandleItem = function()
    local item = gData.GetAction();

	if string.match(item.Name, 'Holy Water') then gFunc.EquipSet(gcinclude.sets.Holy_Water) end
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    gFunc.EquipSet(sets.Precast);

    gcinclude.CheckCancels();
end

profile.HandleMidcast = function()
    local spell = gData.GetAction();
	if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH) end
end

profile.HandlePreshot = function()
    gFunc.EquipSet(sets.Preshot);
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Midshot);
	if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH) end
end

profile.HandleWeaponskill = function()
    local canWS = gcinclude.CheckWsBailout();
    if (canWS == false) then gFunc.CancelAction() return;
    elseif (gcdisplay.GetToggle('PROC') == true) then
        gFunc.EquipSet(sets.Ws_Proc);
    else
        local ws = gData.GetAction();
    
        gFunc.EquipSet(sets.Ws_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet')) end

	    if string.match(ws.Name, 'Aeolian Edge') then
            gFunc.EquipSet(sets.Aedge_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Aedge_' .. gcdisplay.GetCycle('MeleeSet')); end
        end
    end
end

return profile;
