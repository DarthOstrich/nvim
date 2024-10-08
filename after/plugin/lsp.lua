local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

-- doesn't work
-- local regexPattern = '["{([\\s\\S]*)}", ":\\s*[\'\"`]([^\'\"`]*)[\'\"`]"]'

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {
    'ts_ls',
    'eslint',
    'lua_ls',
    'intelephense',
    'stylelint_lsp',
    'tailwindcss',
  },
  handlers = {
    lsp_zero.default_setup,
    stylelint_lsp = function()
      require('lspconfig').stylelint_lsp.setup({
        filetypes = { "css", "scss" },
        settings = {
          stylelintplus = {
            -- see available options in stylelint-lsp documentation
          }
        }
      })
    end,
    tailwindcss = function()
      require('lspconfig').tailwindcss.setup({
        -- includeLanguages = { "css", "scss", "ts" },
        settings = {
          includeLanguages = { "css", "scss", "ts" },
          -- wrapperClasses doesn't work because it expects it to be wrapperClases="classnames"
          -- tailwindCSS = {
          --   classAttributes = {
          --     "class",
          --     "className",
          --     "class:list",
          --     "classList",
          --     "ngClass",
          --     "wrapperClasses"
          --   }
          -- }
        }
        -- experimental = {
        --   classRegex = {
        --     regexPattern
        --   }
        -- }
      })
    end,
  }
})


local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format({details = true})

cmp.setup({
  -- default keybindings for nvim-cmp are here:
  -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/README.md#keybindings-1
  mapping = cmp.mapping.preset.insert({
    -- confirm completion item
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),

    -- trigger completion menu
    -- doesn't work if its not disabled
    -- ['<C-Space>'] = cmp.mapping.complete(),
  }),
  --- (Optional) Show source name in completion menu
  formatting = cmp_format,
})

-- diagnostics
-- lsp_zero.set_sign_icons({
--   error = '✘',
--   warn = '▲',
--   hint = '⚑',
--   info = ''
-- })

vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
})
