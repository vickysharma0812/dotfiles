return {
  "nvimdev/guard.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local ft = require("guard.filetype")

    ft("fortran"):fmt({
      cmd = "fprettify",
      args = {
        "--case",
        "2",
        "2",
        "2",
        "2",
        "--line-length",
        "78",
        "--indent",
        "2",
        "--strict-indent",
        "--disable-indent-mod",
        "--whitespace",
        "2",
        "--whitespace-comma",
        "--whitespace-assignment",
        "--enable-decl",
        "--whitespace-decl",
        "--whitespace-relational",
        "--whitespace-logical",
        "--whitespace-multdiv",
        "--whitespace-print",
        "--whitespace-intrinsics",
        "--strip-comments",
      },
      -- stdin = true
    })

    ft("julia"):fmt("lsp")

    -- Call setup() LAST!
    require("guard").setup({
      -- the only options for the setup function
      fmt_on_save = true,
      -- Use lsp if no formatter was defined for this filetype
      lsp_as_default_formatter = false,
    })
  end,
  -- dependencies = {
  --   'nvim-treesitter/nvim-treesitter', -- optional
  --   'nvim-tree/nvim-web-devicons',     -- optional
  -- },
}
