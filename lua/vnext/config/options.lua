local o = vim.opt

-- Enable terminal GUI colors
o.termguicolors = true

-- Reload files when changed externally
o.autoread = true

-- Use smart case for searching
o.ignorecase = true
o.smartcase = true

-- Use system clipboard for copy-pasting
o.clipboard = "unnamed"

-- Disable mouse support
o.mouse = ""

-- Set indentation settings
o.shiftwidth = 2
o.tabstop = 2
o.expandtab = true
o.autoindent = true
o.smartindent = true
o.wrap = false

-- Show absolute line numbers
o.number = true

-- Window title settings
vim.cmd([[set title titlestring=]])

-- Keep some lines visible when scrolling
o.scrolloff = 8

-- Enable incremental search
o.incsearch = true

-- Prevent automatic fixing of end-of-line characters
o.fixendofline = false

-- Ignore whitespace in diffs
o.diffopt:append("iwhite")
