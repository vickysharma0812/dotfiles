return {

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "fortls",
        "marksman",
        "texlab",
        "ltex-ls",
        "clangd",
      },
    },
  },

  -- clangd
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        fortls = function(_, opts)
          opts.cmd = {
            -- fortran = {
            -- cmd = {
            "fortls",
            "--lowercase_intrinsics",
            "--source_dirs",
            os.getenv("easifem") .. "/easifem-base/src/**",
            os.getenv("easifem") .. "/easifem-classes/src/**",
            os.getenv("easifem") .. "/easifem-materials/src/**",
            os.getenv("easifem") .. "/easifem-kernels/src/**",
            os.getenv("easifem") .. "/StokesFlow/src/**",
            "--hover_signature",
            "--hover_language=fortran",
            "--use_signature_help",
            -- },
            -- },
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
          -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
          -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
          -- prefix = "icons",
        },
        severity_sort = true,

        -- virtual_text = false,
        -- show signs
        -- signs = {
        --   active = signs,
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

      autoformat = true,

    },
  },

  -- servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ltex = {
          settings = {
            ltex = {
              additionalRules = {
                enablePickyRules = true,
                motherTongue = 'en',
                languageModel = '~/ngram',
              },
              checkFrequency = "save",
              disabledRules = {
                ['en-US'] = { 'PROFANITY', 'PASSIVE_VOICE' },
                ['en-GB'] = { 'PROFANITY', 'PASSIVE_VOICE' },
              },
              -- dictionary = {
              --   ['en-US'] = words,
              --   ['en-GB'] = words,
              -- },
              -- filetypes ={ "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex" }
              -- filetypes = { "markdown", "tex", "mdx" }
              filetypes = { "tex" },
              enabled = { "latex", "tex", "bib" },
              -- enabled = { "latex", "tex", "bib", "md" },
            },
          }
        },
      },
    },
  },


}
