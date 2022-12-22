-- remap space to be leader
vim.g.mapleader = ' '

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {silent = true, noremap = true})

-- save with zz
vim.keymap.set("n", "zz", ":update<cr>")

-- leader p will paste last yanked line without yanking highlighted line
vim.keymap.set("x", "<leader>p", [["_dP]])

--[[
" remap space to be leader
map <Space> <Leader>
--]]
