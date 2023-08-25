return {
  "folke/which-key.nvim",
  event = "VeryLazy",
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
    -- operators = { gc = "Comments" },
    key_labels = {
      -- override the label used to display some keys. It doesn't effect WK in any other way.
      -- For example:
      -- ["<space>"] = "SPC",
      -- ["<cr>"] = "RET",
      -- ["<tab>"] = "TAB",
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
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0,
    },
    layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      -- this is mostly relevant for key maps that start with a native binding
      -- most people should not need to change this
      i = { "j", "k" },
      v = { "j", "k" },
    },

    defaults = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    },

    mappings = {
      ["<leader>"] = { "<cmd>Telescope find_files<CR>", "Find files" },
      ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
      -- ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
      -- ["e"] = { "<cmd>NeoTreeFocusToggle<cr>", "Explorer" },
      ["E"] = { "<cmd>Neotree toggle<cr>", "Explorer" },
      -- ["E"] = { "<cmd>NeoTreeFloatToggle<cr>", "Explorer" },
      ["e"] = { "<cmd>Neotree toggle float<cr>", "Explorer" },
      -- ["q"] = { "<cmd>q!<CR>", "Quit" },
      -- ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
      ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
      ["."] = {
        "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        "Find files",
      },

      f = {
        name = "Files",
        f = { "<cmd>Telescope find_files<CR>", "Find files" },
        g = { "<cmd>Telescope git_files<CR>", "Find Git files" },
        w = { "<cmd>write<CR>", "Write file" },
        d = { "<cmd>Bdelete<CR>", "Close file" },
        -- o = { "<cmd>NvimTreeFindFile<CR>", "Reveal file in tree" },
        -- o = { "<cmd>NeoTreeReveal<CR>", "Reveal file in tree" },
        o = { "<cmd>Neotree reveal<CR>", "Reveal file in tree" },
        c = {
          name = "Config files",
          e = { ":e ~/.easifemrc <CR>", "EASIFEM" },
          z = { ":e ~/.zshrc <CR>", "zsh" },
          k = { ":e ~/.config/kitty/kitty.conf <CR>", "Kitty" },
          a = { ":e ~/.config/awesome/rc.lua <CR>", "Awesome" },
          v = { ":e ~/.config/nvim/init.lua <CR>", "Neovim" },
          s = { ":e ~/.config/nvim/lua/user/keymaps.lua <CR>", "Keymaps" },
          p = { ":e ~/.config/nvim/lua/user/plugins.lua <CR>", "Plugins" },
          w = { ":e ~/.config/nvim/lua/user/whichkey.lua <CR>", "Which key" },
          f = { ":e ~/.config/nvim/snippets/FortranFreeForm.json <CR>", "Fortran snippets" },
          m = { ":e ~/.config/nvim/snippets/markdown.json <CR>", "Markdown snippets" },
        },
      },
      -- X = {
      --   name = "Packer",
      --   c = { "<cmd>PackerCompile<cr>", "Compile" },
      --   i = { "<cmd>PackerInstall<cr>", "Install" },
      --   s = { "<cmd>PackerSync<cr>", "Sync" },
      --   S = { "<cmd>PackerStatus<cr>", "Status" },
      --   u = { "<cmd>PackerUpdate<cr>", "Update" },
      -- },
      x = {
        name = "Install",
        b = { "<cmd>lua _BASE_TOGGLE()<CR>", "Install base" },
        c = { "<cmd>lua _CLASS_TOGGLE()<CR>", "Install classes" },
      },

      g = {
        name = "Git",
        g = { "<cmd>lua vim.cmd.Git()<cr>", "Git" },
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
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        f = { "<cmd>Telescope git_files<cr>", "Find git files" },
        -- j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
        -- k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
        -- p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        -- r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        -- s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        -- u = {
        --   "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
        --   "Undo Stage Hunk",
        -- },
        -- R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        -- l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
      },
      L = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = {
          "<cmd>Telescope diagnostics bufnr=0<cr>",
          "Document Diagnostics",
        },
        w = {
          "<cmd>Telescope diagnostics<cr>",
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
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = {
          "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
          "Workspace Symbols",
        },
      },
      s = {
        name = "Search",
        p = { "<cmd>Telescope projects<cr>", "Search projects" },
        f = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
        -- f = { "<cmd>Telescope file_browser<cr>", "Telescope file browser" },
        e = { "<cmd>Telescope symbols<cr>", "Pick a Symbols" },
        -- b = {
        --   "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        --   "Search buffers",
        -- },
        b = {
          "<cmd>Neotree buffers right toggle<cr>",
          "Search buffers",
        },
        B = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        C = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        c = { "<cmd>Telescope commands<cr>", "Commands" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        H = { "<cmd>Telescope heading<cr>", "Documents headings" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = {
          "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
          "Workspace Symbols",
        },
        y = { "<cmd>Telescope neoclip<cr>", "Neoclip" },
      },
      P = {
        name = "Project",
        v = { "<cmd>NvimTreeToggle<CR>", "Open Explorer" },
        f = { "<cmd>Telescope find_files<CR>", "Find files" },
        b = { "<cmd>Telescope buffers<CR>", "Find buffers" },
        s = { "<cmd>Telescope grep_string<CR>", "Search text in project" },
        g = { "<cmd>Telescope live_grep<CR>", "Search string live_grep" },
        h = { "<cmd>Telescope help_tags<CR>", "Search help tags" },
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
        b = {
          "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
          "Find buffers",
        },
        l = { "<cmd>bnext<CR>", "Next buffer" },
        h = { "<cmd>bprevious<CR>", "Previous buffer" },
        d = { "<cmd>bdelete<CR>", "Close buffer" },
        -- f = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format buffer" },
        f = { "<cmd>GuardFmt<CR>", "Format buffer by using Guard" },
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
      T = {
        name = "Terminal",
        n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
        u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
        t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
        p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
        l = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Lazy" },
        b = { "<cmd>lua _BASE_TOGGLE()<cr>", "Base" },
        c = { "<cmd>lua _CLASS_TOGGLE()<cr>", "Classes" },
        f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
        h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
        v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
      },
      t = {
        name = "Toggle",
        t = { "<cmd>ToggleTerm direction=float<cr>", "Toggle terminal" },
        z = { "<cmd>ZenMode<cr>", "Toggle ZenMode" },
        h = { "<cmd>Twilight<cr>", "Toggle Twilight" },
        s = { "<cmd>Navbuddy<cr>", "Toggle Navbuddy" },
        o = { "<cmd>SymbolsOutline<cr>", "Toggle Symbol-outline" },
        x = {
          name = "TroubleToggle",
          d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Toggle document diagnostic" },
          D = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Toggle workspace diagnostic" },
          q = { "<cmd>TroubleToggle quickfix<cr>", "Toggle quickfix" },
          l = { "<cmd>TroubleToggle loclist<cr>", "Toggle loclist" },
          x = { "<cmd>TroubleToggle<cr>", "TroubleToggle" },
          R = { "<cmd>TroubleToggle lsp_references<cr>", "TroubleToggle lsp references" },
        },
      },
      n = {
        name = "Notifications",
        d = { "lua require('notify').dismiss({ silent = true, pending = true })", "Delete all Notifications" },
      },
    },
  },

  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.register(opts.mappings, opts.defaults)
  end,
}
