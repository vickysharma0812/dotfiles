return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  -- event = "VeryLazy", -- You can make it lazy-loaded via VeryLazy, but comment out if thing doesn't work
  init = function()
    -- taken from here https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
    vim.o.foldcolumn = "1" -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  config = function()
    require("ufo").setup({
      -- your config goes here
      -- open_fold_hl_timeout = ...,
      -- provider_selector = function(bufnr, filetype)
      --  ...
      -- end,
    })
  end,
}
