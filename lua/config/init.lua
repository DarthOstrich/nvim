require('config.remap')
require('config.set')

-- nvim-tree
-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
-- OR setup with some options
require("nvim-tree").setup({
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true
  }
})

-- END nvim-tree
