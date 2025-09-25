require('common');

local settings = T{ };
settings["showGEO"] = T{ };
settings["disableToken"] = T{ };
settings["disableBell"] = T{ };
settings["disableNeedle"] = T{ };
settings["isSettingsOn"] = T{ };
settings["showLocked"] = T{ };
settings["onlyLockMobs"] = T{ };
settings["scale"] = 1;
settings["showGEO"][1] = true;
settings["disableToken"][1] = false;
settings["disableBell"][1] = false;
settings["disableNeedle"][1] = false;
settings["isSettingsOn"][1] = false;
settings["showLocked"][1] = true;
settings["onlyLockMobs"][1] = true;

return settings;
