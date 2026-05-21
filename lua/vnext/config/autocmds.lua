-- Re-detect HTML files in Angular projects as "htmlangular" so treesitter
-- uses the Angular parser (which understands [binding]="expr" syntax).
-- Fires after Neovim sets filetype=html, then upgrades it if angular.json
-- is found anywhere up the directory tree from the current file.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "html",
  callback = function(ev)
    local path = vim.api.nvim_buf_get_name(ev.buf)
    local dir = vim.fn.fnamemodify(path, ":h")
    if vim.fn.findfile("angular.json", dir .. ";") ~= "" then
      vim.bo[ev.buf].filetype = "htmlangular"
    end
  end,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
