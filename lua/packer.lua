-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Themes
  -- Current Themes
  use 'drewtempelmeyer/palenight.vim'

  use 'vim-airline/vim-airline' --Status bar
  use 'vim-airline/vim-airline-themes' --Applicable themes
  use 'ap/vim-css-color' --  color name highlighter

  -- Language Syntax Support
  use 'pangloss/vim-javascript' --JS highlighting
  use 'mxw/vim-jsx' --JSX syntax highlighting
  use 'jparise/vim-graphql' --graphql syntax highlighting
  use 'digitaltoad/vim-pug' --Pug highlighting
  -- use 'styled-components/vim-styled-components', { 'branch': 'main' }
  use 'leafOfTree/vim-svelte-plugin'

  -- Tools
  -- use 'prettier/vim-prettier', { 'do': 'yarn install' }
  use 'jiangmiao/auto-pairs' --Autocomplete brackets. 
  use '/usr/local/opt/fzf'
  use 'tomtom/tcomment_vim'
  use 'jdhao/better-escape.vim' -- Fix jk

  -- Git tools
  use 'tpope/vim-fugitive' 
  use 'mhinz/vim-signify'

  use 'tpope/vim-surround'
  use 'mattn/emmet-vim' --A bit annoying because it takes over my Tab key
  -- use 'neoclide/coc.nvim', {'branch': 'release'} --autocompletion

  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

end)
