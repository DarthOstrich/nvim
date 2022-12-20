vim.cmd('source $HOME/.config/nvim/init-old.vim')
-- vim.cmd('source $HOME/.config/nvim/config/init.vim')

-- require('lua/packer.lua')



-- nvim-tree
-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
-- OR setup with some options
require("nvim-tree").setup({
  respect_buf_cwd = true,
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {silent = true, noremap = true})

-- END nvim-tree

