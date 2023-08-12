return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  opts = function()
    local nls = require("null-ls")
    return {
      root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
      sources = {
        -- nls.builtins.formatting.fish_indent,
        -- nls.builtins.diagnostics.fish,
        -- nls.builtins.formatting.stylua,
        -- nls.builtins.formatting.shfmt,
        -- nls.builtins.diagnostics.flake8,
        nls.builtins.formatting.fprettify.with({
          extra_args = {
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
          -- completion
          nls.builtins.completion.luasnip,
          -- diagnose
          --diagnostics.chktex,
        }),
      },
    }
  end,
}
