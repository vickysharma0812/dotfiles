return {
  "folke/todo-comments.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "folke/trouble.nvim",
  },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    keywords = {
      PUBLIC = { icon = " ", color = "info" },
      INTERNAL = { icon = " ", color = "error" },
      SET = { icon = " ", color = "warning" },
      GET = { icon = " ", color = "test" },
      CONSTRUCTOR = { icon = "󰮮 ", color = "hint" },
      IO = { icon = "󰠿 ", color = "info" },
      SUBCLASS = { icon = "󰑣 ", color = "error" },
    },
  },
}
