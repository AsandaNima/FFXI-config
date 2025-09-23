local profile = {};
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

local Settings = {
    CurrentLevel = 0,
}

local sets = {
    Idle = {
--         Ammo = 'Yamarang',
--         Head = 'Malignance Chapeau',
--         Neck = 'Loricate Torque +1',
        Ear1 = {"Pigeon Earring"},
        Ear2 = {"Pigeon Earring"},
--         Body = 'Gleti\'s Cuirass',
--         Hands = 'Malignance Gloves',
--         Ring1 = 'Defending Ring',
--         Ring2 = 'Karieyh Ring +1',
--         Back = 'Solemnity Cape',
--         Waist = 'Gishdubar Sash',
--         Legs = 'Gleti\'s Breeches',
--         Feet = 'Gleti\'s Boots',
    },
    Resting = {},
    Idle_Regen = {
        Head = "Garrison Sallet +1",
--         Neck = 'Bathy Choker +1',
--         Ear1 = 'Infused Earring',
--         Ring2 = 'Chirich Ring +1',
--         Feet = 'Turms Leggings',
    },
    Idle_Refresh = {},
    Town = {
--         Main = 'Tauret',
--         Sub = 'Acrontica',
--         Ammo = 'Yamarang',
--         Head = 'Maculele Tiara +1',
--         Body = 'Macu. Casaque +1',
--         Hands = 'Malignance Gloves',
--         Legs = 'Gleti\'s Breeches',
--         Feet = 'Gleti\'s Boots',
    },

    Dt = {
--         Ammo = 'Staunch Tathlum',
--         Head = 'Nyame Helm',
--         Neck = { Name = 'Loricate Torque +1', AugPath='A' },
--         Ear1 = { Name = 'Odnowa Earring +1', AugPath='A' },
--         Ear2 = 'Etiolation Earring',
--         Body = 'Nyame Mail',
--         Hands = 'Nyame Gauntlets',
--         Ring1 = 'Defending Ring',
--         Ring2 = { Name = 'Gelatinous Ring +1', AugPath='A' },
--         Back = 'Solemnity Cape',
--         Waist = 'Flume Belt +1',
--         Legs = 'Nyame Flanchard',
--         Feet = 'Nyame Sollerets',
    },

    Tp_Default_Priority = {
        Head = {"Yagudo Crown", "Empress Hairpin","Garrison Sallet +1","Cmp. Eye Cerclet"},
        Neck = {"Peacock Charm", "Pile Chain"},
        Ear1 = {"Pigeon Earring", "Optical Earring"},
        Ear2 = {"Outlaw's Earring", "Pigeon Earring"},

        Body = {"Raptor Jerkin", "Garrison Tunica +1", "Leather Vest", "Mithran Separates"},
        Hands = {"Battle Gloves", "Mithran Gauntlets"},
        Ring1 = {"Rajas Ring", "Archer's Ring", "Bastokan Ring"},
        Ring2 = {"Ulthalam's Ring", "Archer's Ring","San d'Orian Ring"},


        Back = {"Exile's Cloak", "Ram Mantle", "Traveler's Mantle"},
        Waist = {"Virtuoso Belt", "Tilt Belt", "Lizard Belt", "Leather Belt"},
        Legs = {"Raptor Trousers", "Garrison Hose +1","Mithran Loincloth"},
        Feet = {"Leaping boots", "Mithran Gaiters"},

--         Ammo = { Name = 'Coiste Bodhar', AugPath='A' },
--         Head = { Name = 'Adhemar Bonnet +1', AugPath='B' },
--         Neck = 'Anu Torque',
--         Ear1 = 'Sherida Earring',
--         Ear2 = 'Eabani Earring',
--         Body = 'Gleti\'s Cuirass',
--         Hands = 'Adhemar Wrist. +1',
--         Ring1 = 'Gere Ring',
--         Ring2 = 'Epona\'s Ring',
--         Back = 'Senuna\'s Mantle',
--         Waist = { Name = 'Sailfi Belt +1', AugPath='A' },
--         Legs = 'Samnuha Tights',
--         Feet = { Name = 'Herculean Boots', Augment = { [1] = 'Accuracy+20', [2] = 'Attack+6', [3] = 'AGI+1', [4] = '"Triple Atk."+3' } },
    },
    Tp_Hybrid_Priority = {
--         Head = 'Malignance Chapeau',
--         Neck = 'Sanctity Necklace',
--         Body = 'Malignance Tabard',
--         Hands = 'Malignance Gloves',
--         Legs = 'Gleti\'s Breeches',
--         Feet = 'Gleti\'s Boots',
    },
    Tp_Acc_Priority = {
        Neck = "Spike Necklace",
        Ring1 = {"Archer's Ring"},
        Ring2 = {"Archer's Ring"},

--         Ammo = 'Yamarang',
--         Head = 'Malignance Chapeau',
--         Neck = 'Sanctity Necklace',
--         Ear1 = 'Mache Earring +1',
--         Ear2 = 'Telos Earring',
--         Body = 'Malignance Tabard',
--         Hands = 'Malignance Gloves',
--         Ring1 = 'Cacoethic Ring +1',
--         Ring2 = 'Chirich Ring +1',
--         Legs = 'Gleti\'s Breeches',
--         Feet = 'Gleti\'s Boots',
    },


    Precast = {
--         Ammo = 'Staunch Tathlum',
--         Neck = 'Baetyl Pendant',
--         Ear1 = 'Loquac. Earring',
--         Ear2 = 'Etiolation Earring',
--         Hands = 'Leyline Gloves',
--         Ring2 = 'Prolix Ring',
    },

    Preshot = {
    },
    Midshot = {
--         Ear1 = 'Telos Earring',
--         Ear2 = 'Crep. Earring',
    },

    Ws_Default_Priority = {
--         Ammo = 'Voluspa Tathlum',
--         Head = { Name = 'Adhemar Bonnet +1', AugPath='B' },
        Neck = {"Fotia Gorget", "Spike Necklace"},
--         Ear1 = 'Sherida Earring',
--         Ear2 = 'Mache Earring +1',
--         Body = 'Nyame Mail',
--         Hands = 'Meg. Gloves +2',
--         Ring1 = 'Beithir Ring',
--         Ring2 = 'Karieyh Ring +1',
--         Waist = 'Fotia Belt',
--         Legs = 'Nyame Flanchard',
--         Feet = { Name = 'Herculean Boots', Augment = { [1] = 'Accuracy+30', [2] = 'Weapon skill damage +8%', [3] = 'Attack+6', [4] = 'Mag. Acc.+2' } },
    },
    Ws_Hybrid = {
    },
    Ws_Acc = {
    },

    Evis_Default_Priority = {
--         Head = 'Adhemar Bonnet +1',
--         Neck = 'Fotia Gorget',
--         Ear1 = 'Sherida Earring',
--         Ear2 = 'Odr Earring',
--         Body = 'Meg. Cuirie +2',
--         Hands = 'Mummu Wrists +2',
--         Ring1 = 'Gere Ring',
--         Ring2 = 'Ilabrat Ring',
--         Waist = 'Fotia Belt',
--         Legs = 'Mummu Kecks +2',
--         Feet = 'Gleti\'s Boots',
    },
    Evis_Hybrid = {
    },
    Evis_Acc = {

    },

    Rudra_Default_Priority = {
--         Head = 'Blistering Sallet +1',
--         Neck = 'Sanctity Necklace',
--         Body = 'Meg. Cuirie +2',
--         Hands = 'Meg. Gloves +2',
--         Ring1 = 'Beithir Ring',
--         Ring2 = 'Karieyh Ring +1',
--         Waist = 'Sailfi Belt +1',
--         Legs = 'Mummu Kecks +2',
--         Feet = { Name = 'Herculean Boots', Augment = { [1] = 'Accuracy+30', [2] = 'Weapon skill damage +8%', [3] = 'Attack+6', [4] = 'Mag. Acc.+2' } },
    },
    Rudra_Hybrid = {
    },
    Rudra_Acc = {

    },

    Pyrrhic_Default = {
--         Ammo = 'Coiste Bodhar',
--         Head = 'Adhemar Bonnet +1',
--         Neck = 'Fotia Gorget',
--         Body = 'Herculean Vest',
--         Hands = 'Adhemar Wrist. +1',
--         Ring1 = 'Gere Ring',
--         Ring2 = 'Epona\'s Ring',
--         Waist = 'Fotia Belt',
--         Legs = 'Samnuha Tights',
--         Feet = { Name = 'Herculean Boots', Augment = { [1] = 'Accuracy+20', [2] = 'Attack+6', [3] = 'AGI+1', [4] = '"Triple Atk."+3' } },
    },
    Pyrrhic_Hybrid = {
    },
    Pyrrhic_Acc = {

    },

    Aedge_Default_Priority = {
--         Ammo = 'Pemphredo Tathlum',
--         Head = 'Nyame Helm',
--         Neck = 'Baetyl Pendant',
--         Ear1 = 'Friomisi Earring',
--         Ear2 = 'Crematio Earring',
--         Body = 'Nyame Mail',
--         Hands = 'Nyame Gauntlets',
--         Ring1 = 'Shiva Ring +1',
--         Ring2 = 'Karieyh Ring +1',
--         Waist = 'Eschan Stone',
--         Legs = 'Nyame Flanchard',
--         Feet = 'Nyame Sollerets',
    },
    Aedge_Hybrid = {},
    Aedge_Acc = {},

    Waltz_Priority = {
        Head = {"Dancer's Tiara", "Garrison Sallet +1"},
        Body = {"Dancer's Casaque", "Raptor Jerkin", "Garrison Tunica +1" },
        Legs = {"Dancer's Tights"},
        Feet = {"Savage Gaiters"},

--         Ammo = 'Yamarang',
    },

    Climactic = {-- on JA and while buff is active
--         Head = 'Maculele Tiara +1',
    },
    Samba = {-- on JA and while buff is active
        Head = "Dancer's Tiara",
    },
    Jig = {-- on JA and while buff is active
        Feet = "Dancer's Toe Shoes",
    },
    Step_Priority = {-- on JA and while buff is active
        Hands = "Dancer's Bangles",
    },
    Striking = {-- on JA and while buff is active
--         Body = 'Macu. Casaque +1',
    },

    Movement = {
--         Feet = 'Herald\'s Gaiters',
    },
};
profile.Sets = sets;

