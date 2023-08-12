-- if true then
--   return {}
-- end

return {
  "barreiroleo/ltex_extra.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  -- yes, you can use the opts field, just I'm showing the setup explicitly
  config = function()
    local path = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
    local words = {}

    for word in io.open(path, "r"):lines() do
      table.insert(words, word)
    end

    require("ltex_extra").setup {
      load_langs = { "en-US" },                     -- table <string> : languages for witch dictionaries will be loaded
      init_check = true,                            -- boolean : whether to load dictionaries on startup
      path = vim.fn.stdpath("config") .. "/spell/", -- string : path to store dictionaries. Relative path uses current working directory
      log_level = "none",                           -- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
      -- server_opts = nil,
      server_opts = {
        -- capabilities = your_capabilities,
        -- on_attach = function(client, bufnr)
        --   -- your on_attach process
        -- end,
        settings = {
          ltex = {
            additionalRules = {
              enablePickyRules = true,
              motherTongue = 'en',
              languageModel = '~/ngram',
            },
            checkFrequency = "save",
            disabledRules = {
              ['en-US'] = { 'PROFANITY', 'PASSIVE_VOICE' },
              ['en-GB'] = { 'PROFANITY', 'PASSIVE_VOICE' },
            },
            dictionary = {
              ['en-US'] = words,
              ['en-GB'] = words,
            },
            -- filetypes ={ "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex" }
            filetypes = { "tex" },
            enabled = { "latex", "tex", "bib" },
          },
        }
      },
    }
  end
}
