if true then
  return {}
end

return {
  "nvimdev/guard.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvimdev/guard-collection",
  },
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

    ft("markdown"):fmt("prettier")
    -- ft("toml"):fmt("prettier")
    ft("javascript"):fmt("prettier")

    -- Call setup() LAST!
    require("guard").setup({
      -- the only options for the setup function
      fmt_on_save = false,
      -- Use lsp if no formatter was defined for this filetype
      lsp_as_default_formatter = true,
    })
  end,
}
