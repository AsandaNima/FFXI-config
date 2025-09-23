require('common');

local settings = T{ };
settings["dailies"] = T{ };
settings["dailies"]["Saltlix"] = T{ };
settings["dailies"]["Murdox"] = T{ };
settings["dailies"]["Beetrix"] = T{ };
settings["dailies"]["Fishstix"] = T{ };
settings["dailies"]["Mistrix"] = T{ };
settings["dailies"]["Saltlix"]["target"] = "Zikko";
settings["dailies"]["Saltlix"]["message"] = "Go to Caedarva Mire and kill Zikko!";
settings["dailies"]["Saltlix"]["zone"] = "Caedarva Mire";
settings["dailies"]["Murdox"]["count"] = "19";
settings["dailies"]["Murdox"]["target"] = "Orcs";
settings["dailies"]["Murdox"]["message"] = "Go to Yughott Grotto and kill 19 Orcs!";
settings["dailies"]["Murdox"]["zone"] = "Yughott Grotto";
settings["dailies"]["Beetrix"]["item"] = "Hound Fang Sack";
settings["dailies"]["Beetrix"]["message"] = "Go to The Sanctuary of Zi'Tah, get a Hound Fang Sack and trade it to me!";
settings["dailies"]["Beetrix"]["zone"] = "The Sanctuary of Zi'Tah";
settings["dailies"]["Fishstix"]["message"] = "Go to Sea Serpent Grotto, find and open my Secret Treasure Chest! If you're confused, just try showing some emotion in the area.";
settings["dailies"]["Fishstix"]["zone"] = "Sea Serpent Grotto";
settings["dailies"]["Mistrix"]["message"] = "Craft me up a signed orange au lait tank and trade it to me!";
settings["dailies"]["Mistrix"]["item"] = "orange au lait tank";
settings["deadline"] = 1758207600;
settings["version"] = 1;
settings["goldilox_time"] = 1756220400;
settings["offset"] = 32400;

return settings;
