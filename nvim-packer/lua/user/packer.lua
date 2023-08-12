-----------------------------------------------------------------------------
-- Automatically install packer
-----------------------------------------------------------------------------

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-----------------------------------------------------------------------------
-- Autocommand that reloads neovim whenever you save the plugins.lua file
-----------------------------------------------------------------------------

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-----------------------------------------------------------------------------
-- Use a protected call so we don't error out on first use
-----------------------------------------------------------------------------

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-----------------------------------------------------------------------------
-- Have packer use a popup window
-----------------------------------------------------------------------------

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-----------------------------------------------------------------------------
-- Install plugins here
-----------------------------------------------------------------------------

return packer.startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")
  use("nvim-tree/nvim-web-devicons")
  use("kkharji/sqlite.lua")
  use("stevearc/dressing.nvim")
  use("MunifTanjim/nui.nvim")
  use("rcarriga/nvim-notify")
  use("folke/noice.nvim")
  use("windwp/nvim-autopairs")
  use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }
  -- use({ "akinsho/bufferline.nvim", tag = "v3.*" })
  use("moll/vim-bbye")
  use("nvim-lualine/lualine.nvim")
  -- use("ellisonleao/glow.nvim")
  use { "ellisonleao/glow.nvim", config = function() require("glow").setup() end }
  use("nathom/filetype.nvim")
  -- use("ggandor/leap.nvim")
  use { "folke/flash.nvim" }
  use("kylechui/nvim-surround")
  use("AckslD/nvim-neoclip.lua")
  use({ "mg979/vim-visual-multi", branch = "master" })
  use("folke/which-key.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("folke/trouble.nvim")
  use("norcalli/nvim-colorizer.lua")
  use("RRethy/vim-illuminate")
  use("SmiteshP/nvim-navic")
  -- install without yarn or npm
  -- use({
  -- 	"iamcco/markdown-preview.nvim",
  -- 	run = function()
  -- 		vim.fn["mkdp#util#install"]()
  -- 	end,
  -- })

  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  })
  ---------------------------------------------------------
  -- color schemes
  ---------------------------------------------------------

  use("folke/tokyonight.nvim")
  use({ "rose-pine/neovim", as = "rose-pine" })
  use("goolord/alpha-nvim")
  use("folke/zen-mode.nvim")
  use("ahmedkhalf/project.nvim")
  use({ "luisiacc/gruvbox-baby", branch = "main" })
  --use({ "ellisonleao/gruvbox.nvim" })
  use({ "catppuccin/nvim", as = "catppuccin" })

  ---------------------------------------------------------
  -- cmp
  ---------------------------------------------------------

  use({ "hrsh7th/nvim-cmp" })
  use({ "hrsh7th/cmp-buffer" })
  use({ "hrsh7th/cmp-path" })
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-nvim-lua" })
  use({ "hrsh7th/cmp-cmdline" })
  use({ "saadparwaiz1/cmp_luasnip" })
  --use{ 'hrsh7th/cmp-vsnip' },
  --use{ 'hrsh7th/vim-vsnip-integ' },

  ---------------------------------------------------------
  -- snippets
  ---------------------------------------------------------

  use({ "L3MON4D3/LuaSnip" })
  -- Snippet Collection (Optional)
  --use{ 'rafamadriz/friendly-snippets' }
  --use{ 'hrsh7th/vim-vsnip' }

  ---------------------------------------------------------
  -- lsp
  ---------------------------------------------------------

  use({ "neovim/nvim-lspconfig" })
  use({ "williamboman/mason.nvim" })
  use({ "williamboman/mason-lspconfig.nvim" })
  use({ "williamboman/nvim-lsp-installer" })
  use({ "jose-elias-alvarez/null-ls.nvim" }) -- LSP diagnostics and code actions
  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  })
  use({ "barreiroleo/ltex-extra.nvim" })
  use({ "simrat39/symbols-outline.nvim" })

  use({
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    after = "nvim-web-devicons",     -- keep this if you're using NvChad
    config = function()
      require("barbecue").setup()
    end,
  })

  use {
    'stevearc/aerial.nvim',
    config = function() require('aerial').setup() end
  }

  ---------------------------------------------------------
  -- telescope
  ---------------------------------------------------------

  use("nvim-telescope/telescope.nvim")
  use("theprimeagen/harpoon")
  use("crispgm/telescope-heading.nvim")
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run =
    "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  })
  use("nvim-telescope/telescope-file-browser.nvim")

  ---------------------------------------------------------
  -- treesitter
  ---------------------------------------------------------

  use("nvim-treesitter/tree-sitter-query")
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("nvim-treesitter/playground")
  use("folke/twilight.nvim")
  use("p00f/nvim-ts-rainbow")
  use("numToStr/Comment.nvim")
  use({
    "nvim-telescope/telescope-frecency.nvim",
    -- requires = {"kkharji/sqlite.lua"}
  })
  use("nvim-telescope/telescope-symbols.nvim")
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

  ---------------------------------------------------------
  -- file navigation
  ---------------------------------------------------------
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  })
  -- use("nvim-tree/nvim-tree.lua")
  use("mbbill/undotree")

  ---------------------------------------------------------
  -- git support
  ---------------------------------------------------------
  use("tpope/vim-fugitive")
  use({ "lewis6991/gitsigns.nvim" })

  ---------------------------------------------------------
  -- terminal
  ---------------------------------------------------------

  use({ "akinsho/toggleterm.nvim", tag = "*" })

  use({
    'ray-x/navigator.lua',
    requires = {
      { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
    },
  })

  use { "ray-x/lsp_signature.nvim" }

  use { 'ray-x/go.nvim' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
