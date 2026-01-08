-- Modern LSP configuration using vim.lsp.config (Neovim 0.11+)
-- This replaces the deprecated require('lspconfig') approach

-- Get default capabilities from nvim-cmp
local cmp_ok, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
local capabilities = cmp_ok and cmp_lsp.default_capabilities() or vim.lsp.protocol.make_client_capabilities()

-- Common on_attach function for all LSP servers
local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  -- LSP keymaps
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
end

-- Configure LSP servers using modern vim.lsp.config API
-- Lua Language Server
vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git' },
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          "${3rd}/luv/library"
        }
      },
      completion = { callSnippet = 'Replace' },
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

-- Python LSP
vim.lsp.config('pylsp', {
  cmd = { 'pylsp' },
  root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', 'pyrightconfig.json', '.git' },
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { 'python' },
  settings = {
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
})

-- TypeScript/JavaScript LSP (using ts_ls)
vim.lsp.config('ts_ls', {
  cmd = { 'typescript-language-server', '--stdio' },
  root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx' }
})

-- ESLint LSP
vim.lsp.config('eslint', {
  cmd = { 'vscode-eslint-language-server', '--stdio' },
  root_markers = { '.eslintrc', '.eslintrc.js', '.eslintrc.cjs', '.eslintrc.yaml', '.eslintrc.yml', '.eslintrc.json', 'eslint.config.js', 'package.json', '.git' },
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx', 'vue', 'svelte', 'astro' }
})

-- Vim LSP
vim.lsp.config('vimls', {
  cmd = { 'vim-language-server', '--stdio' },
  root_markers = { '.git' },
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { 'vim' }
})

-- Clangd (C/C++)
vim.lsp.config('clangd', {
  cmd = { 'clangd' },
  root_markers = { '.clangd', '.clang-tidy', '.clang-format', 'compile_commands.json', 'compile_flags.txt', 'configure.ac', '.git' },
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' }
})

-- Enable the configured LSP servers
vim.lsp.enable('lua_ls')
vim.lsp.enable('pylsp')
vim.lsp.enable('ts_ls')
vim.lsp.enable('eslint')
vim.lsp.enable('vimls')
vim.lsp.enable('clangd')

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
