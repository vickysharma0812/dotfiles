if true then
  return {}
end

return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("alpha").setup(require("alpha.themes.dashboard").config)
  end,
  opts = function(_, dashboard)
    dashboard.section.header.val = {
      [[███████╗ █████╗ ███████╗██╗███████╗███████╗███╗   ███╗]],
      [[██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝████╗ ████║]],
      [[█████╗  ███████║███████╗██║█████╗  █████╗  ██╔████╔██║]],
      [[██╔══╝  ██╔══██║╚════██║██║██╔══╝  ██╔══╝  ██║╚██╔╝██║]],
      [[███████╗██║  ██║███████║██║██║     ███████╗██║ ╚═╝ ██║]],
      [[╚══════╝╚═╝  ╚═╝╚══════╝╚═╝╚═╝     ╚══════╝╚═╝     ╚═╝]],
    }
    -- local button = dashboard.button("p", " " .. " Projects", ":Telescope projects <CR>")
    -- button.opts.hl = "AlphaButtons"
    -- button.opts.hl_shortcut = "AlphaShortcut"
    -- table.insert(dashboard.section.buttons.val, 4, button)
  end,
}
