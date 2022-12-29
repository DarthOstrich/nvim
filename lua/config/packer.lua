-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Themes
  -- Current Themes
  use 'drewtempelmeyer/palenight.vim'

  use 'vim-airline/vim-airline' --Status bar
  use 'vim-airline/vim-airline-themes' --Applicable themes
  use 'ap/vim-css-color' --  color name highlighter

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
  -- use 'neoclide/coc.nvim', {'branch': 'release'} --autocompletion

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  }

  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }


  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- LSP ZERO
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

end)

[[--
  -- OLD Packages
  -- Language Syntax Support
  -- use 'pangloss/vim-javascript' --JS highlighting
  -- use 'mxw/vim-jsx' --JSX syntax highlighting
  -- use 'jparise/vim-graphql' --graphql syntax highlighting
  -- use 'digitaltoad/vim-pug' --Pug highlighting
  -- use 'styled-components/vim-styled-components', { 'branch': 'main' }
  -- use 'leafOfTree/vim-svelte-plugin'

--]]
