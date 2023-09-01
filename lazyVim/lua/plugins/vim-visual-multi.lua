return {
  "mg979/vim-visual-multi",
  branch = "master",
  setup = function()
    vim.g.VM_default_mappings = 0
    vim.g.VM_maps = {
      ["Find Under"] = "",
    }
  end,
  config = function()
    if vim.fn.has("macunix") then
      vim.keymap.set("n", "ƒ", "<Plug>(VM-Find-Under)")
      vim.keymap.set("n", "å", "<Plug>(VM-Select-All)")
      vim.keymap.set("n", "∆", "<Plug>(VM-Add-Cursor-Down)")
      vim.keymap.set("n", "˚", "<Plug>(VM-Add-Cursor-Up)")
      vim.keymap.set("n", "…", "<Plug>(VM-Add-Cursor-At-Pos)")
      vim.keymap.set("x", "å", "<Plug>(VM-Visual-All)")
      vim.keymap.set("x", "ƒ", "<Plug>(VM-Visual-Find)")
      vim.keymap.set("x", "∂", "<Plug>(VM-Visual-Add)")
      vim.keymap.set("x", "…", "<Plug>(VM-Visual-Cursors)")
    else
      vim.keymap.set("n", "<M-f>", "<Plug>(VM-Find-Under)")
      vim.keymap.set("n", "<M-a>", "<Plug>(VM-Select-All)")
      vim.keymap.set("n", "<M-d>", "<Plug>(VM-Add-Cursor-Down)")
      vim.keymap.set("n", "<M-k>", "<Plug>(VM-Add-Cursor-Up)")
      vim.keymap.set("n", "<M-j>", "<Plug>(VM-Add-Cursor-At-Pos)")
      vim.keymap.set("x", "<M-a>", "<Plug>(VM-Visual-All)")
      vim.keymap.set("x", "<M-f>", "<Plug>(VM-Visual-Find)")
      vim.keymap.set("x", "<M-d>", "<Plug>(VM-Visual-Add)")
      vim.keymap.set("x", "<M-;>", "<Plug>(VM-Visual-Cursors)")
    end
  end,
}
