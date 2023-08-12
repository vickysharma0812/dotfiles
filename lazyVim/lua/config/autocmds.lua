-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

local vifm = Terminal:new({ cmd = "vifm", hidden = true })
function _VIFM_TOGGLE()
  vifm:toggle()
end

local node = Terminal:new({ cmd = "node", hidden = true })

function _NODE_TOGGLE()
  node:toggle()
end

local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

function _NCDU_TOGGLE()
  ncdu:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true })

function _HTOP_TOGGLE()
  htop:toggle()
end

local python = Terminal:new({ cmd = "python", hidden = true })

function _PYTHON_TOGGLE()
  python:toggle()
end

local easifem_base = Terminal:new({
  cmd = "base",
  hidden = true,
  dir = os.getenv("base"), -- it should EASIFEM_BASE_SOURCE
  close_on_exit = false,
  count = 100,
  direction = "horizontal",
  float_opts = {
    border = "double",
  },
})

local easifem_class = Terminal:new({
  cmd = "class",
  hidden = true,
  dir = os.getenv("classes"), -- it should EASIFEM_BASE_SOURCE
  close_on_exit = false,
  count = 101,
  direction = "horizontal",
  float_opts = {
    border = "double",
  },
})

function _BASE_TOGGLE()
  easifem_base:toggle()
end

function _CLASS_TOGGLE()
  easifem_class:toggle()
end
