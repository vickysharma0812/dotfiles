if true then
  return {}
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(
        opts.ensure_installed,
        { "markdownlint-cli2", "markdown-toc", "markdownlint", "dprint", "markdown-oxide" }
      )
    end,
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        -- markdown = { "markdownlint" },
        markdown = { "markdownlint-cli2" },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    enabled = true,
    optional = true,
    opts = {
      formatters = {
        ["markdown-toc"] = {
          condition = function(_, ctx)
            for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
              if line:find("<!%-%- toc %-%->") then
                return true
              end
            end
          end,
        },
        ["markdownlint-cli2"] = {
          condition = function(_, ctx)
            local diag = vim.tbl_filter(function(d)
              return d.source == "markdownlint"
            end, vim.diagnostic.get(ctx.buf))
            return #diag > 0
          end,
        },
      },
      formatters_by_ft = {
        ["markdown"] = { "markdownlint-cli2", "markdown-toc", "dprint" },
        ["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {},
      },
    },
  },

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    enabled = false,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      {
        "<leader>cp",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    config = function()
      vim.cmd([[do FileType]])
    end,
  },

  {
    "MeanderingProgrammer/markdown.nvim",
    enabled = true,
    opts = {
      file_types = { "markdown", "norg", "rmd", "org" },
      code = {
        sign = false,
        width = "block",
        right_pad = 1,
      },
      heading = {
        sign = false,
        icons = {},
      },
    },
    ft = { "markdown", "norg", "rmd", "org" },
    config = function(_, opts)
      require("render-markdown").setup(opts)
      LazyVim.toggle.map("<leader>um", {
        name = "Render Markdown",
        get = function()
          return require("render-markdown.state").enabled
        end,
        set = function(enabled)
          local m = require("render-markdown")
          if enabled then
            m.enable()
          else
            m.disable()
          end
        end,
      })
    end,
  },
  -- {
  --   "ellisonleao/glow.nvim",
  --   enabled = false,
  --   config = true,
  --   cmd = "Glow",
  --   opts = {
  --     -- glow_path = "", -- will be filled automatically with your glow bin in $PATH, if any
  --     -- install_path = "~/.local/bin", -- default path for installing glow binary
  --     border = "shadow", -- floating window border config
  --     -- style = "dark|light", -- filled automatically with your current editor background, you can override using glow json style
  --     pager = false,
  --     width = 80,
  --     height = 100,
  --     width_ratio = 0.7, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
  --     height_ratio = 0.7,
  --   },
  -- },
  -- {
  --   "lukas-reineke/headlines.nvim",
  --   enabled = false,
  --   opts = {
  --     markdown = {
  --       codeblock_highlight = "",
  --     },
  --   },
  --   ft = { "markdown", "norg", "rmd", "org" },
  --   config = function(_, opts)
  --     -- PERF: schedule to prevent headlines slowing down opening a file
  --     vim.schedule(function()
  --       require("headlines").setup(opts)
  --       require("headlines").refresh()
  --     end)
  --   end,
  -- },
  -- {
  --   "plasticboy/vim-markdown",
  --   branch = "master",
  --   dependencies = { "godlygeek/tabular" },
  --   config = function()
  --     vim.g.markdown_folding_style_pythonic = 0
  --     vim.g.markdown_folding_disabled = 0
  --     vim.g.markdown_override_foldtext = 0
  --     vim.g.markdown_folding_level = 5
  --     vim.g.markdown_conceal = 1
  --     vim.g.markdown_math = 1
  --     vim.g.markdown_new_list_item_indent = 2
  --     vim.g.markdown_no_extensions_in_markdown = 1
  --     vim.g.markdown_autowrite = 1
  --     vim.g.markdown_edit_url_in = "tab" --"vsplit, hsplit, current"
  --   end,
  -- },
  --
  -- {
  --   "jakewvincent/mkdnflow.nvim",
  --   config = function()
  --     require("mkdnflow").setup({
  --       -- Config goes here; leave blank for defaults
  --       modules = {
  --         bib = true,
  --         buffers = true,
  --         conceal = true,
  --         cursor = true,
  --         folds = true,
  --         links = true,
  --         lists = true,
  --         maps = true,
  --         paths = true,
  --         tables = true,
  --         yaml = true,
  --         cmp = true,
  --       },
  --       bib = {
  --         default_path = nil,
  --         find_in_root = true,
  --       },
  --     })
  --   end,
  -- },
  -- {
  --   "epwalsh/obsidian.nvim",
  --   enabled = false,
  --   version = "*",
  --   lazy = false,
  --   event = {
  --     "BufReadPre " .. os.getenv("onedrive") .. "/Lectures/lectures/docs/**.md",
  --     "BufReadPre " .. os.getenv("docs") .. "/**.md",
  --   },
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
  --   dependencies = {
  --     -- Required.
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --     "hrsh7th/nvim-cmp",
  --     "ibhagwan/fzf-lua",
  --     -- see below for full list of optional dependencies 👇
  --   },
  --   opts = {
  --     workspaces = {
  --       {
  --         name = "easifemDocs",
  --         path = os.getenv("docs"),
  --       },
  --       {
  --         name = "lectures",
  --         path = os.getenv("onedrive") .. "/Lectures/lectures/docs",
  --       },
  --     },
  --     notes_subdir = "notes",
  --     disable_frontmatter = true,
  --     -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
  --     completion = {
  --       -- Set to false to disable completion.
  --       nvim_cmp = true,
  --       -- Trigger completion at 2 chars.
  --       min_chars = 2,
  --     },
  --     preferred_link_style = "markdown", -- wiki
  --   },
  -- },
}
