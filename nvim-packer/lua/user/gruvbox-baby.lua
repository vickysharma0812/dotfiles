local gruvbox_ok, gruvbox = pcall(require, "gruvbox-baby")
if not gruvbox_ok then
	io.write("gruvbox not found!!")
	return
end

-- local colors = require("gruvbox-baby.colors").config()

-- Example config in Lua
vim.g.gruvbox_baby_background_color = "medium"
vim.g.gruvbox_baby_comment_style = "NONE"
vim.g.gruvbox_baby_function_style = "italic"
vim.g.gruvbox_baby_keyword_style = "bold"
-- Each highlight group must follow the structure:
-- ColorGroup = {fg = "foreground color", bg = "background_color", style = "some_style(:h attr-list)"}
-- See also :h highlight-guifg
-- Example:
-- vim.g.gruvbox_baby_highlights = { Normal = { fg = "#123123", bg = "NONE", style = "underline" } }
-- Enable telescope theme
vim.g.gruvbox_baby_telescope_theme = 1
-- Enable transparent mode
-- vim.g.gruvbox_baby_transparent_mode = 1
-- Load the colorscheme
