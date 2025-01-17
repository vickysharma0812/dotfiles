return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.indent = { disable = "fortran" }
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "fortran" })
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "fortls",
        "fprettify",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        fortls = function(_, opts)
          opts.cmd = {
            "fortls",
            "--lowercase_intrinsics",
            "--source_dirs",
            os.getenv("easifem") .. "/easifem-base/src/**",
            os.getenv("easifem") .. "/easifem-classes/src/**",
            os.getenv("HOME") .. "/.easifem/easifem/src/tomlf/src/**",
            -- os.getenv("easifem") .. "/StokesFlow/src/**",
            -- os.getenv("easifem") .. "/easifem-elasticity/src/**",
            "--hover_signature",
            "--hover_language=fortran",
            "--use_signature_help",
            "--incl_suffixes",
            ".F90",
          }
        end,
      },
    },
  },
  -- look
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = true,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
          severity_limit = "Warning",
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supporteelemTyped
          -- prefix = "icons",
        },
        severity_sort = true,

        -- virtual_text = true,
        -- show signs
        -- signs = {
        -- active = signs,
        -- },
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      },
      -- autoformat = true,
    },
  },
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          -- formatting
          nls.builtins.formatting.fprettify.with({
            extra_args = {
              "--case",
              "2",
              "2",
              "2",
              "2",
              "--line-length",
              "78",
              "--indent",
              "2",
              "--strict-indent",
              "--disable-indent-mod",
              "--whitespace",
              "2",
              "--whitespace-comma",
              "--whitespace-assignment",
              "--enable-decl",
              "--whitespace-decl",
              "--whitespace-relational",
              "--whitespace-logical",
              "--whitespace-multdiv",
              "--whitespace-print",
              "--whitespace-intrinsics",
              "--strip-comments",
            },
            -- completion
            nls.builtins.completion.luasnip,
          }),
        },
      }
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "((",
            jump_next = "))",
            accept = "<Tab>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<Tab>",
            accept_word = false,
            accept_line = false,
            next = "<M-)>",
            prev = "<M-(>",
            dismiss = "<C-)>",
          },
        },
        filetypes = {
          fortran = true,
          go = true,
          markdown = true,
          gitcommit = true,
          yaml = false,
          help = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = "node", -- Node.js version must be > 18.x
        server_opts_overrides = {},
      })
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {
      modes = {
        preview_float = {
          mode = "diagnostics",
          preview = {
            type = "float",
            relative = "editor",
            border = "rounded",
            title = "Preview",
            title_pos = "center",
            position = { 0, -2 },
            size = { width = 0.3, height = 0.3 },
            zindex = 200,
          },
        },
      },
    }, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  -- {
  --   "kevinhwang91/nvim-bqf",
  --   config = function()
  --     -- Adapt fzf's delimiter in nvim-bqf
  --     require("bqf").setup({
  --       filter = {
  --         fzf = {
  --           extra_opts = { "--bind", "ctrl-o:toggle-all", "--delimiter", "│" },
  --         },
  --       },
  --     })
  --   end,
  -- },
  {
    "m4xshen/hardtime.nvim",
    enabled = false,
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = { enabled = false },
  },
  {
    "tris203/precognition.nvim",
    enabled = false,
    event = "VeryLazy",
    opts = {},
  },
  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp", "treesitter", "regex" },
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)

      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
      end

      map("]]", "next")
      map("[[", "prev")

      -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = { document_highlight = { enabled = false } },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    enabled = false,
    event = "VeryLazy",
    opts = {
      -- INFO: Uncomment to use treeitter as fold provider, otherwise nvim lsp is used
      provider_selector = function(bufnr, filetype, buftype)
        return { "treesitter", "indent" }
      end,
      open_fold_hl_timeout = 400,
      close_fold_kinds_for_ft = { "imports", "comment" },
      preview = {
        win_config = {
          border = { "", "─", "", "", "", "─", "", "" },
          -- winhighlight = "Normal:Folded",
          winblend = 0,
        },
        mappings = {
          scrollU = "<C-u>",
          scrollD = "<C-d>",
          jumpTop = "z[",
          jumpBot = "z]",
        },
      },
    },
    init = function()
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    config = function(_, opts)
      local handler1 = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local totalLines = vim.api.nvim_buf_line_count(0)
        local foldedLines = endLnum - lnum
        local suffix = ("  %d %d%%"):format(foldedLines, foldedLines / totalLines * 100)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        local rAlignAppndx = math.max(math.min(vim.opt.textwidth["_value"], width - 1) - curWidth - sufWidth, 0)
        suffix = (" "):rep(rAlignAppndx) .. suffix
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end

      local handler2 = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (" 󰁂 %d "):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end

      opts["fold_virt_text_handler"] = handler1
      require("ufo").setup(opts)
      vim.keymap.set("n", "zK", function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          -- vim.lsp.buf.hover()
          vim.cmd([[ Lspsaga hover_doc ]])
        end
      end)
    end,
  },
  { "echasnovski/mini.ai", version = false, config = true, opts = {} },
  { "echasnovski/mini.align", version = false, config = true, opts = {} },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({})
    end,
  },
  {
    "tzachar/highlight-undo.nvim",
    opts = {
      duration = 300,
      undo = {
        hlgroup = "HighlightUndo",
        mode = "n",
        lhs = "u",
        map = "undo",
        opts = {},
      },
      redo = {
        hlgroup = "HighlightRedo",
        mode = "n",
        lhs = "<C-r>",
        map = "redo",
        opts = {},
      },
      highlight_for_count = true,
    },
  },
  {
    "mfussenegger/nvim-lint",
    enabled = false,
    config = function()
      vim.notify("Loading fortran linting", 3, { title = "LazyVim" })
      local lint = require("lint")

      local pattern = [[^([^:]+):(%d+):(%d+):%s+([^:]+):%s+(.*)$]]
      local groups = { "file", "lnum", "col", "severity", "message" }
      local severity_map = {
        ["error"] = vim.diagnostic.severity.ERROR,
        ["warning"] = vim.diagnostic.severity.WARN,
        ["performance"] = vim.diagnostic.severity.WARN,
        ["style"] = vim.diagnostic.severity.INFO,
        ["information"] = vim.diagnostic.severity.INFO,
      }
      local errorformat =
        "%-Ggfortran%.%#,%A%f:%l:%c:,%A%f:%l:,%C,%C%p%*[0123456789^],%Z%trror:\\ %m,,%Z%tarning:\\ %m,%C%.%#,%-G%.%#"
      local defaults = { ["source"] = "fortran" }
      lint.linters.gfortran = {
        name = "gfortran",
        cmd = "gfortran",
        args = {
          "-c",
          "-fsyntax-only",
          "-cpp",
          -- "-fdiagnostics-plain-output",
          "-Wunused-variable",
          "-Wunused-dummy-argument",
          "-Wmaybe-uninitialized",
          "-Wall",
          "-I",
          os.getenv("HOME") .. "/.easifem/easifem/lint/include/",
          "-I",
          os.getenv("HOME") .. "/.easifem/easifem/install/base/include/",
          "-I",
          os.getenv("HOME") .. "/.easifem/easifem/install/classes/include/",
          "-I",
          os.getenv("HOME") .. "/.easifem/easifem/install/fftw/include/",
          "-I",
          os.getenv("HOME") .. "/.easifem/easifem/install/gmsh/include/",
          "-I",
          os.getenv("HOME") .. "/.easifem/easifem/install/lapack95/include/",
          "-I",
          os.getenv("HOME") .. "/.easifem/easifem/install/lis/include/",
          "-I",
          os.getenv("HOME") .. "/.easifem/easifem/install/sparsekit/include/",
          "-I",
          os.getenv("HOME") .. "/.easifem/easifem/install/tomlf/include/toml-f/modules/",
          -- os.getenv("HOME") .. "/.easifem/easifem/install/arpack/include/arpack/",
          -- os.getenv("HOME") .. "/.easifem/easifem/install/superlu/include/",
          "-J",
          os.getenv("HOME") .. "/.easifem/easifem/lint/include/",
          "-DDEBUG_VER",
          "-DUSE_LUA",
          "-DUSE_BLAS95",
        }, -- args to pass to the linter
        ignore_exitcode = true, -- set this to true if you don't want to show error messages
        stream = "both", -- set this to "stdout" if the output is not an error, for example with luac
        -- parser = require("lint.parser").from_pattern(pattern, groups, severity_map, defaults),
        parser = require("lint.parser").from_errorformat(errorformat),
      }

      lint.linters_by_ft = { fortran = { "gfortran" } }
    end,
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    config = function()
      require("tiny-inline-diagnostic").setup()
    end,
  },
  {
    "danymat/neogen",
    cmd = "Neogen",
    keys = {
      {
        "<leader>cn",
        function()
          require("neogen").generate()
        end,
        desc = "Generate Annotations (Neogen)",
      },
    },
    opts = function(_, opts)
      if opts.snippet_engine ~= nil then
        return
      end

      local map = {
        ["LuaSnip"] = "luasnip",
        ["nvim-snippy"] = "snippy",
        ["vim-vsnip"] = "vsnip",
      }

      for plugin, engine in pairs(map) do
        if LazyVim.has(plugin) then
          opts.snippet_engine = engine
          return
        end
      end

      if vim.snippet then
        opts.snippet_engine = "nvim"
      end
    end,
  },
  -- copilot cmp source
  -- {
  --   "nvim-cmp",
  --   dependencies = {
  --     {
  --       "zbirenbaum/copilot-cmp",
  --       dependencies = "copilot.lua",
  --       opts = {},
  --       config = function(_, opts)
  --         local copilot_cmp = require("copilot_cmp")
  --         copilot_cmp.setup(opts)
  --         -- attach cmp source whenever copilot attaches
  --         -- fixes lazy-loading issues with the copilot cmp source
  --         LazyVim.lsp.on_attach(function(client)
  --           if client.name == "copilot" then
  --             copilot_cmp._on_insert_enter({})
  --           end
  --         end)
  --       end,
  --     },
  --   },
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     table.insert(opts.sources, 4, {
  --       name = "copilot",
  --       group_index = 1,
  --       priority = 50,
  --     })
  --   end,
  -- },
}
