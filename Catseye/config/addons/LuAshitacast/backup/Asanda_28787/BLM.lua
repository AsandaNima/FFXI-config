local profile = {};
gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

local Settings = {
    CurrentLevel = 0,
}

local sets = {
    Idle = {},
    Idle_Staff = {},
    Resting_Priority = {
		Main = { 'Dark Staff', 'Pilgrim\'s Wand' },
		Body = {'Errant Hpl.', 'Black Cloak', 'Seer\'s Tunic'},
		Legs = 'Baron\'s Slops',
	},
    Idle_Regen = {},
    Idle_Refresh = {
        Body = 'Black Cloak',
    },
    Town = {
        Body = 'Republic Aketon',
    },
	
    Dt = {},

    Tp_Default = {},
    Tp_Hybrid = {},
    Tp_Acc = {},


    Precast = {
        Waist = 'Swift Belt',-- +3acc +4haste
        Feet = 'Rostrum Pumps',
        --Feet = 'Wizard\'s Sabots',
    },
    LowHP = {
        Ring1 = 'Astral Ring',
        Ring2 = 'Astral Ring',
    },
    Cure_Precast = {},
    Enhancing_Precast = {},
    Stoneskin_Precast = {},


    Cure = {},
    Self_Cure = {},
    Regen = {},
    Cursna = {},

    Enhancing = {
        Neck = 'Enhancing Torque',
    },
    Self_Enhancing = {},
    Skill_Enhancing = {},
    Stoneskin = {},
    Phalanx = {},
    Refresh = {},
    Self_Refresh = {},

    Enfeebling = {
        Body = 'Wizard\'s Coat',
    },
    Macc_Priority = {},

    Drain_Priority = {
        Main = { 'Casting Wand', 'Yew Wand +1' },
        Ammo = {'Phtm. Tathlum', 'Morion Tathlum'},
        Head = {'Wizard\'s Petasos', 'Seer\'s Crown +1'},
        Neck = 'Philomath Stole',
        Ear1 = 'Cunning Earring',
        Ear2 = 'Cunning Earring',
        Body = { 'Errant Hpl.', 'Baron\'s Saio' },
        Hands = {'Sorcerer\'s Gloves' ,'Seer\'s Mitts'},
        Ring1 = {'Snow Ring', 'Eremite\'s ring'},
        Ring2 = {'Snow Ring', 'Eremite\'s ring'},
        Back = 'Red Cape',
        Waist = {'Sorcerer\'s Belt', 'Mrc.Cpt. Belt'},
        Legs = { 'Wizard\'s Tonban', 'Seer\'s Slacks' },
        Feet = {'Rostrum Pumps', 'Sorcerer\'s Sabots' ,'Wizard\'s Sabots'},
    },

    Nuke_Priority = {
        Main = { 'Casting Wand' , 'Yew Wand +1' },
        Ammo = {'Phtm. Tathlum', 'Morion Tathlum'},
        Head = {'Wizard\'s Petasos', 'Seer\'s Crown +1'},
        Neck = 'Philomath Stole',
        Ear1 = { 'Moldavite Earring', 'Cunning Earring' },
        Ear2 = 'Cunning Earring',
        Body = {'Igqira Weskit' , 'Black Cloak', 'Baron\'s Saio'},
        --Body = { 'Baron\'s Saio'},
        Hands = {'Igqira manillas' ,'Wizard\'s Gloves' ,'Seer\'s Mitts'} ,
        Ring1 = {'Snow Ring', 'Eremite\'s ring'},
        Ring2 = {'Snow Ring', 'Eremite\'s ring'},
        Back = 'Red Cape',
        Waist = {'Sorcerer\'s Belt', 'Mrc.Cpt. Belt'},
        Legs = {'Errant Slops','Seer\'s Slacks'},
        Feet = {'Rostrum Pumps', 'Sorcerer\'s Sabots' ,'Wizard\'s Sabots'},
    },
    NukeACC = {
        Neck = 'Elemental Torque',
    },
    Burst_Priority = {},
    Helix = {},
    Death = {},
    Af_Body = {},
    EmpyLegs = {},

    Preshot = {
    },
    Midshot = {},

    Ws_Default = {--myrkr mostly
        Ammo = 'Ghastly Tathlum +1',
        Head = 'Pixie Hairpin +1',
        Neck = 'Sanctity Necklace',
        Ear1 = 'Mendi. Earring',
        Ear2 = 'Etiolation Earring',
        Body = 'Ea Houppelande',
        Hands = 'Nyame Gauntlets',
        Ring1 = 'Sangoma Ring',
        Ring2 = 'Metamor. Ring +1',
        Back = 'Aurist\'s Cape +1',
        Waist = 'Shinjutsu-no-Obi +1',
        Legs = 'Wicce Chausses +2',
        Feet = 'Nyame Sollerets',
    },
    Ws_Hybrid = {
    },
    Ws_Acc = {
    },

    TH = {},
    Movement = {
        Feet = 'Herald\'s Gaiters',
	},
    Sneak = {
		Feet = 'Dream Boots +1',
	},
	Invisible = {
		Hands = 'Dream Mittens +1',
	},
};


