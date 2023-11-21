return {
  "plasticboy/vim-markdown",
  branch = "master",
  dependencies = { "godlygeek/tabular" },
  config = function()
    vim.g.markdown_folding_style_pythonic = 0
    vim.g.markdown_folding_disabled = 0
    vim.g.markdown_override_foldtext = 0
    vim.g.markdown_folding_level = 5
    vim.g.markdown_conceal = 1
    vim.g.markdown_math = 1
    vim.g.markdown_new_list_item_indent = 2
    vim.g.markdown_no_extensions_in_markdown = 1
    vim.g.markdown_autowrite = 1
    vim.g.markdown_edit_url_in = "tab" --"vsplit, hsplit, current"
  end,
}
