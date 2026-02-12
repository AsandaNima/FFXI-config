require('common');

local settings = T{ };
settings["alert_threshold"] = 90;
settings["show_hvnm_title"] = true;
settings["auto_refresh_interval"] = 60;
settings["fast_indicator"] = "^";
settings["notes_visible"] = false;
settings["level_range_label"] = "Level Range";
settings["completion_label"] = "Completion";
settings["enable_audio"] = true;
settings["show_gui"] = true;
settings["hide_sorting_text"] = false;
settings["show_config_gui"] = false;
settings["sort_ascending"] = false;
settings["selected_sound"] = 1;
settings["stopped_indicator"] = "x";
settings["area_label"] = "Area";
settings["audio_alert_threshold"] = 100;
settings["debug"] = false;
settings["sort_by"] = "completion";
settings["slow_indicator"] = "=";
settings["enable_alerts"] = true;

return settings;
