local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
--local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

null_ls.setup({
  debug = false,
  sources = {
    -- format
    diagnostics.mypy.with({
      extra_args = function()
        local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_DEFAULT_ENV") or "/usr"
        return { "--python-executable", virtual .. "/bin/python3" }
      end,
    }),
    formatting.markdownlint,
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.fprettify.with({
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
      completion.luasnip,
      -- diagnose
      --diagnostics.chktex,
    }),
  },
})
