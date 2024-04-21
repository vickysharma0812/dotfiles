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
-- config.color_scheme = "catppuccin-mocha"
-- config.color_scheme = "flexoki-dark"
config.color_scheme = "tokyonight"
-- config.font = wezterm.font("VictorMono Nerd Font Propo")
config.font = wezterm.font("Monaspace Neon")
config.font_size = 14

config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

-- config.window_background_image = os.getenv("HOME") .. "/Dropbox/dotfiles/wallpaper/4k/8.jpg"
config.window_background_opacity = 1.0
config.macos_window_background_blur = 20
-- config.text_background_opacity = 0.5
-- config.default_prog = { "/opt/homebrew/bin/btop" }
config.window_decorations = "RESIZE"

config.keys = {
	{
		key = "Enter",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitHorizontal,
	},
	{
		key = "z",
		mods = "CTRL|SHIFT",
		action = wezterm.action.TogglePaneZoomState,
	},
}

-- and finally, return the configuration to wezterm
return config
