require('common');

local settings = T{ };
settings["alert_threshold"] = 90;
settings["area_label"] = "Area";
settings["auto_refresh_interval"] = 60;
settings["fast_indicator"] = "^";
settings["notes_visible"] = false;
settings["level_range_label"] = "Level Range";
settings["enable_alerts"] = true;
settings["enable_audio"] = true;
settings["show_gui"] = true;
settings["hide_sorting_text"] = false;
settings["show_config_gui"] = false;
settings["selected_sound"] = 1;
settings["sort_ascending"] = false;
settings["stopped_indicator"] = "x";
settings["slow_indicator"] = "=";
settings["audio_alert_threshold"] = 100;
settings["debug"] = false;
settings["sort_by"] = "completion";
settings["completion_label"] = "Completion";
settings["show_hvnm_title"] = true;

return settings;
