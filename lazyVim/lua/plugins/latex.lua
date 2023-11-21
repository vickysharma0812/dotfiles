return {
  -- NOTE: if you do not need syntax highlighting
  -- please activate setting below
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     if type(opts.ensure_installed) == "table" then
  --       vim.list_extend(opts.ensure_installed, { "bibtex", "latex" })
  --     end
  --     if type(opts.highlight.disable) == "table" then
  --       vim.list_extend(opts.highlight.disable, { "latex" })
  --     else
  --       opts.highlight.disable = { "latex" }
  --     end
  --   end,
  -- },
  {
    "lervag/vimtex",
    lazy = false, -- lazy-loading will disable inverse search
    -- dependencies = { "Konfekt/FastFold" },
    config = function()
      vim.api.nvim_create_autocmd({ "FileType" }, {
        group = vim.api.nvim_create_augroup("lazyvim_vimtex_conceal", { clear = true }),
        pattern = { "bib", "tex" },
        callback = function()
          local wk = require("which-key")
          wk.register({
            v = {
              name = "+vimtex",
              a = { "<cmd>Telescope bibtex<CR>", "add citation (from bib)" },
              b = { "<cmd>VimtexCompile<CR>", "build" },
              c = { "<cmd>VimtexCountWords!<CR>", "count" },
              i = { "<cmd>VimtexTocOpen<CR>", "index" },
              v = { "<cmd>VimtexView<CR>", "view" },
              d = { "<cmd>VimtexClean<CR>", "delete aux" },
              l = { "<cmd>VimtexErrors<CR>", "log of errors" },
              m = { "<plug>(vimtex-context-menu)", "vimtex menu" },
              r = { "<plug>(vimtex-doc-package)", "read vimtex doc" },
              e = {
                function()
                  -- check vimtex auxiliary direcotry variable
                  local out_dir = os.getenv("VIMTEX_OUTPUT_DIRECTORY")
                  if type(out_dir) == "string" then
                    local do_exist, _ = os.rename(out_dir, out_dir)
                    if do_exist == true then
                      vim.cmd("! bibexport -o %:r.bib ./" .. out_dir .. "/%:r.aux")
                      return
                    end
                  end
                  vim.cmd("! bibexport -o %:r.bib %:r.aux")
                end,
                "Make bib file",
              },
              f = { -- Indentation format by latexindent.pl
                function()
                  vim.cmd("normal! w") -- before format, make sure that the file is latest
                  if not vim.bo.filetype == "tex" then
                    vim.notify("Only default save was done (no format)", 3, { title = "This is not TeX file" })
                  end
                  local out_dir = os.getenv("VIMTEX_OUTPUT_DIRECTORY")
                  if type(out_dir) == "string" then
                    local do_exist, _ = os.rename(out_dir, out_dir)
                    if do_exist then
                      -- NOTE: -c option determine the location of indent.log file
                      -- -o specifies the outputfile without backup
                      -- if you want the backup file use -w or -ww option
                      vim.cmd("! latexindent -c " .. out_dir .. " -s -o % %")
                      return
                    end
                  end
                  vim.cmd("! latexindent -s -o % %")
                end,
                "format save (no backup)",
              },
            },
          }, { prefix = "<leader>", mode = { "n" } })
          vim.wo.conceallevel = 2
        end,
      })
      vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
      vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
      -- PDF Viewer:
      -- http://manpages.ubuntu.com/manpages/trusty/man5/zathurarc.5.html
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_quickfix_mode = 0

      vim.g.vimtex_log_ignore = {
        "Underfull",
        "Overfull",
        "specifier changed to",
        "Token not allowed in a PDF string",
      }

      vim.g.vimtex_context_pdf_viewer = "skim"
      vim.g.vimtex_complete_enabled = 1
      --
      -- Ignore mappings
      -- vim.g["vimtex_mappings_enabled"] = 0
      -- Fold
      -- NOTE: I prefer to vim-tex-fold now
      -- vim.g.vimtex_fold_enabled = 1
      -- vim.g.vimtex_fold_types = {
      --   preamble = { enabled = 1 },
      --   sections = { sections = { "chapter", "section" } },
      --   envs = { whitelist = { "table" } },
      --   comments = { enabled = 1 },
      -- }
      -- Auto format
      -- vim.g.vimtex_format_enabled = 1
      -- Auto Indent
      -- vim.g["vimtex_indent_enabled"] = 0
      -- Syntax highlighting
      -- vim.g.vimtex_syntax_enabled = 1
      -- Error suppression:
      -- https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt
      -- vim.g['vimtex_compiler_progname'] = 'nvr'
      -- vim.g['vimtex_complete_close_braces'] = 1
    end,
  },
  {
    "matze/vim-tex-fold",
    lazy = true,
    ft = { "tex", "latex", "bib" },
    init = function()
      -- {{{~}}} is also folded
      vim.g.tex_fold_allow_marker = 1
    end,
  },
}
