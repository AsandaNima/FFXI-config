require('common');

local settings = T{ };
settings["showGEO"] = T{ };
settings["disableToken"] = T{ };
settings["disableBell"] = T{ };
settings["isSettingsOn"] = T{ };
settings["disableNeedle"] = T{ };
settings["showLocked"] = T{ };
settings["onlyLockMobs"] = T{ };
settings["scale"] = 0.69999998807907104;
settings["showGEO"][1] = false;
settings["disableToken"][1] = false;
settings["disableBell"][1] = false;
settings["isSettingsOn"][1] = false;
settings["disableNeedle"][1] = false;
settings["showLocked"][1] = false;
settings["onlyLockMobs"][1] = true;

return settings;
