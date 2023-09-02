return {
  "jhofscheier/ltex-utils.nvim",
  branch = "vickysharma0812",
  -- ft = { "tex", "markdown" },
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-fzf-native.nvim", -- optional
  },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    dictionary = {
      -- Path to the directory where dictionaries are stored.
      -- Defaults to the Neovim cache directory.
      path = vim.fn.stdpath("config") .. "/spell/",
      ---Returns the dictionary file name for given language `lang`
      filename = function(lang)
        return lang .. ".utf-8.add"
      end,
      -- use vim internal dictionary to add unkown words
      use_vim_dict = true,
      -- show/suppress vim command output such as `spellgood` or `mkspell`
      vim_cmd_output = false,
    },
  },
}
