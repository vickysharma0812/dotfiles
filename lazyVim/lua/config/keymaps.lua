-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap
--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- keymap("n", "<C-Up>", ":resize -2<CR>", opts) -- Resize with arrows
keymap("n", "<M-Up>", ":resize -2<CR>", opts) -- Resize with arrows
-- keymap("n", "<C-Down>", ":resize +2<CR>", opts) -- Resize with arrows
keymap("n", "<M-Down>", ":resize +2<CR>", opts) -- Resize with arrows
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts) -- Resize with arrows
keymap("n", "<M-Left>", ":vertical resize -2<CR>", opts) -- Resize with arrows
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts) -- Resize with arrows
keymap("n", "<M-Right>", ":vertical resize +2<CR>", opts) -- Resize with arrows
keymap("n", "<C-d>", "<C-d>zz", opts) -- Ctrl+d half page down; curson stays in the middle
keymap("n", "<C-u>", "<C-u>zz", opts) -- Ctrl+u half page up; cursor stays in the middle
keymap("v", "<leader>y", [["ay]], opts) -- press leader y to copy clipboard
keymap("n", "<leader>y", [["ay]], opts) -- press leader y to copy clipboard
keymap("n", "<leader>Y", [["aY]], opts) -- like Y but for copy in clipboard
keymap("n", "<leader>ya", "<cmd>%y+<cr>", opts) -- yank all in clipboard
--keymap("n", "<leader>Y", [["+yg_]], opts) -- like Y but for copy in clipboard
keymap("x", "<leader>p", [["_dP]], opts) -- Better paste, use it instead of p greatest remap ever
keymap("v", "<leader>p", [["ap]], opts) -- Better paste, use it instead of p greatest remap ever
keymap("v", "<leader>P", [["aP]], opts) -- Better paste, use it instead of p greatest remap ever
keymap("n", "<leader>p", [["ap]], opts) -- Better paste, use it instead of p greatest remap ever
keymap("n", "<leader>pp", [["aP]], opts) -- Better paste, use it instead of p greatest remap ever
keymap("n", "<leader>d", [["_d]], opts) -- delete line and copy in register _
keymap("v", "<leader>d", [["_d]], opts) -- delete line and copy in register
keymap("n", "<C-S-D>", "yyP", opts) -- duplicate a line below
keymap("v", "<C-S-D>", "yp", opts) -- duplicate a line below
keymap("x", "<C-S-D>", "yp", opts) -- duplicate a line below
keymap("n", "Q", "<nop>", opts)
keymap("n", "<C-k>", "<cmd>cnext<CR>zz", opts) -- goto next error
keymap("n", "<C-j>", "<cmd>cprev<CR>zz", opts) -- goto prev error
keymap("n", "<leader>k", "<cmd>lnext<CR>zz", opts)
keymap("n", "<leader>j", "<cmd>lprev<CR>zz", opts)
keymap("n", "<C-s>", ":write<CR>", opts) --save file
keymap("n", "<leader>u", ":UndotreeShow<CR>", opts)
keymap("v", "p", '"_dP', opts)
-- Move test up and down; select lines and move up using J and down using K
keymap("n", "\\j", "mzJ`z", opts) -- Press J to append the line below to the current line with a space
--keymap("n", "J", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "K", "<Esc>:m .-2<CR>==gi", opts)
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("i", "jk", "<ESC>", opts) -- Press jk fast to exit insert mode
keymap("i", "kj", "<ESC>", opts) -- Press kj fast to exit insert mode
keymap("v", "<", "<gv", opts) -- Stay in indent mode
keymap("v", ">", ">gv", opts) -- Stay in indent mode
keymap("n", "<M-\\>", ":NvimTreeToggle<CR>", opts) -- toggle explorer
keymap("n", "<leader>W", ":write<CR>", opts) -- toggle explorer
keymap("n", "<F5>", '"=strftime("%Y-%m-%d")<CR>P', opts) -- copy current date
keymap("n", "<C-CR>", "o<ESC>", opts) -- copy current date

vim.keymap.set("n", "<leader>wf", function()
  vim.lsp.buf.format()
  vim.cmd.w()
end, opts)

keymap("n", "tt", "<cmd>ToggleTerm direction=float<cr>", opts) -- copy current date
keymap("n", "tv", "<cmd>ToggleTerm direction=vertical<cr>", opts) -- copy current date
keymap("n", "th", "<cmd>ToggleTerm direction=horizontal<cr>", opts) -- copy current date
keymap("n", "tv", "<cmd>lua _VIFM_TOGGLE()<cr>", opts) -- copy current date

keymap("n", "<C-M-Right>", "<C-w>l", opts) -- copy current date
keymap("n", "<C-M-Left>", "<C-w>h", opts) -- copy current date
keymap("n", "<C-M-Up>", "<C-w>k", opts) -- copy current date
keymap("n", "<C-M-Down>", "<C-w>j", opts) -- copy current date

--- easifem

keymap("n", "<F6>", "<cmd>lua _BASE_TOGGLE()<cr>", opts) -- copy current date
keymap("n", "<F7>", "<cmd>lua _CLASS_TOGGLE()<cr>", opts) -- copy current date
keymap("n", "<F8>", "<cmd>e ~/Dropbox/easifem/easifem-base/<cr>", opts) -- copy current date
keymap("n", "<F9>", "<cmd>e ~/Dropbox/easifem/easifem-classes/<cr>", opts) -- copy current date

--- inline surround