profile.Sets = sets;

profile.Packer = {
    {Name = 'Tropical Crepe', Quantity = 'all'},
    {Name = 'Rolan. Daifuku', Quantity = 'all'},
};

profile.OnLoad = function()
	gSettings.AllowAddSet = true;
    gcinclude.Initialize();
    gFunc.ApplyBaseSets(profile.Sets);


    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 4');
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1');
end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
    gcinclude.SetCommands(args);
end

profile.HandleDefault = function()

local environment = gData.GetEnvironment()
-- handle levelsync
local player = gData.GetPlayer()
local myLevel = player.MainJobSync;

if (myLevel ~= Settings.CurrentLevel) then
    gFunc.EvaluateLevels(profile.Sets, myLevel);
Settings.CurrentLevel = myLevel;
end


    local myLevel = AshitaCore:GetMemoryManager():GetPlayer():GetMainJobLevel();
    if (myLevel ~= Settings.CurrentLevel) then
        gFunc.EvaluateLevels(profile.Sets, myLevel);
        Settings.CurrentLevel = myLevel;
    end

    if (gcdisplay.GetToggle('Death') == true) and (player.MPP > 50) then
        gFunc.EquipSet(sets.Death);
        return;
    end

    gFunc.EquipSet(sets.Idle);

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
	
    gcinclude.CheckDefault ();
    if (gcdisplay.GetCycle('Weapon') == 'Staff') then
        gFunc.EquipSet(sets.Idle_Staff);
    end
    if (gcdisplay.GetToggle('DTset') == true) then gFunc.EquipSet(sets.Dt) end;
    if (gcdisplay.GetToggle('Kite') == true) then gFunc.EquipSet(sets.Movement) end;
end

profile.HandleAbility = function()
    local ability = gData.GetAction();

    gcinclude.CheckCancels();
end

profile.HandleItem = function()
    local item = gData.GetAction();

	if string.match(item.Name, 'Holy Water') then gFunc.EquipSet(gcinclude.sets.Holy_Water) end
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();

    if (gcdisplay.GetToggle('Death') == true) then
        gFunc.EquipSet(sets.Death);
    else
        gFunc.EquipSet(sets.Precast)

        if (spell.Skill == 'Enhancing Magic') then
            gFunc.EquipSet(sets.Enhancing_Precast);

            if string.contains(spell.Name, 'Stoneskin') then
                gFunc.EquipSet(sets.Stoneskin_Precast);
            end
        elseif (spell.Skill == 'Healing Magic') then
            gFunc.EquipSet(sets.Cure_Precast);
        end

        gcinclude.CheckCancels();
        if (gcdisplay.GetCycle('Weapon') == 'Staff') then
            gFunc.EquipSet(sets.Idle_Staff);
        end
    end
end

profile.HandleMidcast = function()
    local player = gData.GetPlayer();
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);
    local mw = gData.GetBuffCount('Manawell');

    local ElementalStaffTable = {
        ['Fire'] = 'Fire Staff', -- 'Vulcan\'s Staff'
        ['Earth'] = 'Earth Staff',
        ['Water'] = 'Water Staff', -- 'Neptune\'s Staff'
        ['Wind'] = 'Wind Staff',
        ['Ice'] = 'Aquilo\'s Staff',
        ['Thunder'] = 'Thunder Staff',
        ['Light'] = 'Light Staff',
        ['Dark'] = 'Dark Staff'
    };

    local ElementalWaistTable = {
        --['Fire'] = 'Karin Obi',
        --['Earth'] = 'Dorin Obi',
        --['Water'] = 'Suirin Obi',
        --['Wind'] = 'Furin Obi',
        ['Ice'] = 'Hyorin Obi',
        --['Thunder'] = 'Rairin Obi',
        --['Light'] = 'Korin Obi',
        --['Dark'] = 'Anrin Obi'
    };


    if (gcdisplay.GetToggle('Death') == true) then
        gFunc.EquipSet(sets.Death);
