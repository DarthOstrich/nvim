-- require('config.lazy')
require('config.core.remap')
require('config.core.set')
require('config.core.autocommand')

-- nvim-tree
-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- disable .editorconfig settings
vim.g.editorconfig = false

-- empty setup using defaults
-- OR setup with some options
require("nvim-tree").setup({
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true
  }
})

-- END nvim-tree

-- setting here works but not in /after/plugin/emmet.lua...dunno why
vim.g.user_emmet_leader_key = ','

-- Disable Autocommenting
vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])



--[[
" Disable Autocommenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Syntax stuff
" This lets vim know that .prisma files should be graphql. 
" Stolen from vim-graphql/ftdetect/graphql.vim
au BufRead,BufNewFile *.prisma setfiletype graphql
" au BufNewFile,BufRead *.svelte :set filetype=html
--]]
