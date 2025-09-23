local profile = {};
gcinclude = gFunc.LoadFile('common\\gcinclude.lua');

local Settings = {
    CurrentLevel = 0,
}

local sets = {
    Idle = {--[[
        Ammo = 'Staunch Tathlum',
        Head = 'Nyame Helm',
        Neck ='Unmoving Collar +1',
        Ear1 = 'Odnowa Earring +1',
        Ear2 = 'Etiolation Earring',
        Body = 'Nyame Mail',
        Hands = 'Volte Moufles',
        Ring1 = 'Moonbeam Ring',
        Ring2 = 'Gelatinous Ring +1',
        Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Phys. dmg. taken -10%', [2] = 'Mag. Eva.+20', [3] = 'Eva.+20', [4] = 'HP+60', [5] = 'Enmity+10' } },
        Waist = 'Flume Belt +1',
        Legs = 'Sakpata\'s Cuisses',
        Feet = 'Nyame Sollerets',]]
    },
    Resting = {},
    Idle_Regen = {
--         Head = 'Crepuscular Helm',
--         Neck = 'Bathy Choker +1',
--         Ear1 = 'Infused Earring',
--         Ring2 = 'Chirich Ring +1',
    },
    Idle_Refresh = {
        Neck = "Parade Gorget",
--         --Ammo = 'Homiliary',
--         Head = 'Jumalik Helm',
--         Ring1 = 'Stikini Ring +1',
    },
    Town = {
--         Main = 'Excalibur',
--         Sub = 'Aegis',
--         Ammo = 'Staunch Tathlum',
--         Head = 'Jumalik Helm',
--         Body = 'Found. Breastplate',
--         Hands = 'Volte Moufles',
--         Legs = 'Carmine Cuisses +1',
--         Feet = 'Cab. Leggings +1',
    },

    Dt = {
--         Ammo = 'Staunch Tathlum',
--         Head = 'Nyame Helm',
--         Neck ='Loricate Torque +1',
--         Ear1 = 'Odnowa Earring +1',
--         Ear2 = 'Etiolation Earring',
--         Body = 'Nyame Mail',
--         Hands = 'Sakpata\'s Gauntlets',
--         Ring1 = 'Moonbeam Ring',
--         Ring2 = 'Gelatinous Ring +1',
--         Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Phys. dmg. taken -10%', [2] = 'Mag. Eva.+20', [3] = 'Eva.+20', [4] = 'HP+60', [5] = 'Enmity+10' } },
--         Waist = 'Flume Belt +1',
--         Legs = 'Sakpata\'s Cuisses',
--         Feet = 'Nyame Sollerets',
    },

    Tp_Default_Priority = {
        Ammo = {'Bibiki Seashell'},
        Head = {'Founder\'s Corona', 'Gallant Coronet', "Mythril Sallet", 'Eisenschaller', "Garrison Sallet +1"},
        Neck = {"Peacock Charm", 'Armiger\'s Lace'},
        Ear1 = {"Brutal earring", "Outlaw's Earring","Pigeon Earring", 'Optical Earring'},
        Ear2 = {"Suppanomimi", "Pigeon Earring"},
        Body = {'Found. Breastplate','Gallant Surcoat',"Mtl. Breastplate", 'Eisenbrust', "Garrison Tunica +1"},
        Hands = {'Founder\'s Gauntlets', 'Gallant Gauntlets',"Mythril Gauntlets", 'Eisenhentzes', 'Guerilla Gloves'},
        Ring1 = {"Rajas Ring", 'Archer\'s Ring', 'San d\'Orian Ring'},
        Ring2 = {"Ulthalam's Ring", 'Archer\'s Ring', 'Bastokan Ring'},
        Back = {"Boxer's Mantle", "Earth Mantle", 'Lizard Mantle'},
        Waist = {"Ninurta's Sash", "Virtuoso Belt", 'Ryl.Kgt. Belt', "Tilt Belt", 'Plate Belt'},
        Legs = {'Founder\'s Hose', 'Gallant Breeches',"Mythril Cuisses" , 'Eisendiechlings', 'Garrison Hose +1'},
        Feet = {'Founder\'s Greaves', 'Gallant Leggings',"Mythril Leggings", 'Eisenschuhs', 'Leaping Boots'},
    },
    Tp_Hybrid_Priority = {
--         Ammo = 'Coiste Bodhar',
--         Head = 'Hjarrandi Helm',
--         Neck ='Sanctity Necklace',
--         Ear1 = 'Telos Earring',
--         Ear2 = 'Cessance Earring',
--         Body = 'Hjarrandi Breast.',
--         Hands = 'Sakpata\'s Gauntlets',
--         Ring1 = 'Moonbeam Ring',
--         Ring2 = 'Petrov Ring',
--         Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Accuracy+20', [2] = '"Dbl.Atk."+10', [3] = 'Attack+20', [4] = 'DEX+20' } },
--         Waist = 'Sailfi Belt +1',
--         Legs = 'Sakpata\'s Cuisses',
--         Feet = 'Flam. Gambieras +2',
    },
    Tp_Acc_Priority = {
        Ring1 = {"Archer's Ring"},
        Ring2 = {"Ulthalam's Ring", "Archer's Ring"},
        Waist = {"Virtuoso Belt"},

--         Ring1 = 'Cacoethic Ring +1',
--         Ring2 = 'Chirich Ring +1',
    },

    --These will overwrite any above TP profile.Sets if /tankset is used
    Tank_Main_Priority = {--Default Tanking,  dt
        Ammo = {'Bibiki Seashell'},
        Head = {'Founder\'s Corona', 'Gallant Coronet', "Mythril Sallet", 'Eisenschaller', "Garrison Sallet +1"},
        Neck = {"Peacock Charm", 'Armiger\'s Lace'},
        Ear1 = {"Brutal earring", "Outlaw's Earring", 'Optical Earring'},
        Ear2 = {"Suppanomimi", 'Dodge Earring'},
        Body = {'Found. Breastplate','Gallant Surcoat',"Mtl. Breastplate", 'Eisenbrust', "Garrison Tunica +1"},
        Hands = {'Founder\'s Gauntlets', 'Gallant Gauntlets',"Mythril Gauntlets", 'Eisenhentzes', 'Guerilla Gloves'},
        Ring1 = {"Sattva Ring", 'Archer\'s Ring', 'San d\'Orian Ring'},
        Ring2 = {"Bloodbead Ring", 'Archer\'s Ring', 'Bastokan Ring'},
        Back = {"Boxer's Mantle", "Earth Mantle", 'Lizard Mantle'},
        Waist = {"Virtuoso Belt", 'Ryl.Kgt. Belt', "Tilt Belt", 'Plate Belt'},
        Legs = {'Founder\'s Hose', 'Gallant Breeches',"Mythril Cuisses" , 'Eisendiechlings', 'Garrison Hose +1'},
        Feet = {'Founder\'s Greaves', 'Gallant Leggings',"Mythril Leggings", 'Eisenschuhs', 'Leaping Boots'},
--         Ammo = 'Staunch Tathlum',
--         Head = 'Chev. Armet +1',
--         Neck = 'Unmoving Collar +1',
--         Ear1 = 'Odnowa Earring +1',
--         Ear2 = 'Ethereal Earring',
--         Body = 'Hjarrandi Breast.',
--         Hands = 'Sakpata\'s Gauntlets',
--         Ring1 = 'Moonbeam Ring',
--         Ring2 = 'Gelatinous Ring +1',
--         Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Phys. dmg. taken -10%', [2] = 'Mag. Eva.+20', [3] = 'Eva.+20', [4] = 'HP+60', [5] = 'Enmity+10' } },
--         Waist = 'Sailfi Belt +1',
--         Legs = 'Sakpata\'s Cuisses',
--         Feet = 'Nyame Sollerets',
        },
    Tank_MEVA_Priority = {
--         Ammo = 'Staunch Tathlum',
--         Head = 'Nyame Helm',
--         Neck = 'Warder\'s Charm +1',
--         Ear1 = 'Eabani Earring',
--         Ear2 = 'Etiolation Earring',
--         Body = 'Nyame Mail',
--         Hands = 'Nyame Gauntlets',
--         Ring1 = 'Vengeful Ring',
--         Ring2 = 'Purity Ring',
--         Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Phys. dmg. taken -10%', [2] = 'Mag. Eva.+20', [3] = 'Eva.+20', [4] = 'HP+60', [5] = 'Enmity+10' } },
--         Waist = 'Carrier\'s Sash',
--         Legs = 'Nyame Flanchard',
--         Feet = 'Nyame Sollerets',
    },

    Precast_Priority = {--44 w/o Loquac due to HP drop
        Head = "Founder's Corona",
        Ear1 = "Loquac. Earring",
        Legs = "Founder's Hose",
        Feet = "Founder's Greaves" ,
--         Ammo = 'Sapience Orb',--2
--         Head = 'Chev. Armet +1',--7
--         Neck = 'Baetyl Pendant',--4
--         --Ear1 = 'Tuisto Earring',
--         Ear1 = 'Odnowa Earring +1',
--         Ear2 = 'Etiolation Earring',--1
--         Body = 'Rev. Surcoat +2',--5
--         Hands = 'Leyline Gloves',--6
--         Ring2 = 'Kishar Ring',--4
--         Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Phys. dmg. taken -10%', [2] = 'Mag. Eva.+20', [3] = 'Eva.+20', [4] = 'HP+60', [5] = 'Enmity+10' } },
--         Waist = 'Creed Baudrier',
--         Legs = 'Enif Cosciales',--8
--         Feet = 'Carmine Greaves +1',--7
    },
    Cure_Precast = {
--         --Ear1 = 'Mendi. Earring',
--         Ear2 = 'Nourish. Earring +1',
    },
    Enhancing_Precast = {
--         Waist = 'Siegel Sash',
    },
    Enhancing = {
        Legs = "Gallant Breeches",
        --         Waist = 'Siegel Sash',
    },
    Healing = {
        --         --Ear1 = 'Mendi. Earring',
        --         Ear2 = 'Nourish. Earring +1',
    },
    Divine = {
        Body = "Gallant Surcoat",
        --         Waist = 'Siegel Sash',
    },
    SIR = {--10 merits,101 gear
        Legs = "Valor Breeeches",

--         Ammo = 'Staunch Tathlum', -- 10
--         Head = 'Souv. Schaller +1', --20
--         Neck = 'Moonlight Necklace', -- 15
--         Body = 'Yorium Cuirass', -- 10
--         Waist = 'Creed Baudrier',
--         Legs = 'Founder\'s Hose', -- 30
--         Feet = 'Odyssean Greaves', -- 26
    },
    Enmity = {
        Head = "Founder's Corona",
        Body = "Found. Breastplate",
        Hands = "Gallant Gauntlets",
        Legs = "Gallant Breeches",

--         Ammo = 'Sapience Orb',--2
--         Head = 'Souv. Schaller +1',--9
--         Neck = 'Moonlight Necklace', -- 15--10
--         Body = 'Cab. Surcoat +3',--10
--         Ring1 = 'Eihwaz Ring',--5
--         Ring2 = 'Supershear Ring',--5
--         Ear1 = 'Friomisi Earring',--2
--         Ear2 = 'Cryptic Earring',--4
--         Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Phys. dmg. taken -10%', [2] = 'Mag. Eva.+20', [3] = 'Eva.+20', [4] = 'HP+60', [5] = 'Enmity+10' } },--10
--         Waist = 'Creed Baudrier',--5
--         Legs = 'Cab. Breeches +1',--7
--         Feet = 'Eschite Greaves',--15
    },

    Cure_Priority = {
--         Ammo = 'Staunch Tathlum',
--         Head = 'Souv. Schaller +1', --15rec
--         Neck = 'Moonlight Necklace', -- 15
--         --Ear1 = 'Tuisto Earring',
--         Ear1 = 'Odnowa Earring +1',
--         Ear2 = 'Nourish. Earring +1', -- 6
--         Body = 'Yorium Cuirass',--sir10
--         Hands = 'Macabre Gaunt. +1', -- 11
--         Ring1 = 'Eihwaz Ring',
--         Ring2 = 'Gelatinous Ring +1',
--         Back = 'Solemnity Cape', -- 7
--         Waist = 'Audumbla Sash',
--         Legs = 'Founder\'s Hose',
--         Feet = 'Odyssean Greaves', -- 7
    },
    Phalanx = {
--         Head = 'Souv. Schaller +1',
--         Neck = 'Moonlight Necklace',
--         Ear1 = 'Odnowa Earring +1',
--         Ear2 = 'Etiolation Earring',
--         Body = 'Yorium Cuirass', -- 3
--         Hands = 'Odyssean Gauntlets', --3
--         Ring1 = 'Moonbeam Ring',
--         Ring2 = 'Kishar Ring',
--         Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Phys. dmg. taken -10%', [2] = 'Mag. Eva.+20', [3] = 'Eva.+20', [4] = 'HP+60', [5] = 'Enmity+10' } },
--         Waist = 'Audumbla Sash',
--         Legs = 'Sakpata\'s Cuisses', -- 5
--         Feet = 'Odyssean Greaves',
    },
    Reprisal = {
--         Ammo = 'Sapience Orb',
--         Head = 'Souv. Schaller +1',
--         Neck = 'Moonlight Necklace', -- 15
--         Ear1 = 'Odnowa Earring +1',
--         Ear2 = 'Cryptic Earring',
--         Body = 'Shab. Cuirass +1',
--         Ring1 = 'Eihwaz Ring',
--         Ring2 = 'Gelatinous Ring +1',
--         Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Phys. dmg. taken -10%', [2] = 'Mag. Eva.+20', [3] = 'Eva.+20', [4] = 'HP+60', [5] = 'Enmity+10' } },--10
--         Waist = 'Audumbla Sash',
--         Legs = 'Founder\'s Hose',
--         Feet = 'Eschite Greaves',
    },
    Flash = {
--         Ammo = 'Staunch Tathlum',
--         Head = 'Souv. Schaller +1',
--         Neck = 'Moonlight Necklace', -- 15
--         Ear1 = 'Odnowa Earring +1',
--         Ear2 = 'Cryptic Earring',
--         Body = 'Rev. Surcoat +2',
--         Ring1 = 'Eihwaz Ring',
--         Ring2 = 'Supershear Ring',
--         Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Phys. dmg. taken -10%', [2] = 'Mag. Eva.+20', [3] = 'Eva.+20', [4] = 'HP+60', [5] = 'Enmity+10' } },
--         Waist = 'Audumbla Sash',
--         Legs = 'Founder\'s Hose',
--         Feet = 'Odyssean Greaves',
    },

    Preshot = {},
    Midshot = {
--         Ear1 = 'Telos Earring',
--         Ear2 = 'Crep. Earring',
    },

    Ws_Default_Priority = {
        Neck = {"Fotia Gorget", "Spike Necklace"},
        Ear1 = {"Brutal earring", "Outlaw's Earring", 'Optical Earring'},
        Ear2 = {"Aesir Ear Pendant", "Suppanomimi"},
        Ring2 = "Rajas Ring",
        Back = "Charger Mantle",
        Waist = "Warwolf Belt",
    },
    Ws_Hybrid_Priority = {
    },
    Ws_Acc_Priority = {
    },
    Chant_Default = {
--         Ammo = 'Jukukik Feather',
--         Head = 'Blistering Sallet +1',
--         Ear1 = 'Mache Earring +1',
--         Ear2 = 'Digni. Earring',
--         Body = 'Hjarrandi Breast.',
--         Hands = 'Flam. Manopolas +2',
--         Ring2 = 'Begrudging Ring',
--         Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Accuracy+20', [2] = 'Crit.hit rate+10', [3] = 'Attack+20', [4] = 'DEX+20' } },
--         Feet = 'Thereoid Greaves',
    },
    Chant_Hybrid = {
    },
    Chant_Acc = {
    },
    Savage_Default = {
--         Head = 'Nyame Helm',
--         Neck = 'Fotia Gorget',
--         Ear1 = 'Thrud Earring',
--         Ear2 = 'Digni. Earring',
--         Body = 'Nyame Mail',
--         Hands = 'Sakpata\'s Gauntlets',
--         Ring1 = 'Beithir Ring',
--         Ring2 = 'Karieyh Ring +1',
--         Waist = 'Sailfi Belt +1',
--         Legs = 'Sakpata\'s Cuisses',
--         Feet = 'Nyame Sollerets',
    },
    Savage_Hybrid = {
    },
    Savage_Acc = {
    },
    Atone_Default = {
--         Ammo = 'Staunch Tathlum',
--         Head = 'Souv. Schaller +1',
--         Neck = 'Moonlight Necklace', -- 15
--         Ear1 = 'Odnowa Earring +1',
--         Ear2 = 'Digni. Earring',
--         Body = 'Hjarrandi Breast.',
--         Hands = 'Sakpata\'s Gauntlets',
--         Ring1 = 'Eihwaz Ring',
--         Ring2 = 'Supershear Ring',
--         Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Phys. dmg. taken -10%', [2] = 'Mag. Eva.+20', [3] = 'Eva.+20', [4] = 'HP+60', [5] = 'Enmity+10' } },
--         Waist = 'Fotia Belt',
--         Legs = 'Sakpata\'s Cuisses',
--         Feet = 'Nyame Sollerets',
    },
    Atone_Hybrid = {
    },
    Atone_Acc = {
    },
    Aedge_Default = {
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

    Fealty = {
--         Body = 'Cab. Surcoat +3',
    },
    Sentinel = {
--         Feet = 'Cab. Leggings +1',
    },
    Bash = {
        Ear2 = "Knightly Earring",
        Hands = "Vlr. Gauntlets +1",
    },
    Invincible = {
--         Legs = 'Cab. Breeches +1',
    },
    Cover = {
        Head = "Gallant Coronet",
        Body = "Vlr. Surcoat +1",
    },
    Rampart = {
--         Head = 'Cab. Coronet +1',
    },
    
    TH = {
--         Ammo = 'Per. Lucky Egg',
-- 		Waist = 'Chaac Belt',
	},
    Movement = {
--         Ammo = 'Staunch Tathlum',
--         Head = 'Nyame Helm',
--         Neck ='Bathy Choker +1',
--         Ear1 = 'Odnowa Earring +1',
--         Ear2 = 'Etiolation Earring',
--         Body = 'Nyame Mail',
--         Hands = 'Volte Moufles',
--         Ring1 = 'Moonbeam Ring',
--         Ring2 = 'Gelatinous Ring +1',
--         Back = { Name = 'Rudianos\'s Mantle', Augment = { [1] = 'Phys. dmg. taken -10%', [2] = 'Mag. Eva.+20', [3] = 'Eva.+20', [4] = 'HP+60', [5] = 'Enmity+10' } },
--         Waist = 'Flume Belt +1',
--         Legs = 'Carmine Cuisses +1',
--         Feet = 'Nyame Sollerets',
	},
};
profile.Sets = sets;

-- profile.Packer = {
--     {Name = 'Om. Sandwich', Quantity = 'all'},
--     {Name = 'Black Curry Bun', Quantity = 'all'},
-- };

profile.OnLoad = function()
	gSettings.AllowAddSet = true;
    gcinclude.Initialize();

    AshitaCore:GetChatManager():QueueCommand(1, "/macro book 5")
    AshitaCore:GetChatManager():QueueCommand(1, "/macro set 1")

    local player = gData.GetPlayer()

    if (player.SubJob == "RDM") then
        AshitaCore:GetChatManager():QueueCommand(1, "/macro set 2")
    end

end

profile.OnUnload = function()
    gcinclude.Unload();
end

profile.HandleCommand = function(args)
    gcinclude.HandleCommands(args);
end

profile.HandleDefault = function()
-- handle levelsync
local player = gData.GetPlayer();

local myLevel = player.MainJobSync;
if (myLevel ~= Settings.CurrentLevel) then
    gFunc.EvaluateLevels(profile.Sets, myLevel);
Settings.CurrentLevel = myLevel;
end

    gFunc.EquipSet(sets.Idle);
	
    if (player.Status == 'Engaged') then
        gFunc.EquipSet(sets.Tp_Default)
        if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
			gFunc.EquipSet('Tp_' .. gcdisplay.GetCycle('MeleeSet')) end
        if (gcdisplay.GetCycle('TankSet') ~= 'None') then
			gFunc.EquipSet('Tank_' .. gcdisplay.GetCycle('TankSet')) end
    elseif (player.Status == 'Resting') then
        gFunc.EquipSet(sets.Resting);
    elseif (player.IsMoving == true) then
		gFunc.EquipSet(sets.Movement);
    end
	
    local cover = gData.GetBuffCount('Cover');
	if (cover >= 1) then
		gFunc.EquipSet(sets.Fealty); -- same set as fealty
	end
	
    gcinclude.CheckDefault();
    if (gcdisplay.GetToggle('DTset') == true) then gFunc.EquipSet(sets.Dt) end;
    if (gcdisplay.GetToggle('Kite') == true) then gFunc.EquipSet(sets.Movement) end;
end

profile.HandleAbility = function()
    local ability = gData.GetAction();
    gFunc.EquipSet(sets.Enmity)
	if string.match(ability.Name, 'Fealty') then
		gFunc.EquipSet(sets.Fealty);
    elseif string.match(ability.Name, 'Sentinel') then
		gFunc.EquipSet(sets.Sentinel);
    elseif string.match(ability.Name, 'Shield Bash') or string.match(ability.Name, 'Chivalry') then
		gFunc.EquipSet(sets.Bash);
    elseif string.match(ability.Name, 'Invincible') then
		gFunc.EquipSet(sets.Invincible);
    elseif string.match(ability.Name, 'Cover') then
		gFunc.EquipSet(sets.Cover);
    elseif string.match(ability.Name, 'Rampart') then
		gFunc.EquipSet(sets.Rampart);
	end

    gcinclude.CheckCancels();
end

profile.HandleItem = function()
    local item = gData.GetAction();

	if string.match(item.Name, 'Holy Water') then gFunc.EquipSet(gcinclude.sets.Holy_Water) end
end

profile.HandlePrecast = function()
    local spell = gData.GetAction();
    gFunc.EquipSet(sets.Precast)

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing_Precast);
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure_Precast);
    end

    gcinclude.CheckCancels();
