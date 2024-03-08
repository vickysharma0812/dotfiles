return {
  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load({
          exclude = { "latex", "fortran", "markdown" },
        })
      end,
    },
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-omni",
    },

    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })

      require("luasnip/loaders/from_vscode").lazy_load({
        paths = "./snippets",
      })

      -- opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })

      --   פּ ﯟ   some other good icons
      local kind_icons = {
        Text = " ",
        Method = "m ",
        Function = "󰊕 ",
        Constructor = " ",
        Field = " ",
        Variable = "󰆧 ",
        Class = "󰌗 ",
        Interface = " ",
        Module = " ",
        Property = " ",
        Unit = " ",
        Value = "󱓞 ",
        Enum = " ",
        Keyword = "󰹻 ",
        Snippet = " ",
        Color = "󰌁 ",
        File = "󰈙 ",
        Reference = " ",
        Folder = " ",
        EnumMember = " ",
        Constant = "󰏿 ",
        Struct = " ",
        Event = " ",
        Operator = "󰆕 ",
        TypeParameter = "󰊄 ",
      }

      opts.formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          -- Kind icons
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
          -- This concatonates the icons with the name of the item kind
          vim_item.menu = ({
            -- omni = "[VimTex]",
            omni = (vim.inspect(vim_item.menu):gsub('%"', "")),
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]
          return vim_item
        end,
      }

      opts.sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "omni" },
        { name = "buffer" },
        { name = "path" },
        { name = "emoji" },
      }

      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }
    end,
  },
}
