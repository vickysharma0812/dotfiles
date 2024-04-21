return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "fortls",
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
            os.getenv("easifem") .. "/easifem-elasticity/src/**",
            os.getenv("EASIFEM_SOURCE_DIR") .. "/easifem/extpkgs/toml-f/src/**",
            os.getenv("easifem") .. "/StokesFlow/src/**",
            "--hover_signature",
            "--hover_language=fortran",
            "--use_signature_help",
          }
        end,
      },
      -- servers = {
      --   fortls = {
      --     on_attach = function(client, bufnr)
      --       -- your other on_attach code
      --       -- for example, set keymaps here, like
      --       -- vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
      --       -- (see below code block for more details)
      --       local navbuddy = require("nvim-navbuddy")
      --       navbuddy.attach(client, bufnr)
      --     end,
      --   },
      -- },
    },
  },
  -- {
  --   "mfussenegger/nvim-lint",
  --   config = function()
  --     vim.notify("Loading fortran linting", 3, { title = "LazyVim" })
  --     local lint = require("lint")
  --
  --     local pattern = [[^([^:]+):(%d+):(%d+):%s+([^:]+):%s+(.*)$]]
  --     local groups = { "file", "lnum", "col", "code", "severity", "message" }
  --     local severity_map = {
  --       ["error"] = vim.diagnostic.severity.ERROR,
  --       ["warning"] = vim.diagnostic.severity.WARN,
  --       ["performance"] = vim.diagnostic.severity.WARN,
  --       ["style"] = vim.diagnostic.severity.INFO,
  --       ["information"] = vim.diagnostic.severity.INFO,
  --     }
  --     local defaults = { ["source"] = "fortran" }
  --     lint.linters.gfortran = {
  --       name = "gfortran",
  --       cmd = "gfortran",
  --       args = {
  --         "-c",
  --         "-Wunused-variable",
  --         "-Wunused-dummy-argument",
  --         "-Wall",
  --         "-I",
  --         os.getenv("HOME") .. "/.easifem/install/easifem/extpkgs/include/",
  --         os.getenv("HOME") .. "/.easifem/install/easifem/extpkgs/include/toml-f/modules/",
  --         os.getenv("HOME") .. "/.easifem/install/easifem/base/include/",
  --         os.getenv("HOME") .. "/.easifem/install/easifem/classes/include/",
  --         os.getenv("HOME") .. "/.easifem/ide/include/",
  --         "-J",
  --         os.getenv("HOME") .. "/.easifem/ide/include/",
  --       }, -- args to pass to the linter
  --       ignore_exitcode = false, -- set this to true if you don't want to show error messages
  --       stream = "both", -- set this to "stdout" if the output is not an error, for example with luac
  --       parser = require("lint.parser").from_pattern(pattern, groups, severity_map, defaults),
  --     }
  --
  --     lint.linters_by_ft = { fortran = { "gfortran" } }
  --   end,
  -- },

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

  -- Cmake setup for easifem
  --
  {
    "Civitasv/cmake-tools.nvim",
    lazy = true,
    init = function()
      local loaded = false
      local function check()
        local cwd = vim.uv.cwd()
        if vim.fn.filereadable(cwd .. "/CMakeLists.txt") == 1 then
          require("lazy").load({ plugins = { "cmake-tools.nvim" } })
          loaded = true
        end
      end
      check()
      vim.api.nvim_create_autocmd("DirChanged", {
        callback = function()
          if not loaded then
            check()
          end
        end,
      })
    end,
    opts = {
      cmake_command = "cmake",
      -- this is used to specify cmake command path
      ctest_command = "ctest",
      -- this is used to specify ctest command path
      cmake_regenerate_on_save = true,
      -- auto generate when save CMakeLists.txt
      cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
      -- this will be passed when invoke `CMakeGenerate`
      cmake_build_options = {}, -- this will be passed when invoke `CMakeBuild`
      -- support macro expansion:
      --       ${kit}
      --       ${kitGenerator}
      --       ${variant:xx}
      cmake_build_directory = "out/${variant:buildType}",
      -- this is used to specify generate directory for cmake, allows macro expansion, relative to vim.loop.cwd()
      cmake_soft_link_compile_commands = true,
      -- this will automatically make a soft link from compile commands file to project root dir
      cmake_compile_commands_from_lsp = false,
      -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
      cmake_kits_path = nil,
      -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
      cmake_variants_message = {
        short = { show = true },
        -- whether to show short message
        long = { show = true, max_length = 40 },
        -- whether to show long message
      },
      cmake_dap_configuration = { -- debug settings for cmake
        name = "cpp",
        type = "codelldb",
        request = "launch",
        stopOnEntry = false,
        runInTerminal = true,
        console = "integratedTerminal",
      },
      cmake_executor = {
        -- executor to use
        -- executor is to execute the program
        name = "terminal",
        -- name of the executor
        opts = {},
        -- the options the executor will get, possible values depend on the executor type. See `default_opts` for possible values.
        default_opts = {
          -- a list of default and possible values for executors
          quickfix = {
            show = "always",
            -- "always", "only_on_error"
            position = "belowright",
            -- "vertical", "horizontal", "leftabove", "aboveleft", "rightbelow",
            -- "belowright", "topleft", "botright", use `:h vertical` for example to see help on them
            size = 10,
            encoding = "utf-8",
            -- if encoding is not "utf-8", it will be converted to "utf-8" using `vim.fn.iconv`
            auto_close_when_success = true,
            -- typically, you can use it with the "always" option;
            -- it will auto-close the quickfix buffer if the execution is successful.
          },
          toggleterm = {
            direction = "float",
            -- 'vertical' | 'horizontal' | 'tab' | 'float'
            close_on_exit = false,
            -- whether close the terminal when exit
            auto_scroll = true,
            -- whether auto scroll to the bottom
          },
          overseer = {
            new_task_opts = {
              strategy = {
                "toggleterm",
                direction = "horizontal",
                autos_croll = true,
                quit_on_exit = "success",
              },
            },
            -- options to pass into the `overseer.new_task` command
            on_new_task = function(task)
              require("overseer").open({ enter = false, direction = "right" })
            end,
            -- a function that gets overseer.Task when it is created, before calling `task:start`
          },
          terminal = {
            name = "Main Terminal",
            prefix_name = "[CMakeTools]: ",
            -- This must be included and must be unique, otherwise the terminals will not work.
            -- Do not use a simple spacebar " ", or any generic name
            split_direction = "horizontal",
            -- "horizontal", "vertical"
            split_size = 11,

            -- Window handling
            single_terminal_per_instance = true,
            -- Single viewport, multiple windows
            single_terminal_per_tab = true,
            -- Single viewport per tab
            keep_terminal_static_location = true,
            -- Static location of the viewport if avialable

            -- Running Tasks
            start_insert = false,
            -- If you want to enter terminal with :startinsert upon using :CMakeRun
            focus = false,
            -- Focus on terminal when cmake task is launched.
            do_not_add_newline = false,
            -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
          },
          -- terminal executor uses the values in cmake_terminal
        },
      },
      cmake_runner = {
        -- runner to use
        -- runner is used for building libs
        name = "terminal", -- name of the runner
        opts = {}, -- the options the runner will get, possible values depend on the runner type. See `default_opts` for possible values.
        default_opts = {
          -- a list of default and possible values for runners
          quickfix = {
            show = "always", -- "always", "only_on_error"
            position = "belowright", -- "bottom", "top"
            size = 10,
            encoding = "utf-8",
            auto_close_when_success = true, -- typically, you can use it with the "always" option; it will auto-close the quickfix buffer if the execution is successful.
          },
          toggleterm = {
            direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
            close_on_exit = false, -- whether close the terminal when exit
            auto_scroll = true, -- whether auto scroll to the bottom
          },
          overseer = {
            new_task_opts = {
              strategy = {
                "toggleterm",
                direction = "horizontal",
                autos_croll = true,
                quit_on_exit = "success",
              },
            }, -- options to pass into the `overseer.new_task` command
            on_new_task = function(task) end, -- a function that gets overseer.Task when it is created, before calling `task:start`
          },
          terminal = {
            name = "Main Terminal",
            prefix_name = "[CMakeTools]: ",
            -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
            split_direction = "horizontal",
            -- "horizontal", "vertical"
            split_size = 11,

            -- Window handling
            single_terminal_per_instance = true,
            -- Single viewport, multiple windows
            single_terminal_per_tab = true,
            -- Single viewport per tab
            keep_terminal_static_location = true,
            -- Static location of the viewport if avialable

            -- Running Tasks
            start_insert = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
            focus = false, -- Focus on terminal when cmake task is launched.
            do_not_add_newline = false, -- Do not hit enter on the command inserted when using :CMakeRun, allowing a chance to review or modify the command before hitting enter.
          },
        },
      },
      cmake_notifications = {
        runner = { enabled = true },
        executor = { enabled = true },
        spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }, -- icons used for progress display
        refresh_rate_ms = 100, -- how often to iterate icons
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
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
        auto_trigger = false,
        debounce = 75,
        keymap = {
          accept = "<M-l>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
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
    },
  },
  -- copilot cmp source
  {
    "nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        dependencies = "copilot.lua",
        opts = {},
        config = function(_, opts)
          local copilot_cmp = require("copilot_cmp")
          copilot_cmp.setup(opts)
          -- attach cmp source whenever copilot attaches
          -- fixes lazy-loading issues with the copilot cmp source
          LazyVim.lsp.on_attach(function(client)
            if client.name == "copilot" then
              copilot_cmp._on_insert_enter({})
            end
          end)
        end,
      },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, 4, {
        name = "copilot",
        group_index = 1,
        priority = 100,
      })
    end,
  },
  -- codeium cmp source
  -- {
  --   "Exafunction/codeium.nvim",
  --   cmd = "Codeium",
  --   build = ":Codeium Auth",
  --   opts = {},
  --   config = function()
  --     -- Change '<C-g>' here to any keycode you like.
  --     vim.keymap.set("i", "<C-g>", function()
  --       return vim.fn["codeium#Accept"]()
  --     end, { expr = true, silent = true })
  --     vim.keymap.set("i", "<c-;>", function()
  --       return vim.fn["codeium#CycleCompletions"](1)
  --     end, { expr = true, silent = true })
  --     vim.keymap.set("i", "<c-,>", function()
  --       return vim.fn["codeium#CycleCompletions"](-1)
  --     end, { expr = true, silent = true })
  --     vim.keymap.set("i", "<c-x>", function()
  --       return vim.fn["codeium#Clear"]()
  --     end, { expr = true, silent = true })
  --     vim.cmd([[let g:codeium_filetypes = {
  --                   \ "go": v:true,
  --                   \ "markdown": v:true,
  --                   \ "fortran": v:true,
  --                   \ "python": v:true,
  --                   \ }]])
  --   end,
  -- },
  --
  -- -- codeium cmp source
  -- {
  --   "nvim-cmp",
  --   dependencies = {
  --     "Exafunction/codeium.nvim",
  --   },
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     table.insert(opts.sources, 1, {
  --       name = "codeium",
  --     })
  --   end,
  -- },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      position = "bottom", -- position of the list can be: bottom, top, left, right
      height = 10, -- height of the trouble list when position is top or bottom
      width = 50, -- width of the list when position is left or right
      icons = true, -- use devicons for filenames
      mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
      severity = nil, -- nil (ALL) or vim.diagnostic.severity.ERROR | WARN | INFO | HINT
      fold_open = "", -- icon used for open folds
      fold_closed = "", -- icon used for closed folds
      group = true, -- group results by file
      padding = true, -- add an extra new line on top of the list
      cycle_results = true, -- cycle item list when reaching beginning or end of list
      action_keys = { -- key mappings for actions in the trouble list
        -- map to {} to remove a mapping, for example:
        -- close = {},
        close = "q", -- close the list
        cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
        refresh = "r", -- manually refresh
        jump = { "<cr>", "<tab>", "<2-leftmouse>" }, -- jump to the diagnostic or open / close folds
        open_split = { "<c-x>" }, -- open buffer in new split
        open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
        open_tab = { "<c-t>" }, -- open buffer in new tab
        jump_close = { "o" }, -- jump to the diagnostic and close the list
        toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
        switch_severity = "s", -- switch "diagnostics" severity filter level to HINT / INFO / WARN / ERROR
        toggle_preview = "P", -- toggle auto_preview
        hover = "K", -- opens a small popup with the full multiline message
        preview = "p", -- preview the diagnostic location
        open_code_href = "c", -- if present, open a URI with more information about the diagnostic error
        close_folds = { "zM", "zm" }, -- close all folds
        open_folds = { "zR", "zr" }, -- open all folds
        toggle_fold = { "zA", "za" }, -- toggle fold of current file
        previous = "k", -- previous item
        next = "j", -- next item
        help = "?", -- help menu
      },
      multiline = true, -- render multi-line messages
      indent_lines = true, -- add an indent guide below the fold icons
      win_config = { border = "single" }, -- window configuration for floating windows. See |nvim_open_win()|.
      auto_open = false, -- automatically open the list when you have diagnostics
      auto_close = false, -- automatically close the list when you have no diagnostics
      auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
      auto_fold = false, -- automatically fold a file trouble list at creation
      auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
      include_declaration = { "lsp_references", "lsp_implementations", "lsp_definitions" }, -- for the given modes, include the declaration of the current symbol in the results
      signs = {
        -- icons / text used for a diagnostic
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "",
      },
      use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
    },
  },
}
