return {
  "ahmedkhalf/project.nvim",
  lazy = false,
  opts = {
    active = true,
    on_config_done = nil,
    manual_mode = false,
    detection_methods = { "pattern", "lsp" },
    patterns = { ".git" },
    show_hidden = false,
    silent_chdir = true,
    ignore_lsp = {},
  },
}
