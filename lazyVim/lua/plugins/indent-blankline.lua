if true then
  return {}
end

return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    -- char = "▏",
    char = "│",
    filetype_exclude = {
      "help",
      "alpha",
      "dashboard",
      "neo-tree",
      "Trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
    },
    show_trailing_blankline_indent = false,
    show_current_context_start = true,
    show_current_context = true,
  },
}
