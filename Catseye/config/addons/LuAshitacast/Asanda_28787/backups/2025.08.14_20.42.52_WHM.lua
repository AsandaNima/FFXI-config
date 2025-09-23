local profile = {};
gcdisplay = gFunc.LoadFile("common\\gcdisplay.lua");
gcinclude = gFunc.LoadFile("common\\gcinclude.lua");

local Settings = {
    CurrentLevel = 0,
}

local sets = {
    Idle = {
--        Main = "Yew Wand +1",
--        Sub = "Genmei Shield",
--        Ammo = "Staunch Tathlum",
--        Head = "Brass Hairpin",
--        Neck = "Promise Badge",
--        Ear1 = "Eabani Earring",
--        Ear2 = "Etiolation Earring",
--        Body = "Seer's Tunic",
--        Hands = "Savage Gauntlets",
--        Ring1 = "Stikini Ring +1",
--        Ring2 = { Name = "Metamor. Ring +1", AugPath="A" },
--        Waist = "Friar's rope",
--        Legs = "Savage Loincloth",
--        Feet = "Seer's pumps",
    },
    Resting = {
		Main = "Pilgrim's Wand",
		Body = "Seer's Tunic",
		Legs = "Baron's Slops",
	},
    Idle_Regen = {},
    Idle_Refresh = {},
    Town = {
        Body = "Federation Aketon",
    },
	
    Dt = {},

    Tp_Default = {},
    Tp_Hybrid = {},
    Tp_Acc = {},


    Precast = {--fast cast prio
    },
    Cure_Precast = {--fast cast for cure only
    },
    Enhancing_Precast = {--fast cast for enhancing
    },
    Stoneskin_Precast = {--stoneskin specific
    },


    Cure = {-- MND and cure extra
        Main = "Yew Wand +1",-- +4MND
        Neck = "Promise Badge",-- +3mnd
        Hands = "Savage gauntlets",-- +2mnd
        Ring1 = "Saintly Ring",-- +2mnd
        Ring2 = "Saintly Ring",-- +2mnd
        Waist = "Friar's rope",-- +1mnd
        Legs = "Savage Loincloth",-- +1mnd
        Feet = "Seer's Pumps",-- +1mnd
    },
    Self_Cure = {
    },
    Regen = {
    },
    Cursna = {
    },

    Enhancing = {
        Main = "Yew Wand +1",-- +4MND
        Neck = "Promise Badge",-- +3mnd
        Hands = "Savage gauntlets",-- +2mnd
        Ring1 = "Saintly Ring",-- +2mnd
        Ring2 = "Saintly Ring",-- +2mnd
        Waist = "Friar's rope",-- +1mnd
        Legs = "Savage Loincloth",-- +1mnd
        Feet = "Seer's Pumps",-- +1mnd
    },
    Self_Enhancing = {},
    Skill_Enhancing = {},
    Stoneskin = {
        Main = "Yew Wand +1",-- +4MND
        Neck = "Promise Badge",-- +3mnd
        Hands = "Savage gauntlets",-- +2mnd
        Ring1 = "Saintly Ring",-- +2mnd
        Ring2 = "Saintly Ring",-- +2mnd
        Waist = "Friar's rope",-- +1mnd
        Legs = "Savage Loincloth",-- +1mnd
        Feet = "Seer's Pumps",-- +1mnd
    },
    Phalanx = {},
    Refresh = {
    },
    Self_Refresh = {},

    Enfeebling = {
        Main = "Yew Wand +1",-- +4MND
        Neck = "Promise Badge",-- +3mnd
        Hands = "Savage gauntlets",-- +2mnd
        Ring1 = "Saintly Ring",-- +2mnd
        Ring2 = "Saintly Ring",-- +2mnd
        Waist = "Friar's rope",-- +1mnd
        Legs = "Savage Loincloth",-- +1mnd
        Feet = "Seer's Pumps",-- +1mnd
    },

    Drain = {
    },

    Divine = {
        Main = "Yew Wand +1",-- +4MND
        Head = "Traveler's hat",
        Neck = "Promise Badge",-- +3mnd
        Body = "Baron's Saio",-- +1mnnd
        Hands = "Savage gauntlets",-- +2mnd
        Ring1 = "Saintly Ring",-- +2mnd
        Ring2 = "Saintly Ring",-- +2mnd
        Waist = "Friar's rope",-- +1mnd
        Legs = "Savage Loincloth",-- +1mnd
        Feet = "Seer's Pumps",-- +1mnd
    },
    Nuke = {
    },
    NukeACC = {
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

};
profile.Sets = sets;

profile.Packer = {
    
};

profile.OnLoad = function()
	gSettings.AllowAddSet = true;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 6");
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1");
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
end

profile.HandleMidcast = function()
    local player = gData.GetPlayer();
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
