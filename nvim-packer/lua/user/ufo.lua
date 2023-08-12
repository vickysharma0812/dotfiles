local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
  print("ufo not found")
  return
end

ufo.setup(
  {
    provider_selector = function(bufnr, filetype, buftype)
      return { 'treesitter', 'indent' }
    end
  }
)
