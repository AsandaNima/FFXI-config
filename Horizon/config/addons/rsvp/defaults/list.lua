require('common');

local settings = T{ };
settings["Visible"] = T{ };
settings["Y_Pos"] = 100;
settings["Visible"][1] = true;
settings["Group_Mode"] = true;
settings["Scale"] = 1;
settings["Auto_Clear_Delay"] = 30;
settings["Show_Countdown"] = true;
settings["Auto_Clear"] = false;
settings["Decoration"] = false;
settings["X_Pos"] = 100;
settings["Hour_Filter"] = 2;
settings["Apply_Filter"] = true;

return settings;
