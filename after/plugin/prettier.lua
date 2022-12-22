vim.cmd([[let g:prettier#autoformat = 0]])
vim.cmd([[let g:prettier#config#bracket_spacing = 'true']])
--[[
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Prettier
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autosave
" disables autosave feature
let g:prettier#autoformat = 0

" print spaces between brackets
" Prettier default: true
let g:prettier#config#bracket_spacing = 'true'

" runs prettier on file formats
" autocmd BufWritePre *.html,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte PrettierAsync
au FileType css,scss let b:prettier_exec_cmd = "coc-stylelintplus"
--]]
