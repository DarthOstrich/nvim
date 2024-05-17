"Auto install Plug https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
" This doesn't work for some reason
" Need to install Plug first before this init file will work.
if empty(glob('~/.config/nvim/plugged/plug.vim'))
  silent !curl -fLo ~/.config/nvim/plugged/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set rtp+=/opt/homebrew/opt/fzf "Fuzzy finder, installed via homebrew



call plug#begin('~/.config/nvim/plugged')

" Themes
" Current Themes
" Plug 'bluz71/vim-nightfly-guicolors'
" Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'drewtempelmeyer/palenight.vim'

" Ancient Themes
" Plug 'mhartington/oceanic-next'
" Plug 'haishanh/night-owl.vim'
" Plug 'morhetz/gruvbox'
" Plug 'jnurmine/zenburn' "Theme plugin

" Plug 'ryanoasis/vim-devicons' "Icons for filetypes
Plug 'vim-airline/vim-airline' "Status bar
Plug 'vim-airline/vim-airline-themes' "Applicable themes
Plug 'ap/vim-css-color' "  color name highlighter

" Language Syntax Support
Plug 'pangloss/vim-javascript' "JS highlighting
Plug 'mxw/vim-jsx' "JSX syntax highlighting
Plug 'jparise/vim-graphql' "graphql syntax highlighting
Plug 'digitaltoad/vim-pug' "Pug highlighting
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'leafOfTree/vim-svelte-plugin'

" Tools
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'jiangmiao/auto-pairs' "Autocomplete brackets. 
Plug '/usr/local/opt/fzf'
" Plug 'junegunn/fzf.vim'
Plug 'tomtom/tcomment_vim'
Plug 'jdhao/better-escape.vim' " Fix jk
" Plug 'tpope/vim-commentary'
" Plug 'scrooloose/nerdcommenter'
" Git tools
Plug 'tpope/vim-fugitive' 
Plug 'mhinz/vim-signify'

Plug 'tpope/vim-surround'
" Plug 'metakirby5/codi.vim'
" Plug 'frazrepo/vim-rainbow' "Disables normal syntax highlighting...stupid
Plug 'mattn/emmet-vim' "A bit annoying because it takes over my Tab key
" Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'} "Nerdtree
Plug 'neoclide/coc.nvim', {'branch': 'release'} "autocompletion

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Coc extension list
let g:coc_global_extensions = [
      \ 'coc-ultisnips',
      \ 'coc-snippets',
      \ 'coc-explorer',
      \ 'coc-vimlsp',
      \ 'coc-tsserver',
      \ 'coc-svelte',
      \ 'coc-json',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-stylelintplus'
      \]

Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'

" All of your Plugins must be added before the following line
call plug#end()            " required



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Core Functionality (general settings, keyboard shortcuts)
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Conquer of Completion 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
