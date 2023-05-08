-- Setup Mason to automatically install LSP servers
require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- PHP - Intelephense
require('lspconfig').intelephense.setup({ capabilities = capabilities })

-- TS, JS & HTML - Volar - Vue Specific
require('lspconfig').volar.setup({
  capabilities = capabilities, 
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
})

-- Tailwind CSS
require('lspconfig').tailwindcss.setup({ capabilities = capabilities })

-- Rust
require('lspconfig').rust_analyzer.setup({
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
})

-- JSON
require('lspconfig').jsonls.setup({
    capabilities = capabilities,
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
      }
    }
  })

require('null-ls').setup({
  sources = {
    require ('null-ls').builtins.diagnostics.eslint_d.with({
      condition = function (utils)
        return utils.root_has_file('.eslintrc.js')
      end,
    }),
    require ('null-ls').builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),
    require ('null-ls').builtins.formatting.estint_d.with({
      condition = function (utils)
        return utils.root_has_file('.eslintrc.js')
      end,
    }),
    require ('null-ls').builtins.formatting.prettierd,
  }
})

require('mason-null-fs').setup({automatic_installation = true})

vim.keymap.set('n','<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>')
vim.keymap.set('n', 'gr',':Telescope lsp_references<CR>')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<Leader>rn','<cmd>lua vim.lsp.buf.rename()<CR>')

vim.api.nvim_create_user_command('Format', vim.lsp.buf.formatting, {})

vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = true,
  }
})
-- Sign configuration
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError', })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnesticSignInfo', { text = '', texthl = 'DiagnostioSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
