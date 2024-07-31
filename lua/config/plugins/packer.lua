-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Themes
  -- Current Themes
  -- use 'folke/tokyonight.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }

  use {
    'nvim-lualine/lualine.nvim',
    -- requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use 'norcalli/nvim-colorizer.lua' -- colorizer

  -- Tools
  -- use 'prettier/vim-prettier', { 'do': 'yarn install' }
  use 'jiangmiao/auto-pairs' --Autocomplete brackets.
  use 'tomtom/tcomment_vim'
  use 'jdhao/better-escape.vim' -- Fix jk

  -- Git tools
  use 'tpope/vim-fugitive'
  use 'mhinz/vim-signify'

  use 'tpope/vim-surround'
  use 'mattn/emmet-vim' --A bit annoying because it takes over my Tab key

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  }

  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }


  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use 'nvim-treesitter/nvim-treesitter-context'

  -- LSP ZERO
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment the two plugins below if you want to manage the language servers from neovim
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- LSP Support
      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }

  use {
    "github/copilot.vim"
  }

  -- use {
  --   "ThePrimeagen/refactoring.nvim",
  --   requires = {
  --     {"nvim-lua/plenary.nvim"},
  --     {"nvim-treesitter/nvim-treesitter"}
  --   }
  -- }

end)

--[[
-- OLD Packages
-- Language Syntax Support
-- use 'pangloss/vim-javascript' --JS highlighting
-- use 'mxw/vim-jsx' --JSX syntax highlighting
-- use 'jparise/vim-graphql' --graphql syntax highlighting
-- use 'digitaltoad/vim-pug' --Pug highlighting
-- use 'styled-components/vim-styled-components', { 'branch': 'main' }
-- use 'leafOfTree/vim-svelte-plugin'

--]]
