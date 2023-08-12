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

}
