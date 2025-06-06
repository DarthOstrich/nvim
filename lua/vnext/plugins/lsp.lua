return {
  {
    'williamboman/mason.nvim',
    lazy = false,
    opts = {},
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          -- my config
          ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        }),
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
      })
    end
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    init = function()
      -- Reserve a space in the gutter
      -- This will avoid an annoying layout shift in the screen
      vim.opt.signcolumn = 'yes'
    end,
    config = function()
      -- Add custom LspRestartAll command
      vim.api.nvim_create_user_command('LspRestartAll', function()
        local clients = vim.lsp.get_clients()
        for _, client in ipairs(clients) do
          vim.cmd('LspRestart ' .. client.id)
        end
      end, {})

      local lsp_defaults = require('lspconfig').util.default_config

      -- Add cmp_nvim_lsp capabilities settings to lspconfig
      -- This should be executed before you configure any language server
      lsp_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lsp_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
      )

      -- LspAttach is where you enable features that only work
      -- if there is a language server active in the file
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
          vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
          vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
          vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
          vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
          vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
          vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
          vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
          vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
          vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
          -- diagnostic window
          vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
        end,
      })

      require('mason-lspconfig').setup({
        ensure_installed = {
          -- 'angularls@18.2.0',
          'emmet_ls',
          -- 'lua_ls',
          -- 'stylelint_lsp',
          -- 'tailwindcss',
          -- 'ts_ls',
        },
        handlers = {
          -- this first function is the "default handler"
          -- it applies to every language server without a "custom handler"
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,

          -- CONFIG TAKEN FROM V1
          stylelint_lsp = function()
            require('lspconfig').stylelint_lsp.setup({
              filetypes = { "css", "scss" },
              settings = {
                stylelintplus = {
                  -- see available options in stylelint-lsp documentation
                }
              }
            })
          end,
          tailwindcss = function()
            require('lspconfig').tailwindcss.setup({
              -- includeLanguages = { "css", "scss", "ts" },
              settings = {
                includeLanguages = { "css", "scss", "ts" },
                -- wrapperClasses doesn't work because it expects it to be wrapperClases="classnames"
                -- tailwindCSS = {
                --   classAttributes = {
                --     "class",
                --     "className",
                --     "class:list",
                --     "classList",
                --     "ngClass",
                --     "wrapperClasses"
                --   }
                -- }
              }
              -- experimental = {
              --   classRegex = {
              --     regexPattern
              --   }
              -- }
            })
          end,
          -- END CONFIG TAKEN FROM V1
        }
      })
    end
  }
}
