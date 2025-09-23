local profile = {};
gcdisplay = gFunc.LoadFile("common\\gcdisplay.lua");
gcinclude = gFunc.LoadFile("common\\gcinclude.lua");

local sets = {
    Idle = {
		Hands = "Seiryu's Kote",
	},
    Resting = {},
    Idle_Regen = {},
    Idle_Refresh = {},
    Town = {
        Body = "Federation Aketon",
    },

    Dt = {},

    Tp_Default = {
        Head = "Optical Hat",
		Ear1 = "Drone Earring",
		Ear2 = "Drone Earring",
        Neck = "Peacock amulet",
		Hands = "Seiryu's Kote",
		Ring1 = "Rajas Ring",
		Ring2 = "Venerer Ring",
        Body = "Hunter's jerkin",
		Waist = "Swift Belt",
		Back = "Amemet mantle",
		Legs = "Scout's Braccae",
        Feet = "Hunter's Socks",
	},
    Tp_Hybrid = {},
    Tp_Acc = {},


    Precast = {
		Hands = "Dusk Gloves", --3
		Waist = "Swift Belt", --4
	},


    Cure = {},

    Enhancing = {},

    Enfeebling = {},
    Macc = {},

    Drain = {},

    Nuke = {},

    Preshot = {--Snapshot --Rapid Shot --base preshot, no flurry, 70cap, 10 from gifts
        Head = "Hunter's Beret", ---5
		Body = "Scout's Jerkin", ---5
    },
    Preshot_FlurryI = {--Snapshot ----with flurry I on, gives 15, 10 from gifts
    },
    Preshot_FlurryII = {--Snapshot ----with flurry II on, gives 30, 10 from gifts
    },
    Midshot = {
        Head = "Scout's Beret",
		Ear1 = "Drone Earring",
		Ear2 = "Drone Earring",
        Neck = "Peacock amulet",
		Hands = "Seiryu's Kote",
        Ring1 = "Merman's Ring",
		Ring2 = "Merman's Ring",
        Body = "Hunter's jerkin",
		Waist = "Scout's Belt",
		Back = "Amemet mantle",
		Legs = "Scout's Braccae",
        Feet = "Hunter's Socks",
    },
    Barrage = {
        Hands = "Hunter's Braccae +1",
    },
    Midshot_Acc = {--will be over written by barrage set still 
    },
    DoubleShot = {
    },

    Ws_Default = {
        Head = "Hunter's Beret",
        Neck = "Ranger's Necklace",
		Ear2 = "Minuet Earring",
		Body = "Kirin Osode",
		Ring1 = "Rajas Ring",
		Ring2 = "Merman's Ring",
        Waist = "Scout's Belt",
        Feet = "Scout's Socks",
    },
    Ws_Hybrid = {
    },
    Ws_Acc = {
        Head = "Hunter's Beret",
		Ear2 = "Minuet Earring",
		Body = "Kirin Osode",
		Ring1 = "Rajas Ring",
		Ring2 = "Merman's Ring",
        Waist = "Scout's Belt",
        Feet = "Scout's Socks",
    },
    WsObi = {--puts elemental obi on for trueflight/wildfire under light/fire situations
        Waist = "Hachirin-no-Obi",
    },

    Savage_Default = {},
    Savage_Hybrid = {
    },
    Savage_Acc = {
    },
    Aedge_Default = {},
    Aedge_Hybrid = {},
    Aedge_Acc = {},
    TrueFlight_Default = {},
    TrueFlight_Hybrid = {},
    TrueFlight_Acc = {},

    Scavenge = {
        Feet = "Hunter's Socks",
    },
    Shadowbind = {
		Hands = "Hunter's Bracers",
    },
    Sharpshot = {
        Legs = "Hunter's braccae",
    },
    TH = {},
    Movement = {
        Legs = "Crimson Cuisses",
	},
};
profile.Sets = sets;

profile.Packer = {
    {Name = "Decimating Bullet", Quantity = "all"},
    {Name = "Dec. Bul. Pouch", Quantity = "all"},
};

profile.OnLoad = function()
	gSettings.AllowAddSet = true;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 10");
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1");

    -- logic from GearSwap
    DefaultAmmo = {["Selene's Bow"] = "Demon arrow", ["Hellfire"] = "Silver bullet", ["Gun of Trials"] = "Silver bullet"}
	U_Shot_Ammo = {["Selene's Bow"] = "Cmb.Cst. arrow", ["Hellfire"] = "Silver bullet", ["Gun of Trials"] = "Silver bullet"}

    CurrentAmmo = nil;

    gcinclude.settings.RefreshGearMPP = 35;
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

    if gData.GetEquipment().Ammo ~= nil then
            CurrentAmmo = gData.GetEquipment().Ammo.Name;
    end
    --gFunc.Error(CurrentAmmo)
end

profile.HandleAbility = function()
    local ability = gData.GetAction();

    if string.match(ability.Name, "Scavenge") then gFunc.EquipSet(sets.Scavenge);
    elseif string.match(ability.Name, "Sharpshot") then gFunc.EquipSet(sets.Sharpshot) end

    gcinclude.CheckCancels();
end

profile.HandleItem = function()
    local item = gData.GetAction();

	if string.match(item.Name, "Holy Water") then gFunc.EquipSet(gcinclude.sets.Holy_Water) end
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    gFunc.EquipSet(sets.Precast);

    gcinclude.CheckCancels();