--[[        if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
            gFunc.Equip('Waist', 'Hachirin-no-Obi');
        end
        ]]
    else
        if (spell.Skill == 'Enhancing Magic') then
            gFunc.EquipSet(sets.Enhancing);
            if (target.Name == me) then
                gFunc.EquipSet(sets.Self_Enhancing);
            end

            if string.match(spell.Name, 'Phalanx') then
                gFunc.EquipSet(sets.Phalanx);
            elseif string.match(spell.Name, 'Stoneskin') then
                gFunc.EquipSet(sets.Stoneskin);
            elseif string.contains(spell.Name, 'Regen') then
            gFunc.EquipSet(sets.Regen);
            elseif string.contains(spell.Name, 'Refresh') then
                gFunc.EquipSet(sets.Refresh);
                if (target.Name == me) then
                    gFunc.EquipSet(sets.Self_Refresh);
                end
            elseif string.match(spell.Name, 'Sneak') then
                gFunc.EquipSet(sets.Sneak);
            elseif string.match(spell.Name, 'Invisible') then
                gFunc.EquipSet(sets.Invisible);
            end
        elseif (spell.Skill == 'Healing Magic') then
            gFunc.EquipSet(sets.Cure);
            if (target.Name == me) then
                gFunc.EquipSet(sets.Self_Cure);
            end
            if string.match(spell.Name, 'Cursna') then
                gFunc.EquipSet(sets.Cursna);
            end
        elseif (spell.Skill == 'Elemental Magic') then
            --Set HP lower for Sorc Ring
            if (player.HPP > 74) then
                gFunc.ForceEquipSet(sets.LowHP);
            end

            gFunc.EquipSet(sets.Nuke);

            if (gcdisplay.GetCycle('NukeSet') == 'Macc') then
                gFunc.EquipSet(sets.NukeACC);
            end
            if (gcdisplay.GetToggle('Burst') == true) then
                gFunc.EquipSet(sets.Burst);
            end
            if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
                gFunc.Equip('Waist', ElementalWaistTable[spell.Element]);
            end
            if string.match(spell.Name, 'helix') then
                gFunc.EquipSet(sets.Helix);
                if (gcdisplay.GetToggle('Burst') == true) then
                    gFunc.EquipSet(sets.Burst);
                end
            end
            if (player.MPP <= 40) and (mw == 0) then
                gFunc.EquipSet(sets.Af_Body);
            end
            if string.contains(spell.Name, 'ja') then
                gFunc.EquipSet(sets.EmpyLegs);
            end
            if (spell.MppAftercast < 51) then
                gFunc.Equip('neck', 'Uggalepih Pendant');
            end
        elseif (spell.Skill == 'Enfeebling Magic') then
            gFunc.EquipSet(sets.Enfeebling);
            if (gcdisplay.GetCycle('NukeSet') == 'Macc') then
                gFunc.EquipSet(sets.Macc);
            end
        elseif (spell.Skill == 'Dark Magic') then
            gFunc.EquipSet(sets.Macc);
            if (string.contains(spell.Name, 'Aspir') or string.contains(spell.Name, 'Drain')) then
                gFunc.EquipSet(sets.Drain);
            end
        end

        if (gcdisplay.GetCycle('Weapon') == 'Staff') then
            gFunc.EquipSet(sets.Idle_Staff);
        end
    end
	--if (gcdisplay.GetToggle('TH') == true) then gFunc.EquipSet(sets.TH) end

    if (player.MainJobSync  >=  73) then
        if (spell.Element == weather.DayElement) then
            gFunc.Equip('Legs', 'Sorcerer\'s Tonban');
        end
    end

    if (player.MainJobSync  >=  51) then
    gFunc.Equip('main', ElementalStaffTable[spell.Element]) 
    end

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
    
        gFunc.EquipSet(sets.Ws_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
        gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet')) end
   
        if string.match(ws.Name, 'Chant du Cygne') then
            gFunc.EquipSet(sets.Chant_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Chant_' .. gcdisplay.GetCycle('MeleeSet')); end
	    elseif string.match(ws.Name, 'Savage Blade') then
            gFunc.EquipSet(sets.Savage_Default)
            if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
            gFunc.EquipSet('Savage_' .. gcdisplay.GetCycle('MeleeSet')); end
        end
    end
end

return profile;
