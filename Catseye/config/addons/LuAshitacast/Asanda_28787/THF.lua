local profile = {};
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

local Settings = {
    CurrentLevel = 0,
}

local sets = {
    Idle = {
--         Head = 'Malignance Chapeau',
--         Neck = 'Bathy Choker +1',
--         Ear1 = 'Eabani Earring',
        Ear1 = {"Pigeon Earring"},
        Ear2 = {"Pigeon Earring"},
--         Hands = 'Malignance Gloves',
--         Ring1 = 'Moonbeam Ring',
--         Ring2 = 'Chirich Ring +1',
--         Back = 'Solemnity Cape',
--         Waist = 'Flume Belt +1',
--         Legs = 'Gleti\'s Breeches',
--         Feet = 'Gleti\'s Boots',
    },
    Resting = {},
    Idle_Regen = {
--         Head = "Garrison Sallet +1",
--         Head = 'Meghanada Visor +2',
--         Neck = 'Bathy Choker +1',
--         Ear1 = 'Infused Earring',
--         Hands = 'Meg. Gloves +2',
--         Ring2 = 'Chirich Ring +1',
--         Feet = 'Meg. Jam. +2',
    },
    Idle_Refresh = {},
    Town = {
--         Main = 'Tauret',
--         Sub = 'Shijo',
--         Ammo = 'Coiste Bodhar',
    },

    Dt = {
--         Head = 'Nyame Helm',
--         Neck ='Bathy Choker +1',
--         Ear1 = 'Odnowa Earring +1',
--         Ear2 = 'Etiolation Earring',
--         Body = 'Nyame Mail',
--         Hands = 'Nyame Gauntlets',
--         Ring1 = 'Moonbeam Ring',
--         Ring2 = 'Gelatinous Ring +1',
--         Back = { Name = 'Toutatis\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = 'Accuracy+30', [3] = 'Attack+20', [4] = '"Store TP"+10', [5] = 'DEX+20' } },
--         Waist = 'Sailfi Belt +1',
--         Legs = 'Nyame Flanchard',
--         Feet = 'Nyame Sollerets',
    },

    Tp_Default_Priority = {
        Head = {"Yagudo Crown", "Adhemar Bonnet", "Empress hairpin", "Garrison Sallet +1", "Cmp. Eye Circlet"},
        Neck = {"Peacock Charm", "Pile Chain"},
        Ear1 = {"Brutal Earring", "Outlaw's Earring", "Pigeon Earring"},
        Ear2 = {"Suppanomimi","Pigeon Earring", "Optical Earring"},

        Body = {"Adhemar Jacket", "Garrison Tunica +1", "Leather Vest", "Mithran Separates"},
        Hands = {"Adhemar Wristbands", "Battle Gloves", "Mithran Gauntlets"},
        Ring1 = {"Rajas Ring", 'Archer\'s Ring'},
        Ring2 = {"Zilant Ring", "Ulthalam's Ring", 'Archer\'s Ring'},


        Back = {"Assassin's Cape", "Ram Mantle", "Traveler's Mantle"},
        Waist = {"Ninurta's Sash", "Virtuoso Belt", "Tilt Belt", "Leather Belt"},
        Legs = {"Adhemar Kecks", "Garrison Hose","Phl. Trousers", "Mithran Loincloth"},
        Feet = {"Adhemar Gamashes", "Leaping Boots", "Mithran Gaiters"},

--         Head = { Name = 'Adhemar Bonnet +1', AugPath='B' },
--         Neck = 'Anu Torque',
--         Ear1 = 'Sherida Earring',
--         Ear2 = 'Skulker\'s Earring',
--         Body = { Name = 'Plunderer\'s Vest +3', AugTrial=5477 },
--         Hands = { Name = 'Adhemar Wrist. +1', AugPath='B' },
--         Ring1 = 'Gere Ring',
--         Ring2 = 'Epona\'s Ring',
--         Back = { Name = 'Toutatis\'s Cape', Augment = { [1] = 'Damage taken-5%', [2] = 'Accuracy+30', [3] = 'Attack+20', [4] = '"Store TP"+10', [5] = 'DEX+20' } },
--         Waist = { Name = 'Sailfi Belt +1', AugPath='A' },
--         Legs = 'Samnuha Tights',
--         Feet = { Name = 'Herculean Boots', Augment = { [1] = 'Accuracy+20', [2] = 'Attack+6', [3] = 'AGI+1', [4] = '"Triple Atk."+3' } },
    },
    Tp_Hybrid_Priority = {
--         Head = 'Malignance Chapeau',
--         Body = 'Gleti\'s Cuirass',
--         Hands = 'Malignance Gloves',
--         Legs = 'Gleti\'s Breeches',
--         Feet = 'Gleti\'s Boots',
    },
    Tp_Acc_Priority = {
--         Head = 'Malignance Chapeau',
--         Neck = 'Sanctity Necklace',
--         Ear1 = 'Mache Earring +1',
--         Body = 'Gleti\'s Cuirass',
--         Hands = 'Malignance Gloves',
--         Ring1 = 'Cacoethic Ring +1',
--         Ring2 = 'Chirich Ring +1',
--         Legs = 'Gleti\'s Breeches',
--         Feet = 'Gleti\'s Boots',
    },


    Precast = {
        Head = "Yagudo Crown",
        Neck = {"Peacock Charm"},
        Body = "Adhemar Jacket",
        Hands = "Adhemar Wristbands",
        Waist = "Ninurta's Sash",
        Legs = "Adhemar Kecks",
--         Head = 'Haruspex Hat',
--         Neck = 'Baetyl Pendant',
--         Ear2 = 'Etiolation Earring',
--         Body = 'Taeon Tabard',
--         Hands = 'Leyline Gloves',
--         Ring1 = 'Prolix Ring',
--         Legs = 'Enif Cosciales',
    },

    Preshot_Priority = {
        Head = {"Adhemar Bonnet"},
        Ring1 = {"Prouesse Ring", "Archer's Ring"},
        Ring2 = {"Archer's Ring"},
    },
    Midshot = {
--         Head = 'Malignance Chapeau',
--         Neck = 'Iskur Gorget',
--         Ear1 = 'Telos Earring',
--         Ear2 = 'Crep. Earring',
--         Body = 'Mummu Jacket +2',
--         Hands = 'Plun. Armlets +3',
--         Ring2 = 'Dingir Ring',
--         Waist = 'Eschan Stone',
    },

    Ws_Default_Priority = {
        Head = "Adhemar Bonnet",
        Neck = "Fotia Gorget",
        --        Ear1 = "Suppanomimi",
        Ear2 = "Outlaw's Earring",

        Body = "Adhemar Jacket",
        Hands = "Adhemar Wristbands",
        Ring1 = "Rajas Ring",
        Ring2 = "Zilant Ring",


        Back = "Assassin's Cape",
        Waist = "Warwolf Belt",
        Legs = "Adhemar Kecks",
        Feet = "Adhemar Gamashes",

--         Head = { Name = 'Adhemar Bonnet +1', AugPath='B' },
--         Neck = 'Fotia Gorget',
--         Ear1 = 'Odr Earring',
--         Ear2 = 'Mache Earring +1',
--         Body = { Name = 'Plunderer\'s Vest +3', AugTrial=5477 },
--         Hands = 'Meg. Gloves +2',
--         Ring1 = 'Beithir Ring',
--         Ring2 = 'Karieyh Ring +1',
--         Back = { Name = 'Toutatis\'s Cape', Augment = { [1] = 'Accuracy+20', [2] = 'Weapon skill damage +10%', [3] = 'Attack+20', [4] = 'DEX+20' } },
--         Waist = 'Fotia Belt',
--         Legs = 'Gleti\'s Breeches',
--         Feet = { Name = 'Herculean Boots', Augment = { [1] = 'Accuracy+30', [2] = 'Weapon skill damage +8%', [3] = 'Attack+6', [4] = 'Mag. Acc.+2' } },
    },
    Ws_Default_SA = {
    },
    Ws_Default_TA = {
    },
    Ws_Default_SATA = {
    },
    Ws_Hybrid_Priority = {
--         Head = 'Nyame Helm',
--         Body = 'Gleti\'s Cuirass',
--         Legs = 'Gleti\'s Breeches',
--         Feet = 'Gleti\'s Boots',
    },
    Ws_Hybrid_SA = {},
    Ws_Hybrid_TA = {},
    Ws_Hybrid_SATA = {},
    Ws_Acc = {
    },
    Ws_Acc_SA = {},
    Ws_Acc_TA = {},
    Ws_Acc_SATA = {},

    Evis_Default = {
        Waist = "Ryl.Kgt. Belt",
        Feet = "Leaping Boots",

--         Head = { Name = 'Adhemar Bonnet +1', AugPath='B' },
--         Neck = 'Fotia Gorget',
--         Ear1 = 'Odr Earring',
--         Ear2 = 'Mache Earring +1',
--         Body = { Name = 'Plunderer\'s Vest +3', AugTrial=5477 },
--         Hands = 'Meg. Gloves +2',
--         Ring1 = 'Beithir Ring',
--         Ring2 = 'Karieyh Ring +1',
--         Back = { Name = 'Toutatis\'s Cape', Augment = { [1] = 'Accuracy+20', [2] = 'Weapon skill damage +10%', [3] = 'Attack+20', [4] = 'DEX+20' } },
--         Waist = 'Fotia Belt',
--         Legs = 'Gleti\'s Breeches',
--         Feet = { Name = 'Herculean Boots', Augment = { [1] = 'Accuracy+30', [2] = 'Weapon skill damage +8%', [3] = 'Attack+6', [4] = 'Mag. Acc.+2' } },
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


    SATA = {
        
    },
    SA = {
        
    },
    TA = {
    
    },
    TH = {
--         Hands = 'Plun. Armlets +3',
--         Feet = { Name = 'Herculean Boots', Augment = { [1] = 'Potency of "Cure" effect received+5%', [2] = 'Mag. Acc.+19', [3] = 'Accuracy+21', [4] = '"Mag. Atk. Bns."+19', [5] = '"Treasure Hunter"+2' } },
    },
    Flee = {
        Feet = "Rogue's Poulaines",
--         Feet = 'Pill. Poulaines +2',
    },
    Hide = {
        Body = "Rogue's Vest",
    },
    Steal = {
        Head = "Rogue's Bonnet",-- +1steal",
        Hands = "Rogue's Armlets",
        Ring2 = "Rogue's Ring",-- +3steal
        Legs = "Assassin's Culottes",-- +5steal
        Feet = "Rogue's Poulaines",-- +2steal
    },
    Mug = {
        Head = "Asn. Bonnet +1",-- +1mug
        Ear1 = "Bandit's Earring",
    },
    Movement = {
--         Feet = 'Pill. Poulaines +2',
	},
};
profile.Sets = sets;

profile.Packer = {
--     'Odious Blood',
--     'Odious Pen',
--     'Odious Skull',
--     'Odious Horn',
--     {Name = 'Forgotten Hope', Quantity = 'all'},
--     {Name = 'Frgtn. Thought', Quantity = 'all'},
--     'Shrouded Bijou',
--     {Name = 'T. Whiteshell', Quantity = 'all'},
--     {Name = 'O. Bronzepiece', Quantity = 'all'},
--     {Name = '1 Byne Bill', Quantity = 'all'},
};

profile.OnLoad = function()
	gSettings.AllowAddSet = true;
    gcinclude.Initialize();

    --[[ Set you job macro defaults here]]
    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 6");
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1");
    AshitaCore:GetChatManager():QueueCommand(1, "/equipset 009");
end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
    gcinclude.HandleCommands(args);
end

profile.HandleDefault = function()
-- handle levelsync
local player = gData.GetPlayer()

local myLevel = player.MainJobSync;
if (myLevel ~= Settings.CurrentLevel) then
    gFunc.EvaluateLevels(profile.Sets, myLevel);
Settings.CurrentLevel = myLevel;
gcinclude.settings.CurrentLevel = myLevel; -- set CurrentLevel in gcinclude
end

    gFunc.EquipSet(sets.Idle);
    local sa = gData.GetBuffCount('Sneak Attack');
    local ta = gData.GetBuffCount('Trick Attack');
	
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
			gFunc.EquipSet('Tp_' .. gcdisplay.GetCycle('MeleeSet')) end
        if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH) end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    elseif (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
    end
	
    if (sa == 1) and (ta == 1) then
        gFunc.EquipSet('SATA');
    elseif (sa == 1) then
        gFunc.EquipSet('SA');
    elseif (ta == 1) then
        gFunc.EquipSet('TA');
    end
    
    gcinclude.CheckDefault ();
    if (gcdisplay.GetToggle('DTset') == true) then gFunc.EquipSet(sets.Dt) end;
    if (gcdisplay.GetToggle('Kite') == true) then gFunc.EquipSet(sets.Movement) end;
end

profile.HandleAbility = function()
    local ability = gData.GetAction();
	if string.match(ability.Name, "Flee") then gFunc.EquipSet(sets.Flee) end;
    if string.match(ability.Name, "Steal") then gFunc.EquipSet(sets.Steal) end;
    if string.match(ability.Name, "Mug") then gFunc.EquipSet(sets.Mug) end;
    if string.match(ability.Name, "Hide") then gFunc.EquipSet(sets.Hide) end;

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
    else
        local ws = gData.GetAction();
        local sa = gData.GetBuffCount('Sneak Attack');
        local ta = gData.GetBuffCount('Trick Attack');
    
        gFunc.EquipSet(sets.Ws_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet')) end
        if (sa == 1) and (ta == 1) then
            gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet') .. '_SATA');
        elseif (sa == 1) then
            gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet') .. '_SA');
        elseif (ta == 1) then
            gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet') .. '_TA');
        end

        if string.match(ws.Name, 'Evisceration') then
            gFunc.EquipSet(sets.Evis_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Evis_' .. gcdisplay.GetCycle('MeleeSet')); end
            if (sa == 1) and (ta == 1) then
                gFunc.EquipSet('Evis_' .. gcdisplay.GetCycle('MeleeSet') .. '_SATA');
            elseif (sa == 1) then
                gFunc.EquipSet('Evis_' .. gcdisplay.GetCycle('MeleeSet') .. '_SA');
            elseif (ta == 1) then
                gFunc.EquipSet('Evis_' .. gcdisplay.GetCycle('MeleeSet') .. '_TA');
            end
        end
    end
end

return profile;