profile.Packer = {
    --{Name = 'Chonofuda', Quantity = 'all'},
};

profile.OnLoad = function()
gSettings.AllowAddSet = true;
gcinclude.Initialize();

AshitaCore:GetChatManager():QueueCommand(1, '/macro book 4');
AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
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
end

gFunc.EquipSet(sets.Idle);

local climactic = gData.GetBuffCount('Climactic Flourish');

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
    if climactic > 0 then gFunc.EquipSet(sets.Climactic); end
        if (gcdisplay.GetToggle('DTset') == true) then gFunc.EquipSet(sets.Dt) end;
        if (gcdisplay.GetToggle('Kite') == true) then gFunc.EquipSet(sets.Movement) end;
end

profile.HandleAbility = function()
-- handle levelsync
local player = gData.GetPlayer()

local myLevel = player.MainJobSync;
if (myLevel ~= Settings.CurrentLevel) then
    gFunc.EvaluateLevels(profile.Sets, myLevel);
Settings.CurrentLevel = myLevel;
end

local ability = gData.GetAction();

    if string.match(ability.Name, 'Provoke') then gFunc.EquipSet(sets.Enmity);
    elseif string.contains(ability.Name, 'Climactic') then gFunc.EquipSet(sets.Climactic);
    elseif string.contains(ability.Name, 'Samba') then gFunc.EquipSet(sets.Samba);
    elseif string.contains(ability.Name, 'Jig') then gFunc.EquipSet(sets.Jig);
    elseif string.contains(ability.Name, 'Step') then gFunc.EquipSet(sets.Step);
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
    local climactic = gData.GetBuffCount('Climactic Flourish');
    local striking = gData.GetBuffCount('Striking Flourish');

    gFunc.EquipSet(sets.Ws_Default)
    if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet')) end

        if string.match(ws.Name, 'Aeolian Edge') then
            gFunc.EquipSet(sets.Aedge_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
                gFunc.EquipSet('Aedge_' .. gcdisplay.GetCycle('MeleeSet')); end
                elseif string.match(ws.Name, 'Evisceration') then
                    gFunc.EquipSet(sets.Evis_Default)
                    if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
                        gFunc.EquipSet('Evis_' .. gcdisplay.GetCycle('MeleeSet')); end
                        if striking > 0 then gFunc.EquipSet(sets.Striking); end
                            elseif string.match(ws.Name, 'Rudra\'s Storm') then
                                gFunc.EquipSet(sets.Rudra_Default)
                                if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
                                    gFunc.EquipSet('Rudra_' .. gcdisplay.GetCycle('MeleeSet')); end
                                    if climactic > 0 then gFunc.EquipSet(sets.Climactic); end
                                        elseif string.match(ws.Name, 'Pyrrhic Kleos') then
                                            gFunc.EquipSet(sets.Pyrrhic_Default)
                                            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
                                                gFunc.EquipSet('Pyrrhic_' .. gcdisplay.GetCycle('MeleeSet')); end
                                                if striking > 0 then gFunc.EquipSet(sets.Striking); end
                                                    end
                                                    end
                                                    end

                                                    return profile;
