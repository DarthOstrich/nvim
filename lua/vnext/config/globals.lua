-- disable .editorconfig settings
vim.g.editorconfig = false

-- nvim-treesitter's injection query predicates call vim.treesitter.get_node_text
-- on nodes whose :range() method is nil in Neovim 0.12.2, causing a hard crash.
-- Wrap it so failures return "" instead of propagating (injection language detection
-- silently skips the block rather than crashing). Remove once nvim-treesitter fixes
-- compatibility with the 0.12 node API.
local _get_node_text = vim.treesitter.get_node_text
vim.treesitter.get_node_text = function(node, source, opts)
  local ok, result = pcall(_get_node_text, node, source, opts)
  return ok and result or ""
end

-- Disable Autocommenting
vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])
