local is_ok, nav = pcall(require, "navigator")
if not is_ok then
  io.write("navigator not found!!")
  return
end

nav.setup({
  mason = true,
  treesitter_navigation = true,
  lsp_signature_help = true,
})
