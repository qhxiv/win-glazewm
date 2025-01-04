-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'Konsolas'

-- Colors & Appearance
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- Launching Programs
config.default_prog = { 'pwsh' }

-- Fonts
config.font = wezterm.font 'JetBrainsMonoNL NF'
config.font_size = 10
config.freetype_load_target = "HorizontalLcd"

config.window_decorations = "RESIZE"

-- and finally, return the configuration to wezterm
return config
