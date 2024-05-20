-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

vim.api.nvim_create_user_command("Rfinder", function()
  local path = vim.api.nvim_buf_get_name(0)
  os.execute("open -R " .. path)
end, {})

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = augroup("hide_decorations"),
  pattern = { "*" },
  callback = function()
    local ll_ok, lualine = pcall(require, "lualine")
    local stat = vim.g.statStatusLine
    if stat == nil or stat then
      if ll_ok then
        lualine.hide({ unhide = true })
      end
      vim.g.statStatusLine = false
      vim.cmd([[set laststatus=0]])
      vim.cmd([[hi! link StatusLine Normal]])
      vim.cmd([[hi! link StatusLineNC Normal]])
      vim.cmd([[set statusline=%{repeat('─',winwidth('.'))}]])
    end

    vim.cmd("set showtabline=0")
  end,
})

-- Reference
--https://github.com/stevearc/overseer.nvim/blob/master/doc/recipes.md#restart-last-task
--
vim.api.nvim_create_user_command("OverseerRestartLast", function()
  local overseer = require("overseer")
  local tasks = overseer.list_tasks({ recent_first = true })
  if vim.tbl_isempty(tasks) then
    vim.notify("No tasks found", vim.log.levels.WARN)
  else
    overseer.run_action(tasks[1], "restart")
  end
end, {})

vim.api.nvim_create_user_command("WatchRun", function()
  local overseer = require("overseer")
  overseer.run_template({ name = "run script" }, function(task)
    if task then
      task:add_component({ "restart_on_save", paths = { vim.fn.expand("%:p") } })
      local main_win = vim.api.nvim_get_current_win()
      overseer.run_action(task, "open hsplit")
      vim.api.nvim_set_current_win(main_win)
    else
      vim.notify("WatchRun not supported for filetype " .. vim.bo.filetype, vim.log.levels.ERROR)
    end
  end)
end, {})

-- function _G.set_terminal_keymaps()
--   local opts = { noremap = true }
--   vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
--   vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
--   vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
--   vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
--   vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
--   vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
-- end
-- vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
-- local Terminal = require("toggleterm.terminal").Terminal
-- local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
-- function _LAZYGIT_TOGGLE()
--   lazygit:toggle()
-- end
-- local vifm = Terminal:new({ cmd = "vifm", hidden = true })
-- function _VIFM_TOGGLE()
--   vifm:toggle()
-- end
-- local node = Terminal:new({ cmd = "node", hidden = true })
-- function _NODE_TOGGLE()
--   node:toggle()
-- end
-- local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
-- function _NCDU_TOGGLE()
--   ncdu:toggle()
-- end
-- local htop = Terminal:new({ cmd = "htop", hidden = true })
-- function _HTOP_TOGGLE()
--   htop:toggle()
-- end
-- local python = Terminal:new({ cmd = "python", hidden = true })
-- function _PYTHON_TOGGLE()
--   python:toggle()
-- end
-- local easifem_base = Terminal:new({
--   cmd = "base",
--   -- hidden = true,
--   hidden = false,
--   dir = os.getenv("base"), -- it should EASIFEM_BASE_SOURCE
--   close_on_exit = false,
--   count = 100,
--   direction = "horizontal",
--   float_opts = {
--     border = "double",
--   },
--   -- on_stderr = function(t: Terminal, job: number, data: string[], name: string) end,
--   -- on_stdout = function(t: Terminal, job: number, data: string[], name: string) end,
--   -- on_exit = function(t: Terminal, job: number, data: string[], name: string) end,
-- })
-- local easifem_class = Terminal:new({
--   cmd = "class",
--   hidden = true,
--   dir = os.getenv("classes"), -- it should EASIFEM_BASE_SOURCE
--   close_on_exit = false,
--   count = 101,
--   direction = "horizontal",
--   float_opts = {
--     border = "double",
--   },
-- })
-- function _BASE_TOGGLE()
--   easifem_base:toggle()
--   -- easifem_base:spawn()
-- end
-- function _CLASS_TOGGLE()
--   easifem_class:toggle()
-- end
--
