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
  }
})

require('lspconfig').stylelint_lsp.setup({
  filetypes = { "css", "scss" }
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
