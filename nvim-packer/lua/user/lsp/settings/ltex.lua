local path = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
local words = {}

for word in io.open(path, "r"):lines() do
  table.insert(words, word)
end

return {
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
    filetypes = { "markdown", "tex", "mdx" }
  },
}
