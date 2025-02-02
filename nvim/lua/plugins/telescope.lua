return {
  {
    "nvim-telescope/telescope-symbols.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        layout_strategy = "center",
        -- horizontal, center, vertical, flex
        layout_config = {
          center = {
            -- The `anchor` can be any of the following strings:
            --   - "", "CENTER", "NW", "N", "NE", "E", "SE", "S", "SW", "W" The anchors
            --     have the following meanings:
            --   - "" or "CENTER":
            --     the picker will remain in the middle of the screen.
            --   - Compass directions:
            --     the picker will move to the corresponding edge/corner e.g. "NW" -> "top
            --     left corner", "E" -> "right edge", "S" -> "bottom edge"
            anchor = "N",
            height = 0.35,
            width = 0.9,
            prompt_position = "bottom",
            preview_cutoff = 1,
          },
          horizontal = {
            prompt_position = "top",
            preview_cutoff = 1,
          },
        },
      },
    },
    config = function()
      require("telescope").load_extension("projects")
      -- return {
      -- extensions = {
      -- fzf = {
      --   fuzzy = true, -- false will only do exact matching
      --   override_generic_sorter = true, -- override the generic sorter
      --   override_file_sorter = true, -- override the file sorter
      --   case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      --   -- the default case_mode is "smart_case"
      -- },
      -- heading = {
      --   treesitter = true,
      -- },
      -- frecency = {
      --   db_root = "/home/easifem/.local/share/nvim/frecency.db/",
      --   show_scores = true,
      --   show_unindexed = true,
      --   ignore_patterns = { "*.git/*", "*/tmp/*", "*/build/*", "node_modules/*", ".*/" },
      --   disable_devicons = false,
      --   workspaces = {
      --     ["easifem"] = "/home/easifem/Dropbox/easifem/",
      --     ["easifemBase"] = "/home/easifem/Dropbox/easifem/easifem-base/",
      --     ["easifemClasses"] = "/home/easifem/Dropbox/easifem/easifem-classes/",
      --     ["easifemDocs"] = "/home/easifem/Dropbox/easifem/easifem-docs/",
      --     ["conf"] = "/home/easifem/.config",
      --     ["data"] = "/home/easifem/.local/share",
      --   },
      --   aerial = {
      --     -- Display symbols as <root>.<parent>.<symbol>
      --     show_nesting = {
      --       ["_"] = false, -- This key will be the default
      --       json = true, -- You can set the option for specific filetypes
      --       yaml = true,
      --     },
      --   },
      -- },
      -- },
      -- }
    end,
  },

  -- project
  {
    "ahmedkhalf/project.nvim",
    lazy = false,
    opts = {
      active = true,
      on_config_done = nil,
      manual_mode = false,
      detection_methods = { "pattern", "lsp" },
      patterns = { ".git" },
      show_hidden = false,
      silent_chdir = true,
      ignore_lsp = {},
    },
  },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({
        -- { "borderless_full" },
        -- { "telescope", "fzf-native" },
        -- winopts = {
        --   -- split = "belowright",
        --   split = "below",
        --   -- border = "single",
        --   preview = {
        --     hidden = "nohidden",
        --     -- border = "border",
        --     -- title = false,
        --     layout = "vertical",
        --     vertical = "bottom:60%",
        --   },
        -- },
      })
    end,
  },
}
