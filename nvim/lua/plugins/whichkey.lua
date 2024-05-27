return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
        enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        suggestions = 20, -- how many suggestions should be shown in the list?
      },
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
        windows = true, -- default bindings on <c-w>
        nav = true, -- misc bindings to work with windows
        z = true, -- bindings for folds, spelling and others prefixed with z
        g = true, -- bindings for prefixed with g
      },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments" },
    key_labels = {
      -- override the label used to display some keys. It doesn't effect WK in any other way.
      -- For example:
      -- ["<space>"] = "SPC",
      -- ["<cr>"] = "RET",
      -- ["<tab>"] = "TAB",
    },
    motion = {
      count = true,
    },
    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>", -- binding to scroll up inside the popup
    },
    window = {
      border = "rounded", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0,
      zindex = 1000,
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    show_keys = true,
    triggers = "auto", -- automatically setup triggers
    -- triggers = { "<leader>" }, -- or specify a list manually
    triggers_nowait = {
      -- marks
      "`",
      "'",
      "g`",
      "g'",
      -- registers
      '"',
      "<c-r>",
      -- spelling
      "z=",
    },
    triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      -- this is mostly relevant for key maps that start with a native binding
      -- most people should not need to change this
      i = { "j", "k" },
      v = { "j", "k" },
    },

    defaults = {
      mode = "n", -- NORMAL mode
      prefix = " ", -- "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },

    mappings = {
      ["<leader>"] = { "<cmd>FzfLua files<CR>", "Find files" },
      ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
      ["E"] = { "<cmd>Neotree toggle<cr>", "Explorer" },
      ["e"] = { "<cmd>Neotree toggle float<cr>", "Explorer" },
      ["."] = { "<cmd>JABSOpen<cr>", "Find files" },
      [","] = { "<cmd>FzfLua buffers<cr>", "Find buffers" },

      -- [","] = {
      --   "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_ivy{previewer = true})<cr>",
      --   "Find buffers",
      -- },

      f = {
        name = "Files",
        f = { "<cmd>FzfLua files resume=true<CR>", "Find files" },
        r = { "<cmd>FzfLua oldfiles resume=true<CR>", "Find files" },
        F = { "<cmd>FzfLua oldfiles resume=true<CR>", "Find files" },
        g = { "<cmd>FzfLua git_files<CR>", "Find Git files" },
        d = { "<cmd>Bdelete<CR>", "Close file" },
        o = { "<cmd>Neotree position=float reveal_force_cwd=true dir=%:p:h reveal_file=%:p<CR>", "Reveal file in tree" },
        w = { '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', "find current word spectre" },
        p = { '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', "find on current file" },
        S = { '<cmd>lua require("spectre").toggle()<CR>', "Toggle spectre" },
        c = {
          name = "Config files",
          a = { ":e ~/.config/awesome/rc.lua <CR>", "Awesome" },
          s = { ":e ~/.config/omf/init.fish <CR>", "Shell" },
          t = { ":e ~/.config/alacritty/alacritty.toml <CR>", "Alacritty toml" },
          T = { ":e ~/.config/alacritty/alacritty.yml <CR>", "Alacritty yml" },
          z = { ":e ~/.config/zellij/config.kdl <CR>", "Zellij" },
          f = { ":e ~/.config/nvim/snippets/easifem-fortran.json <CR>", "Fortran snippets" },
          m = { ":e ~/.config/nvim/snippets/easifem-markdown.json <CR>", "Markdown snippets" },
        },
      },
      x = {
        name = "EASIFEM dev",
        -- g = { "<cmd>CMakeGenerate<CR>", "Cmake configure" },
        -- b = { "<cmd>CMakeBuild()<CR>", "Cmake build" },
        -- r = { "<cmd>CMakeRun()<CR>", "Cmake run" },
      },

      o = {
        name = "Overseer",
        R = { "<cmd>OverseerRestartLast<CR>", "Overseer Restart last cmd" },
        d = { "<cmd>OverseerClose<CR>", "Overseer close" },
        o = { "<cmd>OverseerOpen<CR>", "Overseer open" },
        q = { "<cmd>OverseerQuickAction<CR>", "Overseer quick action" },
        r = { "<cmd>OverseerRun<CR>", "Overseer run" },
        t = { "<cmd>OverseerToggle<CR>", "Overseer toggle" },
        w = { "<cmd>WatchRun<CR>", "Watch run" },
      },

      g = {
        name = "Git",
        g = { "<cmd>Neogit<cr>", "NeoGit" },
        j = { "<cmd>Gitsigns next_hunk<cr>", "Next Hunk" },
        k = { "<cmd>Gitsigns prev_hunk<cr>", "Prev Hunk" },
        p = { "<cmd>Gitsigns preview_hunk_inline<cr>", "Preview Hunk Inline" },
        P = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
        r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
        s = { "<cmd>Gitsigns stage_hunk<cr>", "Stage Hunk" },
        u = {
          "<cmd>Gitsigns undo_stage_hunk<cr>",
          "Undo Stage Hunk",
        },
        S = { "<cmd>Gitsigns stage_buffer<cr>", "Stage Buffer" },
        R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer" },
        l = { "<cmd>Gitsigns blame_line<cr>", "Blame" },
        d = { "<cmd>Gitsigns diffthis<cr>", "Diff" },
        D = { "<cmd>lua require 'gitsigns'.diffthis('~')<cr>", "Diff" },
        o = { "<cmd>FzfLua git_status<cr>", "Open changed file" },
        b = { "<cmd>FzfLua git_branches<cr>", "Checkout branch" },
        c = { "<cmd>FzfLua git_commits<cr>", "Checkout commit" },
        f = { "<cmd>FzfLua git_files<cr>", "Find git files" },
      },
      c = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = {
          "<cmd>FzfLua diagnostics_document<cr>",
          "Document Diagnostics",
        },
        w = {
          "<cmd>FzfLua diagnostics_workspace<cr>",
          "Workspace Diagnostics",
        },
        f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
        j = {
          "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
          "Next Diagnostic",
        },
        k = {
          "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
          "Prev Diagnostic",
        },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        -- s = {
        --   "<cmd>FzfLua lsp_workspace_symbols<cr>",
        --   "Workspace Symbols",
        -- },
        s = {
          "<cmd>Lspsaga outline<cr>",
          "Symbols outline (Lspsaga)",
        },
        S = {
          "<cmd>FzfLua lsp_live_workspace_symbols<cr>",
          "Live Workspace Symbols",
        },
      },
      s = {
        name = "Search",
        B = { "<cmd>lua require('fzf-lua').lines()<CR>", "fzf find in open buffer lines" },
        C = { "<cmd>FzfLua colorschemes<cr>", "Colorscheme" },
        H = { "<cmd>Telescope heading<cr>", "Documents headings" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        R = { "<cmd>FzfLua registers<cr>", "Registers" },
        S = { "<cmd>FzfLua lsp_workspace_symbols<cr>", "Workspace Symbols" },
        b = { "<cmd>lua require('fzf-lua').blines()<CR>", "fzf find in current buffer lines" },
        c = { "<cmd>FzfLua commands<cr>", "Commands" },
        d = { "<cmd>FzfLua lsp_document_diagnostics<cr>", "Docment diagnostics" },
        e = { "<cmd>Telescope symbols<cr>", "Pick a Symbols" },
        f = { "<cmd>FzfLua grep_curbuf<cr>", "Grep in current buffer" },
        g = { "<cmd>FzfLua grep_project<cr>", "Grep project" },
        h = { "<cmd>FzfLua helptags<cr>", "Find Help" },
        k = { "<cmd>FzfLua keymaps<cr>", "Keymaps" },
        l = { "<cmd>FzfLua blines<cr>", "current buffer lines" },
        p = { "<cmd>Telescope projects<cr>", "Search projects" },
        s = { "<cmd>FzfLua lsp_document_symbols<cr>", "Document Symbols" },
        t = { "<cmd>FzfLua tabs<cr>", "Open tabs" },
        w = { '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', "Search current word" },
        -- x = { '<cmd>FzfLua quickfix<cr>', "quickfix list" },
        x = {
          "<cmd>lua require('fzf-lua').quickfix({winopts = { preview = { hidden = \"hidden\", }, }}) <cr>",
          "quickfix list",
        },
        y = { "<cmd>FzfLua loclist<cr>", "location list" },
      },
      P = {
        name = "Project",
        v = { "<cmd>NvimTreeToggle<CR>", "Open Explorer" },
        f = { "<cmd>FzfLua files<CR>", "Find files" },
        b = { "<cmd>FzfLua buffers<CR>", "Find buffers" },
        s = { "<cmd>FzfLua grep_project<CR>", "Search text in project" },
        g = { "<cmd>FzfLua live_grep<CR>", "Search string live_grep" },
        h = { "<cmd>Fzf tags<CR>", "Search tags" },
      },
      B = {
        name = "Tab",
        n = { "<cmd>tabnew<CR>", "New Tab" },
        d = { "<cmd>tabclose<CR>", "Close Tab" },
        l = { "<cmd>tabnext<CR>", "Next Tab" },
        h = { "<cmd>tabprevious<CR>", "Previous Tab" },
      },
      b = {
        name = "Buffer",
        l = { "<cmd>bnext<CR>", "Next buffer" },
        h = { "<cmd>bprevious<CR>", "Previous buffer" },
        -- d = { "<cmd>bdelete<CR>", "Close buffer" },
        d = {
          function(n)
            require("mini.bufremove").delete(n, false)
          end,
          "Close buffer",
        },
        f = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format buffer" },
        -- f = { "<cmd>GuardFmt<CR>", "Format buffer by using Guard" },
        w = { "<cmd>lua vim.cmd.w()<CR>", "Save buffer" },
      },
      w = {
        name = "Window",
        h = { "<C-w>h", "Go to left window" },
        l = { "<C-w>l", "Go to right window" },
        j = { "<C-w>j", "Go to down window" },
        k = { "<C-w>k", "Go to up window" },
        d = { "<cmd>close<CR>", "Close window" },
        n = { "<cmd>new<CR>", "New window" },
        N = { "<cmd>vnew<CR>", "Vertical new window" },
        s = {
          name = "Window split",
          h = { "<cmd>vsplit<CR>", "Split window to left" },
          l = { "<cmd>vsplit<CR>", "Split window to right" },
          j = { "<cmd>split<CR>", "Split window to down" },
          k = { "<cmd>split<CR>", "Split window to up" },
        },
      },
      t = {
        name = "Toggle",
        -- t = { "<cmd>TransparentToggle<cr>", "Toggle transparent" },
        --
        n = { "<cmd>tabnew<CR>", "New Tab" },
        d = { "<cmd>tabclose<CR>", "Close Tab" },
        l = { "<cmd>tabnext<CR>", "Next Tab" },
        h = { "<cmd>tabprevious<CR>", "Previous Tab" },
        t = { "<cmd>ToggleTerm direction=float<cr>", "Toggle terminal" },
        b = {
          "<cmd>Neotree source=buffers reveal=true action=focus position=float toggle=true<cr>",
          "Toggle buffer to right",
        },
        z = { "<cmd>ZenMode<cr>", "Toggle ZenMode" },
        s = { "<cmd>SymbolsOutline<cr>", "Toggle Symbol-outline" },
        x = {
          name = "TroubleToggle",
          d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Toggle document diagnostic" },
          D = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Toggle workspace diagnostic" },
          q = { "<cmd>TroubleToggle quickfix<cr>", "Toggle qickfix" },
          l = { "<cmd>TroubleToggle loclist<cr>", "Toggle loclist" },
          x = { "<cmd>TroubleToggle<cr>", "TroubleToggle" },
          R = { "<cmd>TroubleToggle lsp_references<cr>", "TroubleToggle lsp references" },
        },
      },
      z = {
        name = "Zen mode",
        z = { "<cmd>ZenMode<cr>", "Toggle ZenMode" },
        R = { "lua require('ufo').openAllFolds<cr>", "Open all folds" },
        r = { "lua require('ufo').openFoldsExceptKinds<cr>", "Open all folds except kinds" },
        M = { "lua require('ufo').closeAllFolds<cr>", "Close all folds" },
      },
      n = {
        name = "Notifications",
        d = { "lua require('notify').dismiss({ silent = true, pending = true })", "Delete all Notifications" },
      },
      h = {
        name = "harpoon",
        a = {
          function()
            require("harpoon"):list():add()
          end,
          "add file",
        },
        r = {
          function()
            require("harpoon"):list():remove()
          end,
          "remove a file",
        },
        m = {
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          "harpoon menu",
        },
        n = {
          function()
            require("harpoon"):list():next()
          end,
          "next file",
        },
        p = {
          function()
            require("harpoon"):list():prev()
          end,
          "previous file",
        },
        ["1"] = {
          function()
            require("harpoon"):list():select(1)
          end,
          "file 1",
        },
        ["2"] = {
          function()
            require("harpoon"):list():select(2)
          end,
          "file 2",
        },
        ["3"] = {
          function()
            require("harpoon"):list():select(3)
          end,
          "file 3",
        },
        ["4"] = {
          function()
            require("harpoon"):list():select(4)
          end,
          "file 4",
        },
        ["5"] = {
          function()
            require("harpoon"):list():select(5)
          end,
          "file 5",
        },
        ["6"] = {
          function()
            require("harpoon"):list():select(6)
          end,
          "file 6",
        },
      },
    },
  },

  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.mappings, opts.defaults)
  end,
}
