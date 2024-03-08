return {
  "iamcco/markdown-preview.nvim",
  enabled = false,
  build = "cd app && npm install",
  cmd = "MarkdownPreview",
  config = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.g.mkdp_markdown_css = vim.fn.stdpath("config") .. "/markdown-themes/tailwind-dark.css"
  end,
  ft = { "markdown" },
}
