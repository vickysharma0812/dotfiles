-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Tokyo Night"

-- config.font = wezterm.font 'JetBrains Mono'
config.font = wezterm.font("VictorMono Nerd Font Propo")

-- config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

config.window_background_opacity = 0.9
config.macos_window_background_blur = 10

config.window_decorations = "RESIZE"

config.use_fancy_tab_bar = true

-- and finally, return the configuration to wezterm
return config
