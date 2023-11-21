return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "c",
        "fortran",
        "lua",
        "rust",
        "latex",
        "markdown",
        "markdown_inline",
        "python",
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {

      autopairs = { enable = true },

      indent = {
        enable = true,
        disable = { "yaml", "fortran" },
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          scope_incremental = "<S-CR>",
          node_decremental = "<BS>",
        },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    init = function()
      -- disable rtp plugin, as we only need its queries for mini.ai
      -- In case other textobject modules are enabled, we will load them
      -- once nvim-treesitter is loaded
      local it = require("lazy.core.loader")
      it.disable_rtp_plugin("nvim-treesitter-textobjects")
      -- load_textobjects = true
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      return {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20, -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      }
    end,
  },
}
