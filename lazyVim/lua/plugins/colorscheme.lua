return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = { "bold", "italic" },
        functions = { "italic" },
        keywords = { "bold" },
        strings = { "italic" },
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = {},
      integration_default = nil, -- set to true/false to enable/disable integrations by default
      integrations = {
        aerial = true,
        bufferline = true,
        cmp = true,
        flash = true,
        gitsigns = true,
        gitgutter = true,
        harpoon = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        lsp_trouble = true,
        lsp_saga = true,
        nvimtree = true,
        neotree = true,
        noice = true,
        notify = true,
        notifier = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        mini = true,
        markdown = true,
        octo = true,
        overseer = true,
        symbols_outline = true,
        semantic_tokens = true,
        treesitter = true,
        treesitter_context = true,
        telekasten = true,
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        which_key = true,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    },
  },

  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      dim_inactive = true,
      palettes = {
        -- Custom duskfox with black background
        carbonfox = {
          bg1 = "#000000", -- Black background
          -- bg0 = "#1d1d2b", -- Alt backgrounds (floats, statusline, ...)
          -- bg3 = "#121820", -- 55% darkened from stock
          -- sel0 = "#131b24", -- 55% darkened from stock
        },
      },
      styles = {
        comments = "italic",
        keywords = "bold",
        types = "italic,bold",
        strings = "italic",
        conditionals = "NONE",
        constants = "NONE",
        functions = "NONE",
        numbers = "NONE",
        operators = "NONE",
        variables = "NONE",
      },
      modules = {
        alpha = true,
        barbar = true,
        cmp = true,
        gitgutter = true,
        gitsigns = true,
        hop = true,
        indent_blanklines = true,
        leap = true,
        lsp_saga = true,
        lsp_trouble = true,
        mini = true,
        navic = true,
        neotree = true,
        notify = true,
        symbol_outline = true,
        telescope = true,
        treesitter = true,
        whichkey = true,
      },
    },
  },

  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true },
        variables = {},
      },
    },
  },

  {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.moonflyVirtualTextColor = true
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      --- 'auto'|'main'|'moon'|'dawn'
      variant = "auto",
      --- 'main'|'moon'|'dawn'
      dark_variant = "main",
      bold_vert_split = false,
      dim_nc_background = false,
      disable_background = false,
      disable_float_background = false,
      disable_italics = false,

      --- string hex value or named color from rosepinetheme.com/palette
      groups = {
        background = "base",
        background_nc = "_experimental_nc",
        panel = "surface",
        panel_nc = "base",
        border = "highlight_med",
        comment = "muted",
        link = "iris",
        punctuation = "subtle",

        error = "love",
        hint = "iris",
        info = "foam",
        warn = "gold",

        headings = {
          h1 = "iris",
          h2 = "foam",
          h3 = "rose",
          h4 = "gold",
          h5 = "pine",
          h6 = "foam",
        },
        -- or set all headings at once
        -- headings = 'subtle'
      },

      -- Change specific vim highlight groups
      -- https://github.com/rose-pine/neovim/wiki/Recipes
      highlight_groups = {
        ColorColumn = { bg = "rose" },

        -- Blend colours against the "base" background
        CursorLine = { bg = "foam", blend = 10 },
        StatusLine = { fg = "love", bg = "love", blend = 10 },

        -- By default each group adds to the existing config.
        -- If you only want to set what is written in this config exactly,
        -- you can set the inherit option:
        Search = { bg = "gold", inherit = false },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "tokyonight",
      -- colorscheme = "catppuccin",
      -- colorscheme = "carbonfox",
      colorscheme = "rose-pine",
    },
  },
}