end

profile.HandleMidcast = function()
    local weather = gData.GetEnvironment();
    local spell = gData.GetAction();
    local target = gData.GetActionTarget();

    if (spell.Skill == "Enhancing Magic") then
        gFunc.EquipSet(sets.Enhancing);
    elseif (spell.Skill == "Healing Magic") then
        gFunc.EquipSet(sets.Cure);
    elseif (spell.Skill == "Elemental Magic") then
        gFunc.EquipSet(sets.Nuke);
        if (spell.Element == weather.WeatherElement) or (spell.Element == weather.DayElement) then
            gFunc.Equip("Waist", "Hachirin-no-Obi");
        end
    elseif (spell.Skill == "Enfeebling Magic") then
        gFunc.EquipSet(sets.Enfeebling);
    elseif (spell.Skill == "Dark Magic") then
        gFunc.EquipSet(sets.Macc);
        if (string.contains(spell.Name, "Aspir") or string.contains(spell.Name, "Drain")) then
            gFunc.EquipSet(sets.Drain);
        end
    end
end

profile.HandlePreshot = function()
    local flurryI = gData.GetBuffCount(265);
    local flurryII = gData.GetBuffCount(581);
    local equipment = gData.GetEquipment();

    --gFunc.Message(equipment.Range.Name)
    --gFunc.Message(CurrentAmmo)
    if CurrentAmmo ~= DefaultAmmo[equipment.Range.Name] then
        gFunc.ForceEquip("ammo", "remove");
        gFunc.Equip("ammo", DefaultAmmo[equipment.Range.Name]);
    end

    gFunc.EquipSet(sets.Preshot);

    if flurryII > 0 then
        gFunc.EquipSet(sets.Preshot_FlurryII);
    elseif flurryI > 0 then
        gFunc.EquipSet(sets.Preshot_FlurryI);
    end
end

profile.HandleMidshot = function()
    local double = gData.GetBuffCount("Double Shot");
    local barrage = gData.GetBuffCount("Barrage");
    
	gFunc.EquipSet(sets.Midshot);
    
	if double > 0 then
        gFunc.EquipSet(sets.DoubleShot);
    end

    if (gcdisplay.GetCycle("MeleeSet") == "Acc") then
        gFunc.EquipSet(sets.Midshot_Acc);
    end

    if barrage > 0 then--ensure acc as base if barrage up
        gFunc.EquipSet(sets.Midshot_Acc);
        gFunc.EquipSet(sets.Barrage);
    end
end

profile.HandleWeaponskill = function()
    local canWS = gcinclude.CheckWsBailout();
	local UnlimitedShot = gData.GetBuffCount("Unlimited Shot");
    local equipment = gData.GetEquipment();

	if UnlimitedShot > 0 then 
        gFunc.ForceEquip(4, U_Shot_Ammo[equipment.Range.Name])
--        if equipment.Ammo.Name ~= U_Shot_Ammo[equipment.Range.Name] then
            --gFunc.Error("No Unlimited Shot Ammo available!")
            gFunc.Error("WS with special ammo!")
  --          gFunc.ForceEquip(4, DefaultAmmo[equipment.Range.Name])
    --        if equipment.Ammo.Name ~= DefaultAmmo[equipment.Range.Name] then
                --gFunc.Error("No Default Ammo available!")
            --end
        --end
    else
        gFunc.ForceEquip("ammo", "remove");
        gFunc.Equip("ammo", DefaultAmmo[equipment.Range.Name]);
    end
	
    if (canWS == false) then gFunc.CancelAction() return;
    else
        local ws = gData.GetAction();
        local weather = gData.GetEnvironment();
    
        gFunc.EquipSet(sets.Ws_Default)
        if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
        gFunc.EquipSet("Ws_" .. gcdisplay.GetCycle("MeleeSet")) end
        
        if string.match(ws.Name, "Savage Blade") then
            gFunc.EquipSet(sets.Savage_Default)
            if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
            gFunc.EquipSet("Savage_" .. gcdisplay.GetCycle("MeleeSet")); end
        elseif string.match(ws.Name, "Aeolian Edge") then
            gFunc.EquipSet(sets.Aedge_Default)
            if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
            gFunc.EquipSet("Aedge_" .. gcdisplay.GetCycle("MeleeSet")); end
            if (gcdisplay.GetCycle("MeleeSet") == "Default") then gcinclude.DoMoonshade() end;
        elseif string.match(ws.Name, "True Flight") then
            gFunc.EquipSet(sets.TrueFlight_Default)
            if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
            gFunc.EquipSet("TrueFlight_" .. gcdisplay.GetCycle("MeleeSet")); end
            if (gcdisplay.GetCycle("MeleeSet") == "Default") then gcinclude.DoMoonshade() end;
            if (weather.DayElement == "Light" or weather.RawWeatherElement == "Light") then gFunc.EquipSet(sets.WsObi) end
        elseif string.match(ws.Name, "Wildfire") then
            gFunc.EquipSet(sets.Wildfire_Default)
            if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
            gFunc.EquipSet("Wildfire_" .. gcdisplay.GetCycle("MeleeSet")); end
            if (gcdisplay.GetCycle("MeleeSet") == "Default") then gcinclude.DoMoonshade() end;
            if (weather.DayElement == "Fire" or weather.RawWeatherElement == "Fire") then gFunc.EquipSet(sets.WsObi) end
        end
    end
end

return profile;
