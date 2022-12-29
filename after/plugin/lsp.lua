local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  "cssls",
  "cssmodules_ls",
  'tsserver',
  'eslint',
  'sumneko_lua',
  'intelephense',
})

lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
