return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "angular",
      "bash",
      "css",
      "html",
      "javascript",
      "typescript",
      "json",
      "jsonc",
      "lua",
      "python",
    },
  },
  dependencies = {
    -- "RRethy/nvim-treesitter-endwise",
    -- "mfussenegger/nvim-ts-hint-textobject",
    -- "windwp/nvim-ts-autotag",
  },
  config = function(_, opts)
    ---@type TSConfig
    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.configs").setup({
      ensure_installed = opts.ensure_installed,
      highlight = {
        enable = true,
        -- Disable treesitter for files with very long lines (minified JS, etc.).
        -- The Angular and HTML parsers crash with a nil-node error on minified
        -- content, so we fall back to regex syntax highlighting for those files.
        disable = function(_, buf)
          for _, line in ipairs(vim.api.nvim_buf_get_lines(buf, 0, -1, false)) do
            if #line > 500 then
              return true
            end
          end
        end,
      },
      -- endwise = {
      --   enable = true,
      -- },
      indent = { enable = true },
      autopairs = { enable = true },
    })

    -- require("nvim-ts-autotag").setup()
  end,
}
