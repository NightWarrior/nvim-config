local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.ensure_installed({
  -- Replace these with whatever servers you want to install
  -- 'tsserver',
  'eslint',
  'lua_ls',
  'pylsp',
  'rust_analyzer',
  'vimls',
})

lsp.set_preferences({
  sign_icons = {}
})


require 'lspconfig'['pylsp'].setup {
  on_attach = on_attach,
  filetypes = { 'python' },
  settings = {
    configurationSources = { "flake8" },
    formatCommand = { "black" },
    pylsp = {
      plugins = {
        pylsp_mypy = { enabled = false },
        pycodestyle = {
          enabled = true,
          ignore = { 'E501', 'E302', 'E231', 'W391' },
          maxLineLength = 120
        },
      }
    }
  }
}

require 'lspconfig'['tsserver'].setup {
  on_attach = on_attach,
  filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'typescript.tsx', 'jsx' },
}

require 'lspconfig'['eslint'].setup {
  on_attach = on_attach,
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'typescript.tsx', 'jsx' },

}

require 'lspconfig'['vimls'].setup {}

require 'lspconfig'['clangd'].setup {}


lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, opts)
end)

lsp.setup()


vim.diagnostic.config({
  virtual_text = true
})
