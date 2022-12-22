-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
vim.opt.autoread = true         -- reload files 

--Use smart case for searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- set clipboard to easily copy from vim and paste into OSx
vim.opt.clipboard="unnamed"


vim.opt.shiftwidth = 2
vim.opt.tabstop = 2         --" tab spacing
vim.opt.expandtab = true     --" tabs are now spaces
vim.opt.ai = true            --" Auto indent
vim.opt.smartindent = true      
vim.opt.wrap = false         --" Wrap lines


-- Show line numbers
vim.opt.nu = true
-- turn absolute line numbers on
-- vim.opt.relativenumber = true

-- Shows the title within the window
vim.cmd([[set title titlestring=]])

--[[
from old vim files

" deal with swps and backups here
" create backups
set backup
" tell vim where to put its backup files
set backupdir=/tmp
" tell vim where to put swap files
set dir=/tmp
set ttimeoutlen=0          " https://stackoverflow.com/questions/37644682/why-is-vim-so-slow/37645334
set ttyfast                " Rendering
set lazyredraw
set tw=200                 " Line Length set to 200 😲

" Live Substitution
set inccommand=split

" add characters for punctuation, use `:set list` to toggle
set showbreak=↪\ 
set listchars=tab:→\ ,eol:↲,space:␣,trail:•,extends:⟩,precedes:⟨

" git-signify default updatetime 4000ms is not good for async update
set updatetime=100

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


--]]
