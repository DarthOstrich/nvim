local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {
    'tsserver',
    'eslint',
    'lua_ls',
    'intelephense',
    'stylelint_lsp',
  },
  handlers = {
    lsp_zero.default_setup,
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
  }
})


local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format({details = true})

cmp.setup({
  -- default keybindings for nvim-cmp are here:
  -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/README.md#keybindings-1
  mapping = cmp.mapping.preset.insert({
    -- confirm completion item
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),

    -- trigger completion menu
    -- doesn't work if its not disabled
    -- ['<C-Space>'] = cmp.mapping.complete(),
  }),
  --- (Optional) Show source name in completion menu
  formatting = cmp_format,
})

-- diagnostics
-- lsp_zero.set_sign_icons({
--   error = '✘',
--   warn = '▲',
--   hint = '⚑',
--   info = ''
-- })

vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
})
