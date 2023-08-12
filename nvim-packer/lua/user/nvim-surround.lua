local status_ok, nvim_surround = pcall(require, "nvim-surround")
if not status_ok then
  return
end

nvim_surround.setup({
  keymaps = {
    insert = "<C-g>z",
    insert_line = "gC-ggZ",
    normal = "gz", -- replace ys --> gz[object][char]
    normal_cur = "gZ",
    normal_line = "gzgz",
    normal_cur_line = "gZgZ",
    visual = "gz", -- replace ys
    visual_line = "gZ",
    delete = "gzd", --replace ds
    change = "gzc", -- replace cs
  },
})
