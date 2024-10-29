-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- font size
config.font_size = 16.0

-- and finally, return the configuration to wezterm
return config
