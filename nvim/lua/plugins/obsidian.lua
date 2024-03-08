return {
  "epwalsh/obsidian.nvim",
  enabled = true,
  version = "*",
  lazy = true,
  event = { "BufReadPre " .. os.getenv("docs") .. "/**.md" },
  -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
  -- event = { "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    -- "hrsh7th/nvim-cmp",
    -- "ibhagwan/fzf-lua",
    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "easifemDocs",
        path = os.getenv("docs"),
      },
    },
    disable_frontmatter = true,
  },
}
