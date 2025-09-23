local profile = {};
gcdisplay = gFunc.LoadFile('common\\gcdisplay.lua');
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');


local sets = {
    Base = {
        --Main = {"Kukulcan's Staff", "Freesword's Staff"},
        Head = {"Summoner's Horn" ,"Evoker's Horn" ,"Austere Hat", "Silver Hairpin"},
        Ear2 = "Loquac. Earring",
        Body = {"Summoner's Dblt." ,"Evoker's Doublet" ,"Austere Robe", "Seer's Tunic"},
        Hands = {"Summoner's Brcr." ,"Savage gauntlets"},
        Ring1 = {"Evoker's Ring" ,"Astral Ring"},
        Ring2 = "Astral Ring",
        Waist = "Friar's rope",
        Legs = {"Summoner's Spats" ,"Evoker's Spats", "Savage Loincloth", "Seer's Slacks", "Baron's Slops" },
        Feet = {"Summoner's Pgch." ,"Evoker's Pigaches", "Savage Gaiters"},
    },
    BaseSMN = {
        Ammo = "",
        Head = "Evoker's Horn",
        Neck = "Summoning Torque",
        Ear1 = "",
        Ear2 = "",
        Body = "",
        Hands = "Summoner's Brcr.",
        Ring1 = "Evoker's Ring",
        Ring2 = "",
        Back = "Astute Cape",
        Waist = "",
        Legs = "",
        Feet = "Nashira Crackows",
    },
    Idle_Priority = {
        BaseSet = "Base"

    },
    Pet_Idle = {--only need 14, rest 512|575|670 skill for favor then refresh
    BaseSet = "Base",
    Head = "Austere Hat",
    Body = "Austere Robe",
    },
    Resting_Priority = {
		Main = {"Pluto's Staff", "Kukulcan's Staff", "Pilgrim's Wand"},
        Ear1 = "Relaxing Earring",
		Body = {"Errant Hpl.", "Seer's Tunic"},
		Legs = "Baron's Slops",
	},
    Idle_Regen = {},
    Idle_Refresh = {},
    Town = {
        Body = "Ducal Aketon",
    },
	
	Dt = {},
    Pet_Dt = {},
	
	Tp_Default = {},
	Tp_Hybrid = {},
	Tp_Acc = {},
    Pet_Only_Tp = {
        BaseSet = "BaseSMN",
    },

    Precast = {
        Ear2 = "Loquac. Earring",--2
        Waist = "Swift Belt",-- +3acc +4haste
        Feet = "Rostrum Pumps",

    },
    Cure_Precast = {},
    Enhancing_Precast = {
        Waist = "Siegel Sash",
    },
    Stoneskin_Precast = {},

    Cure = {--I cap is 50, II cap is 30
        },
    Regen = {},
    Cursna = {},

    Enhancing = {},
    Stoneskin = {},
    Refresh = {},

    SIR = {--77 speel interruption rate
        Ammo = "Staunch Tathlum",--10
        Neck = "Loricate Torque +1",--5
        Hands = "Amalric Gages +1",--11
        Waist = "Rumination Sash",--10
        Feet = "Amalric Nails +1",--16
    },

    Drain = {},

	Ws_Default = {},
    Ws_Hybrid = {},
    Ws_Acc = {},
	
    BP_Priority = {--I/II cap at 15, the rest need 680 skill total
        Head = {"Summoner's Horn" ,"Austere Hat"}, --3/2
        Body = "Austere Robe",-- 3
        Hands = {"Summoner's Brcr." ,"Austere Cuffs"},-- 2/1
        Legs = "Summoner's Spats",-- 2 
        Feet = "Summoner's Pgch.",-- 2
    },
    Siphon = {},

	SmnPhysical = {
        BaseSet = "BaseSMN";
        Hands = "Summoner's Brcr.",
        Legs = "Evoker's Spats",
        Feet = "Summoner's Pgch.",
    },
	SmnMagical = {
        BaseSet = "BaseSMN";
    },
	SmnSkill_Priority = {
        Head = {"Evoker's Horn", "Austere Hat"},
        Neck = "Summoning Torque",
        Body = "Austere Robe",
        Hands = {"Summoner's Brcr.", "Austere Cuffs"},
        Feet = {"Nashira Crackows"},
        Ring1 = {"Evoker's Ring"},
        Back = "Astute Cape",
    },
    SmnAttributes = {--mostly for Wind's Blessing"
    BaseSet = "BaseSMN";
    },
    SmnHealing = {--avatar HP+
    BaseSet = "BaseSMN";
    },
	SmnEnfeebling = {
        BaseSet = "BaseSMN";
    },
    SmnHybrid = {--special set for flamming crush and burning strike (for now)
    BaseSet = "BaseSMN";
    Hands = "Summoner's Brcr.",
    Legs = "Evoker's Spats",
    Feet = "Summoner's Pgch.",
},
	
    TH = {},
	Movement = {
        Feet = "Herald's Gaiters",
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

local MagicBP = T{"Meteorite","Stone II","Stone IV","Geocrush","Water II","Water IV","Grand Fall","Aero II","Aero IV","Wind Blade","Fire II","Fire IV","Meteor Strike","Burning Strike","Blizzard II","Blizzard IV","Heavenly Strike","Thunder II","Thunder IV","Thunderstorm","Thunderspark"};
local PhysBP = T{"Poison Nails","Moonlit Charge","Somnolence","Punch","Rock Throw","Barracuda Dive","Claw","Axe Kick","Shock Strike","Camisado","Regal Scratch","Crescent Fang","Rock Buster","Tail Whip","Double Punch","Megalith Throw","Double Slap","Eclipse Bite","Flaming Crush","Mountain Buster","Spinning Dive","Predator Claws","Rush","Chaotic Strike"};
local BuffBP = T{"Shining Ruby","Aerial Armor","Frost Armor","Rolling Thunder","Crimson Howl","Lightning Armor","Ecliptic Growl","Glittering Ruby","Earthen Ward","Spring Water","Hastega","Noctoshield","Ecliptic Howl","Dream Shroud"};
local DebuffBP = T{"Luncar Cry","Mewing Lullaby","Nightmare","Lunar Roar","Slowga","Ultimate Terror","Sleepga","Eerie Eye"};

profile.Packer = {
    --{Name = "Chonofuda", Quantity = "all"},
};

--petElement gets set when you cast an avatar so we can match it to day/weather for relic armor
local petElement = "Light";

local function HandlePetAction(PetAction)
	if (gcinclude.SmnSkill:contains(PetAction.Name)) then
        gFunc.EquipSet(sets.SmnSkill);
        if PetAction.Name == "Wind's Blessing" then
            gFunc.EquipSet(sets.SmnAttributes);
        end
	elseif (gcinclude.SmnMagical:contains(PetAction.Name)) then
        gFunc.EquipSet(sets.SmnMagical);
    elseif (gcinclude.SmnHybrid:contains(PetAction.Name)) then
        gFunc.EquipSet(sets.SmnHybrid);
	elseif (gcinclude.SmnHealing:contains(PetAction.Name)) then
        gFunc.EquipSet(sets.SmnHealing);
    elseif (gcinclude.SmnEnfeebling:contains(PetAction.Name)) then
        gFunc.EquipSet(sets.SmnEnfeebling);
    else
        gFunc.EquipSet(sets.SmnPhysical);
    end
end

profile.OnLoad = function()
	gSettings.AllowAddSet = true;
    gcinclude.Initialize();
    gFunc.ApplyBaseSets(profile.Sets);
    gcinclude.settings.RegenGearHPP = 50;
    gcinclude.settings.RefreshGearMPP = 60;
    gcinclude.settings.PetDTGearHPP = 30;
    --[[ Set you job macro defaults here]]
    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 9");
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

    local pet = gData.GetPet();
	local petAction = gData.GetPetAction();
    if (petAction ~= nil) then
        HandlePetAction(petAction);
        return;
    end
	
	local player = gData.GetPlayer();
    if (player.Status == "Engaged") then
        gFunc.EquipSet(sets.Tp_Default);
        if (gcdisplay.GetCycle("MeleeSet") ~= "Default") then
            gFunc.EquipSet("Tp_" .. gcdisplay.GetCycle("MeleeSet")) end
		if (gcdisplay.GetToggle("TH") == true) then gFunc.EquipSet(sets.TH) end
    elseif (pet ~= nil and pet.Status == "Engaged") then
        gFunc.EquipSet(sets.Pet_Only_Tp);
    elseif (player.Status == "Resting") then
        gFunc.EquipSet(sets.Resting);
    else
		gFunc.EquipSet(sets.Idle);
    end

    if (pet ~= nil) and (pet.Status == "Idle") then
        gFunc.EquipSet(sets.Pet_Idle);
	end
	
	if (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
	end
	
    if (pet ~= nil) then
        if pet.Name == "Carbuncle" then
            gFunc.Equip("hands","Carbuncle Mitts");
        end

        if (player.MainJobSync  >=  51) then
            gFunc.Equip("main", ElementalStaffTable[petElement]) 
            
        end
    
    end

	gcinclude.CheckDefault ();
    if (gcdisplay.GetToggle("DTset") == true) then
		gFunc.EquipSet(sets.Dt);
        if (pet ~= nil) then
            gFunc.EquipSet(sets.Pet_Dt);
		end
	end
    if (gcdisplay.GetToggle("Kite") == true) then gFunc.EquipSet(sets.Movement) end;

    
end

profile.HandleAbility = function()
	local ability = gData.GetAction();
    local ac = gData.GetBuffCount("Astral Conduit");
    if ac > 0 then return end

    if (ability.Name == "Release") or (ability.Name == "Avatar's Favor") or (ability.Name == "Assault") or (ability.Name == "Retreat") or (ability.Name == "Apogee") then return end

    gFunc.EquipSet(sets.BP);

    if (ability.Name == "Elemental Siphon") then
        gFunc.EquipSet(sets.Siphon);
    end

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
    local petAction = gData.GetPetAction();

    if (player.MainJobSync  >=  51) then
        gFunc.Equip("main", ElementalStaffTable[spell.Element]) 
    end

    if (petAction ~= nil) then
        HandlePetAction(petAction);
        return;
    end    

    gFunc.EquipSet(sets.SIR);

    if (spell.Skill == "Enhancing Magic") then
        gFunc.EquipSet(sets.Enhancing);

        if string.match(spell.Name, "Stoneskin") then
            gFunc.EquipSet(sets.Stoneskin);
        elseif string.contains(spell.Name, "Regen") then
            gFunc.EquipSet(sets.Regen);
        elseif string.contains(spell.Name, "Refresh") then
            gFunc.EquipSet(sets.Refresh);
        
        elseif string.match(spell.Name, "Sneak") then
            gFunc.EquipSet(sets.Sneak);
        elseif string.match(spell.Name, "Invisible") then
            gFunc.EquipSet(sets.Invisible);
        end

    elseif (spell.Skill == "Healing Magic") then
        gFunc.EquipSet(sets.Cure);
        if string.match(spell.Name, "Cursna") then
            gFunc.EquipSet(sets.Cursna);
        end
    elseif (spell.Skill == "Summoning") then
        gFunc.EquipSet(sets.SIR);
        petElement = spell.Element;

        gFunc.Equip("main", ElementalStaffTable[petElement]) 

    elseif (spell.Skill == "Dark Magic") then
        gFunc.EquipSet(sets.Drain);
    end
    
    
    
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
    end
end

return profile;
