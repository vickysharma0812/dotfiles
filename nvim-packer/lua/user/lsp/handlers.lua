local M = {}

-- TODO: backfill this to template
M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    -- virtual_text = { spacing = 4, prefix = "●" },
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function lsp_symbol_provide(client, bufnr)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end
end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
  end
  if client.name == "pyright" then
    print("disabling pyright formatting capabilities")
    client.server_capabilities.documentFormattingProvider = false
  end

  if client.name == "ltex" then
    local ltex_extra_ok, ltex_extra = pcall(require, "ltex_extra")
    if not ltex_extra_ok then
      vim.notify("ltex_extra not found")
    else
      ltex_extra.setup {
        load_langs = { "en-US" },                          -- table <string> : languages for witch dictionaries will be loaded
        init_check = true,                                 -- boolean : whether to load dictionaries on startup
        path = "/home/easifem/Dropbox/nvim-packer/spell/", -- string : path to store dictionaries. Relative path uses current working directory
        log_level = "none",                                -- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
      }
    end
  end

  require("navigator.lspclient.mapping").setup({ client = client, bufnr = bufnr }) -- setup navigator keymaps here,
  require("navigator.dochighlight").documentHighlight(bufnr)

  if client.server_capabilities.codeAction then
    require("navigator.codeAction").code_action_prompt(bufnr)
  end

  lsp_symbol_provide(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
