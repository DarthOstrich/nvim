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
" External Settings files 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" source $HOME/.config/nvim/plug-config/coc.vim






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Core Functionality (general settings, keyboard shortcuts)
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" deal with swps and backups here
" create backups
set backup
" tell vim where to put its backup files
set backupdir=/tmp
" tell vim where to put swap files
set dir=/tmp
set timeoutlen=1000        " speed vim up
set ttimeoutlen=0          " https://stackoverflow.com/questions/37644682/why-is-vim-so-slow/37645334
set ttyfast                " Rendering
set lazyredraw
set tw=200                 " Line Length set to 200 😲
" Use smart case for searching
set ignorecase
set smartcase

" Disable Autocommenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" remap space to be leader
map <Space> <Leader>

" map jk to esc
" :imap jk <Esc> " Managed by a plugin

" save with zz
nnoremap zz :update<cr>

" set clipboard to easily copy from vim and paste into OSx
set clipboard=unnamed

" remap Ctrl-p for finding files run Fzf :Files command
" nnoremap <C-p> :Files<Cr>
" nnoremap <C-f> :Rg<Cr>
" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Disable highlight with esc
nnoremap <esc> :noh<return><esc>

" Live Substitution
set inccommand=split


"This unsets the "last search pattern" register by hitting return
" nnoremap <silent> <CR> :nohlsearch<CR><CR>

" add characters for punctuation, use `:set list` to toggle
set showbreak=↪\ 
set listchars=tab:→\ ,eol:↲,space:␣,trail:•,extends:⟩,precedes:⟨

" Setting for commenter to not replace hyphens
let g:tcomment#replacements_xml = {'&': '&', '-': '-'}

" git-signify default updatetime 4000ms is not good for async update
set updatetime=100

" Line bubbling #1 tip https://www.youtube.com/watch?v=hSHATqh8svM
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==

" leader p will paste last yanked line without yanking highlighted line
vnoremap <leader>p "_dP

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => netrw
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't really use this anymore, but leaving in here for reference
" let g:netrw_liststyle=3 "Tree Style [3]
" let g:netrw_banner=0
" let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'
" autocmd FileType netrw set nolist


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Changes NerdTree Toggle to Ctrl + n
" map <C-n> :NERDTreeToggle<CR> 
" autocmd VimEnter * NERDTree "Toggles Nerdtree on vim open
" let NERDTreeQuitOnOpen = 1 "closes NerdTree when opening a file



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc Explorer (The New NerdTree) 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :nmap <leader>e :CocCommand explorer<CR>

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
" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2     " tab spacing
set expandtab     " tabs are now spaces
set ai            " Auto indent
" set si            " Smart indent
set wrap          " Wrap lines
set nowrap        " Don't wrap text


" Show line numbers
" turn absolute line numbers on
:set number
:set nu

" Code fold bliss
" https://www.linux.com/learn/vim-tips-folding-fun
" set foldmethod=indent

" Blink cursor on error instead of beeping (grr)
set visualbell
set t_vb=

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

" Shows the title within the window
set title titlestring=

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

" Emmet
let g:user_emmet_leader_key=',' " Redefine emmet leader key. It's now ,,
" let g:user_emmet_expandabbr_key='<Tab>'

" Syntax stuff
" This lets vim know that .prisma files should be graphql. 
" Stolen from vim-graphql/ftdetect/graphql.vim
au BufRead,BufNewFile *.prisma setfiletype graphql
" au BufNewFile,BufRead *.svelte :set filetype=html

set secure "disables unsafe commands in project specific .vimrc

