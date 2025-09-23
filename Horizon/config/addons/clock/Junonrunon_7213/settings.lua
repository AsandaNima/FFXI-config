require('common');

local settings = T{ };
settings["clocks"] = T{ };
settings["font"] = T{ };
settings["font"]["background"] = T{ };
settings["format"] = "[%I:%M:%S]";
settings["font"]["font_height"] = 16;
settings["font"]["font_family"] = "Arial";
settings["font"]["color"] = 4294967295;
settings["font"]["visible"] = true;
settings["font"]["background"]["visible"] = true;
settings["font"]["background"]["color"] = 2147483648;
settings["font"]["position_y"] = 1000;
settings["font"]["position_x"] = 1000;
settings["separator"] = " - ";

return settings;
