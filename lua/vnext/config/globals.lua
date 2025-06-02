-- disable .editorconfig settings
vim.g.editorconfig = false

-- Disable Autocommenting
vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])
