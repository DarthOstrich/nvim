vim.opt.termguicolors = true
color = "palenight"
vim.cmd.colorscheme(color)

airline_theme = "palenight"

-- highlight colors
-- vim.api.nvim_set_hl(0, "Search", { guibg = darkslateblue, guifg = wheat})
-- vim.api.nvim_set_hl(0, "Conceal", { guifg = #697098 })
vim.cmd("hi Conceal guifg=#697098")
-- vim.api.nvim_set_hl(0, "SignifySignAdd", { ctermfg=green, guifg=#C3E88D, cterm=NONE, gui=NONE})

require'colorizer'.setup()

--[[
if (has("termguicolors"))
   set termguicolors
 endif
syntax enable

" colors OceanicNext
colorscheme palenight 

" To enable the lightline theme
" let g:lightline = { 'colorscheme': 'embark' }
let g:airline_theme = "palenight"


" let g:gruvbox_contrast_dark = 'soft'

" adds blue highlight to vim in visual mode selections
" hi Visual cterm=bold ctermbg=Yellow ctermfg=NONE
" Search Highlight
hi Search guibg=darkslateblue guifg=wheat

" Enable Rainbow Brackets  
" let g:rainbow_active = 1

" Signify colors to match Embark
hi SignifySignAdd    ctermfg=green  guifg=#C3E88D cterm=NONE gui=NONE
hi SignifySignDelete ctermfg=red    guifg=#ff5370 cterm=NONE gui=NONE
hi SignifySignChange ctermfg=yellow guifg=#ffcb6b cterm=NONE gui=NONE

" set color for concealed items, including 'declared but never used'
" For nightfly
" hi Conceal guifg=#7c8f8f 
" For palenight
hi Conceal guifg=#697098
--]]


