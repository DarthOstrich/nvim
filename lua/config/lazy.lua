local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Now, configure your plugins with lazy.nvim
require("lazy").setup({
  -- Packer can manage itself in Packer, but not needed here for lazy.nvim

  -- Themes
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- Colorizer
  {"norcalli/nvim-colorizer.lua"},

  -- Tools
  {"jiangmiao/auto-pairs"},
  {"tomtom/tcomment_vim"},
  {"jdhao/better-escape.vim"},

  -- Git tools
  {"tpope/vim-fugitive"},
  {"mhinz/vim-signify"},

  -- Editing enhancements
  {"tpope/vim-surround"},
  {"mattn/emmet-vim"},

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons"}, -- For file icons
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {"nvim-lua/plenary.nvim"},
  },

  -- Treesitter for better syntax highlighting
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {"nvim-treesitter/nvim-treesitter-context"},

  -- LSP and Autocompletion
  --- Uncomment the two plugins below if you want to manage the language servers from neovim
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},

  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'},

  -- GitHub Copilot
  {"github/copilot.vim"},
})
