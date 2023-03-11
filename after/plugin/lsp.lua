local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  -- "cssls",
  -- "cssmodules_ls",
  'tsserver',
  'eslint',
  'lua_ls',
  'intelephense',
  'stylelint_lsp',
})
-- lsp.configure('tsserver', {
--   on_attach = function(client, bufnr)
--     print('hello tsserver')
--   end,
--   settings = {
--     completions = {
--       completeFunctionCalls = true
--     }
--   }
-- })

lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
