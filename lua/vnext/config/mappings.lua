-- remap space to be leader
vim.g.mapleader = ' '

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>t", ":NvimTreeFocus<CR>", {silent = true, noremap = true})

-- save with zz
vim.keymap.set("n", "zz", ":update<cr>")
vim.keymap.set("n", "ZZ", ":wall<cr>")

-- leader p will paste last yanked line without yanking highlighted line
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Disable highlight with esc
vim.keymap.set("n", "<esc>", ":noh<return><esc>")

--[[
" remap space to be leader
map <Space> <Leader>

"This unsets the "last search pattern" register by hitting return
" nnoremap <silent> <CR> :nohlsearch<CR><CR>

" I dont think this actually works
" Line bubbling #1 tip https://www.youtube.com/watch?v=hSHATqh8svM
nnoremap <leader>k :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
--]]

