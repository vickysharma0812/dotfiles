local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  print("lspconfig not found!!")
  return
end

require("user.lsp.mason")
require("user.lsp.handlers").setup()
require("user.lsp.lsp_signature")
-- require("user.lsp.fortls")
-- require("user.lsp.ltex")
require("user.lsp.null-ls")
