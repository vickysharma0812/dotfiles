return {

  {
    "echasnovski/mini.bufremove",
    version = false,
    opts = {
      silent = false,
    },
    config = true,
  },

  {
    "matbme/JABS.nvim",
    opts = {
      position = { "center", "top" },
      use_devicons = true,
      width = 50,
      height = 10,
      border = "rounded",
      preview_position = "top",
      preview = {
        width = 70,
        height = 20,
        border = "rounded",
      },
      keymap = {
        close = "d",
        jump = "<space>",
        h_split = "h",
        v_split = "v",
        preview = "p",
      },
      symbols = {
        current = "C", -- default 
        split = "󰃻", -- default 
        alternate = "A", -- default 
        hidden = "󰘓", -- default ﬘
        locked = "", -- default 
        ro = "", -- default 
        edited = "", -- default 
        terminal = "", -- default 
        default_file = "", -- Filetype icon if not present in nvim-web-devicons. Default 
        terminal_symbol = ">_", -- Filetype icon for a terminal split. Default 
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    opts = function()
      return {
        options = {
          themable = true,
          numbers = "none",
          close_command = function(n)
            require("mini.bufremove").delete(n, true)
          end,
          right_mouse_command = function(n)
            require("mini.bufremove").delete(n, true)
          end,
          left_mouse_command = "buffer %d",
          middle_mouse_command = nil,
          icon = "▎",
          color_icons = true,
          buffer_close_icon = "󰅚",
          modified_icon = "●",
          close_icon = "󰅖",
          left_trunc_marker = "",
          right_trunc_marker = "",
          max_name_length = 30,
          max_prefix_length = 30,
          tab_size = 21,
          diagnostics = false,
          diagnostics_update_in_insert = false,
          offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          persist_buffer_sort = true,
          separator_style = "thick",
          enforce_regular_tabs = true,
          always_show_bufferline = false,
          hover = {
            enabled = true,
            delay = 10,
            reveal = { "close" },
          },
        },
      }
    end,
  },
}
