return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  branch = "harpoon2",
  lazy = false,
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()
  end,
}
