return {
  "mg979/vim-visual-multi",
  branch = "master",
  init = function()
    vim.g.VM_default_mappings = 0
    vim.g.VM_maps = {
      ["VM_leader"] = "<M>",
      ["Find Under"] = "<C-d>",
    }
  end,
  config = function()
    local osname = vim.loop.os_uname().sysname
    -- if vim.fn.has("macunix") then
    if osname == "Darwin" then
      print("debug: vim-visual-multi Darwin")
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
      print("debug: vim-visual-multi Linux")
      -- vim.keymap.set("n", "<M-f>", "<Plug>(VM-Find-Under)")
      vim.keymap.set("n", "<M-s>", "<Plug>(VM-Select-All)")
      vim.keymap.set("n", "<M-j>", "<Plug>(VM-Add-Cursor-Down)")
      vim.keymap.set("n", "<M-k>", "<Plug>(VM-Add-Cursor-Up)")
      vim.keymap.set("n", "<M-;>", "<Plug>(VM-Add-Cursor-At-Pos)")
      vim.keymap.set("x", "<M-s>", "<Plug>(VM-Visual-All)")
      vim.keymap.set("x", "<M-f>", "<Plug>(VM-Visual-Find)")
      vim.keymap.set("x", "<M-d>", "<Plug>(VM-Visual-Add)")
      vim.keymap.set("x", "<M-;>", "<Plug>(VM-Visual-Cursors)")
    end
  end,
}
