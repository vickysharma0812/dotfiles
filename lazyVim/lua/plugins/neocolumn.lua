return {
  "ecthelionvi/NeoColumn.nvim",
  ft = { "fortran" },
  opts = {
    fg_color = "",
    bg_color = "",
    NeoColumn = "78",
    always_on = true,
    custom_NeoColumn = {},
    excluded_ft = { "text", "markdown" },
  },
  keys = {

    {
      "<leader>tc",
      "<cmd>ToggleNeoColumn<CR>",
      desc = "toggle column higlight",
    },
  },
}
