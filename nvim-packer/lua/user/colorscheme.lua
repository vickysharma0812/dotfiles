-- local my_theme = "rose-pine"
local my_theme = "catppuccin"
-- local my_theme = "tokyonight"
-- local my_theme = "gruvbox-baby"

local status_ok, __ = pcall(require, my_theme)
if not status_ok then
	return
else
	require("user" .. "." .. my_theme)
end

vim.cmd("colorscheme " .. my_theme)
