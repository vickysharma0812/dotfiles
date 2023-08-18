-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local options = {
  backup = false,                          -- creates a backup file
  --clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  nu = true,
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = true,                             -- display lines as one long line
  linebreak = true,                        -- companion to wrap, don't split words
  sidescrolloff = 8,                       -- minimal number of screen columns either side of cursor if wrap is `false`
  guifont = "monospace:h11",               -- the font used in graphical neovim applications
  whichwrap = "bs<>[]hl",                  -- which "horizontal" keys are allowed to travel to prev/next line
  relativenumber = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  smartindent = true,
  swapfile = false,
  undodir = os.getenv("HOME") .. "/.vim/undodir",
  undofile = true,
  hlsearch = false,
  incsearch = true,
  termguicolors = true,
  scrolloff = 8,
  grepformat = "%f:%l:%c:%m",
  grepprg = "rg --vimgrep",
  hidden = true,
  pumblend = 10,       -- popup blend
  spelllang = "en_us", -- popup blend
  spellfile = vim.fn.stdpath("config") .. "/spell/en-US.utf-8.add",
  laststatus = 3,
  splitkeep = "screen",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.clipboard:append({ "unnamed", "unnamedplus" })

-- vim.opt.shortmess = "ilmnrx"                        -- flags to shorten vim messages, see :help 'shortmess'
vim.opt.shortmess:append("c")                         -- don't give |ins-completion-menu| messages
vim.opt.iskeyword:append("-")                         -- hyphenated words recognized by searches
vim.opt.formatoptions:remove({ "c", "r", "o" })       -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- separate vim plugins from neovim in case vim still in use
vim.g.markdown_recommended_style = 0

if vim.g.neovide then
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_cursor_vfx_mode = 'railgun'
  -- vim.g.neovide_cursor_vfx_mode = 'torpedo'
  vim.g.neovide_cursor_animation_length = 0.04
  vim.g.neovide_cursor_trail_size = 0.8
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  -- vim.o.guifont = 'Fira_Code_Regular_Nerd_Font_Complete:h11'
  -- vim.o.guifont = 'VictorMono_Nerd_Font_Propo:h13'
  vim.o.guifont = 'JetBrainsMono_Nerd_Font_Mono:h13'
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  vim.g.neovide_fullscreen = false

  -- For transparency <---- starts
  -- Helper function for transparency formatting
  -- local alpha = function()
  --   return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
  -- end
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  -- vim.g.neovide_transparency = 1.0
  -- vim.g.transparency = 1.0
  -- vim.g.neovide_background_color = "#1a1b26" .. alpha()
  -- -----> end
end


-- taken from here https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