end

profile.HandleMidcast = function()
    local spell = gData.GetAction();
    gFunc.EquipSet(sets.SIR);

    if (spell.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing);
    elseif (spell.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Healing);
    elseif (spell.Skill == 'Divine Magic') then
        gFunc.EquipSet(sets.Divine);
    end

    if string.contains(spell.Name, 'Cur') then
        gFunc.EquipSet(sets.Cure);
    elseif string.match(spell.Name, 'Phalanx') then
        gFunc.EquipSet(sets.Phalanx);
    elseif string.match(spell.Name, 'Reprisal') then
        gFunc.EquipSet(sets.Reprisal);
        return;--dont want to override this with SIR even with SIR toggle
    elseif string.match(spell.Name, 'Flash') then
        gFunc.EquipSet(sets.Flash);
    else
        gFunc.EquipSet(sets.Enmity);
    end

    if (gcdisplay.GetToggle('SIR') == true) then
        gFunc.EquipSet(sets.SIR);
    end
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
    
        gFunc.EquipSet(sets.Ws_Default)
--         if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
--         gFunc.EquipSet('Ws_' .. gcdisplay.GetCycle('MeleeSet')) end
--
--         if string.match(ws.Name, 'Chant du Cygne') then
--             gFunc.EquipSet(sets.Chant_Default)
--             if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
--             gFunc.EquipSet('Chant_' .. gcdisplay.GetCycle('MeleeSet')); end
-- 	    elseif string.match(ws.Name, 'Savage Blade') or string.match(ws.Name, 'Knights of Round') then
--             gFunc.EquipSet(sets.Savage_Default)
--             if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
--             gFunc.EquipSet('Savage_' .. gcdisplay.GetCycle('MeleeSet')); end
--         elseif string.match(ws.Name, 'Atonement') then
--             gFunc.EquipSet(sets.Atone_Default)
--             if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
--             gFunc.EquipSet('Atone_' .. gcdisplay.GetCycle('MeleeSet')); end
--         elseif string.match(ws.Name, 'Aeolian Edge') then
--             gFunc.EquipSet(sets.Aedge_Default)
--             if (gcdisplay.GetCycle('MeleeSet') ~= 'Default') then
--             gFunc.EquipSet('Aedge_' .. gcdisplay.GetCycle('MeleeSet')); end
--         end
    end
end

return profile;
