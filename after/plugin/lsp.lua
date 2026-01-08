-- LSP Zero configuration
-- Note: You may see deprecation warnings from lspconfig when using lsp-zero v2.x
-- These are informational and don't affect functionality
local lsp_ok, lsp = pcall(require, 'lsp-zero')
if not lsp_ok then
  vim.notify("lsp-zero not installed yet - will be available after plugin installation", vim.log.levels.WARN)
  return
end

lsp = lsp.preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

-- (Optional) Configure lua language server for neovim
local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if lspconfig_ok then
  lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
end

lsp.ensure_installed({
  -- Replace these with whatever servers you want to install
  'ts_ls',
  'eslint',
  'lua_ls',
  'pylsp',
  -- 'rust_analyzer',
  'vimls',
})

lsp.set_preferences({
  sign_icons = {}
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

if lspconfig_ok then
  lspconfig['pylsp'].setup {
  on_attach = on_attach,
  filetypes = { 'python' },
  capabilities = capabilities,
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

  lspconfig['ts_ls'].setup {
    on_attach = on_attach,
    filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'typescript.tsx', 'jsx' },
    capabilities = capabilities,
  }

  lspconfig['eslint'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'typescript.tsx', 'jsx' },
  }

  lspconfig['vimls'].setup {}

  lspconfig['clangd'].setup {}
end


lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
  vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
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
