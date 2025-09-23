local profile = {};
gcdisplay = gFunc.LoadFile("common\\gcdisplay.lua");
gcinclude = gFunc.LoadFile("common\\gcinclude.lua");

local Settings = {
    CurrentLevel = 0,
}

local sets = {
    Idle = {
        Main = "Earth Staff",
--        Main = "Yew Wand +1",
--        Sub = "Genmei Shield",
--        Ammo = "Staunch Tathlum",
--        Head = "Brass Hairpin",
--        Neck = "Justice Badge",
        Ear1 = {"Pigeon Earring"},
        Ear2 = {"Pigeon Earring"},
--        Body = "Seer's Tunic",
--        Hands = "Savage Gauntlets",
--        Ring1 = "Stikini Ring +1",
--        Ring2 = { Name = "Metamor. Ring +1", AugPath="A" },
--        Waist = "Friar's rope",
--        Legs = "Savage Loincloth",
--        Feet = "Seer's pumps",
    },
    Resting = {
        Main = {"Iridal Staff", "Pilgrim's Wand"},
		Body = "Seer's Tunic",
		Legs = "Baron's Slops",
	},
    Idle_Regen = {
        Head = "Garrison Sallet +1",
    },
    Idle_Refresh = {
        Body = "Garrison Tunica +1",
    },
    Town = {
    },
	
    Dt = {},

    Tp_Default_Priority = {
        Head = {"Cmp. Eye Circlet"},
        Neck = {"Pile Chain"},
        Ear1 = {"Pigeon Earring","Optical Earring"},
        Ear2 = {"Pigeon Earring"},

        Body = {"Robe", "Mithran Separates"},
        Hands = {"Linen Cuffs", "Gloves", "Mithran Gauntlets"},
        Ring1 = {"Bastokan Ring"},
        Ring2 = {"San d'Orian Ring"},

        Back = {"Mist Silk Cape"},
        Legs = {"Mithran Loincloth"},
        Feet = {"Mithran Gaiters"},
    },
    Tp_Hybrid_Priority = {},
    Tp_Acc_Priority = {},


    Precast_Priority = {--fast cast prio
        Head = {"Entrancing Ribbon"},
        Legs = {"Garrison Hose +1"},
    },
    Cure_Precast_Priority = {--fast cast for cure only

    },
    Enhancing_Precast = {--fast cast for enhancing

    },
    Stoneskin_Precast = {--stoneskin specific

    },


    Cure_Priority = {-- MND and cure extra
        Main = {"Iridal Staff"},
        Head = {"Seer's Crown", "Garrison Sallet +1"},
        Neck = {"Justice Badge"},

        Body = {"Seer's Tunic"},
        Hands = {"Savage gauntlets"},
        Ring1 = {"Saintly Ring"},
        Ring2 = {"Saintly Ring"},

        Waist = {"Friar's rope"},
        Legs = {"Savage Loincloth"},
        Feet = {"Seer's Pumps"},
    },
    Self_Cure_Priority = {
    },
    Regen = {
    },
    Cursna = {
    },

    Enhancing_Priority = {
        Head = {"Seer's Crown", "Garrison Sallet +1"},
        Neck = {"Justice Badge"},

        Body = {"Seer's Tunic"},
        Hands = {"Savage gauntlets"},
        Ring1 = {"Saintly Ring"},
        Ring2 = {"Saintly Ring"},

        Waist = {"Friar's rope"},
        Legs = {"Savage Loincloth"},
        Feet = {"Seer's Pumps"},
    },
    Self_Enhancing = {
    },
    Skill_Enhancing = {
    },
    Stoneskin = {
        Head = {"Seer's Crown", "Garrison Sallet +1"},
        Neck = {"Justice Badge"},

        Body = {"Seer's Tunic"},
        Hands = {"Savage gauntlets"},
        Ring1 = {"Saintly Ring"},
        Ring2 = {"Saintly Ring"},

        Waist = {"Friar's rope"},
        Legs = {"Savage Loincloth"},
        Feet = {"Seer's Pumps"},
    },
    Phalanx = {},
    Refresh = {
    },
    Self_Refresh = {},

    Enfeebling_Priority = {
        Main = {"Iridal Staff"},
        Head = {"Seer's Crown", "Garrison Sallet +1"},
        Neck = {"Justice Badge"},

        Body = {"Seer's Tunic"},
        Hands = {"Savage gauntlets"},
        Ring1 = {"Saintly Ring"},
        Ring2 = {"Saintly Ring"},

        Waist = {"Friar's rope"},
        Legs = {"Savage Loincloth"},
        Feet = {"Seer's Pumps"},
    },

    Drain = {
        Main = {"Iridal Staff"},
    },

    Divine_Priority = {
        Main = {"Iridal Staff"},
        Head = {"Seer's Crown", "Garrison Sallet +1"},
        Neck = {"Justice Badge"},

        Body = {"Seer's Tunic"},
        Hands = {"Savage gauntlets"},
        Ring1 = {"Saintly Ring"},
        Ring2 = {"Saintly Ring"},

        Waist = {"Friar's rope"},
        Legs = {"Savage Loincloth"},
        Feet = {"Seer's Pumps"},
    },
    Nuke = {
        Main = {"Iridal Staff"},
    },
    NukeACC = {
        Main = {"Iridal Staff"},
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
    Cataclysm_Default = {
    },
    Cataclysm_Hybrid = {
    },
    Cataclysm_Acc = {
    },

    TH = {},
    Movement = {
	},
    Sneak = {
		Feet = "Dream Boots +1",
	},
	Invisible = {
		Hands = "Dream Mittens +1",
	},
    ['upgrade'] = {
        Main = { Name = 'Pilgrim\'s Wand', Augment = { [1] = '"Conserve MP"+2', [2] = 'MP+5', [3] = 'MP recovered while healing +1' } },
        Sub = { Name = 'Pelte', Augment = { [1] = 'MP recovered while healing +2', [2] = 'MND+1', [3] = 'INT+1' } },
        Head = { Name = 'Entrancing Ribbon', Augment = { [1] = 'Pet: Rng. Acc.+2', [2] = '"Fast Cast"+1', [3] = 'Pet: Accuracy+2' } },
        Neck = 'Justice Badge',
        Ear1 = { Name = 'Optical Earring', Augment = { [1] = 'DEX+1', [2] = 'HP+2' } },
        Body = { Name = 'Robe', Augment = { [1] = 'MP+3', [2] = 'HP+3' } },
        Hands = { Name = 'Linen Cuffs', Augment = 'MP+10' },
        Ring1 = 'Bastokan Ring',
        Ring2 = 'San d\'Orian Ring',
        Back = { Name = 'Mist Silk Cape', Augment = { [1] = '"Cure" spellcasting time -1%', [2] = '"Cure" potency +1%' } },
        Legs = 'Mithran Loincloth',
        Feet = 'Mithran Gaiters',
    },

};
profile.Sets = sets;

profile.Packer = {
    
};

profile.OnLoad = function()
	gSettings.AllowAddSet = true;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 9");
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1");
end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
    gcinclude.HandleCommands(args);
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
-- handle levelsync
local player = gData.GetPlayer()
local myLevel = player.MainJobSync;

if (myLevel ~= Settings.CurrentLevel) then
    gFunc.EvaluateLevels(profile.Sets, myLevel);
Settings.CurrentLevel = myLevel;
end

    local spell = gData.GetAction();

    gFunc.EquipSet(sets.Precast);
--     print(chat.header('GCinclude'):append(chat.message("Testing Precast Level: " .. myLevel)));
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
-- handle levelsync
local player = gData.GetPlayer()
local myLevel = player.MainJobSync;

if (myLevel ~= Settings.CurrentLevel) then
    gFunc.EvaluateLevels(profile.Sets, myLevel);
Settings.CurrentLevel = myLevel;
end

    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0);

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
        elseif string.contains(spell.Name, "Refresh") then
            gFunc.EquipSet(sets.Refresh);
            if (target.Name == me) then
                gFunc.EquipSet(sets.Self_Refresh);
            end
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

        if (gcdisplay.GetCycle("NukeSet") == "Macc") then
            gFunc.EquipSet(sets.NukeACC);
        end
        if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
            gFunc.Equip("Waist", "Hachirin-no-Obi");
        end
    elseif (spell.Skill == "Enfeebling Magic") then
        gFunc.EquipSet(sets.Enfeebling);
    elseif (spell.Skill == "Dark Magic") then
        gFunc.EquipSet(sets.Enfeebling); -- mostly macc anyways
        if (string.contains(spell.Name, "Aspir") or string.contains(spell.Name, "Drain")) then
            gFunc.EquipSet(sets.Drain);
    elseif (spell.Skill == "Dark Magic") then
        end
    
    elseif (spell.Skill == "Divine Magic") then
        gFunc.EquipSet(sets.Divine);
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
        end
    end
end

return profile;
