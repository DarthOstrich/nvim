-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
-- start nvim-tree on boot
local function open_nvim_tree()
  -- open the tree
  require("nvim-tree.api").tree.open()
end

-- disabling for now
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

