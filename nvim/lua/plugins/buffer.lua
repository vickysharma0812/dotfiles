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
      relative = "editor",
      use_devicons = true,
      width = 100,
      height = 30,
      border = "rounded",
      preview_position = "top",
      preview = {
        width = 100,
        height = 30,
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
        current = "",
        split = "󰃻",
        alternate = "",
        hidden = "󰘓",
        locked = "",
        ro = "",
        edited = "",
        terminal = "",
        default_file = "",
        terminal_symbol = ">_",
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    enabled = false,
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

  {
    "stevearc/oil.nvim",
    enabled = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", "<CMD>Oil<CR>", "Open parent directory" },
    },
    opts = {},
  },
  {
    "chentoast/marks.nvim",
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    branch = "harpoon2",
    lazy = false,
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup({})

      -- basic telescope configuration
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
              results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
          })
          :find()
      end

      vim.keymap.set("n", "<C-e>", function()
        toggle_telescope(harpoon:list())
      end, { desc = "Open harpoon window" })
    end,
  },
}
