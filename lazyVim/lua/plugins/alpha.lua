return {
  "goolord/alpha-nvim",
  optional = true,
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
