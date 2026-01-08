-- Protected call to avoid startup errors if cmp not yet installed
local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
  return
end

local luasnip_ok, luasnip = pcall(require, "luasnip")
if luasnip_ok then
  require("luasnip.loaders.from_vscode").lazy_load()
  
  -- Use Windows-compatible path
  local snippets_path = vim.fn.stdpath('config') .. '\\Snippets'
  if vim.fn.has('win32') == 0 then
    snippets_path = vim.fn.stdpath('config') .. '/Snippets'
  end
  
  if vim.fn.isdirectory(snippets_path) == 1 then
    require("luasnip.loaders.from_lua").load({ paths = { snippets_path } })
  end
end

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  snippet = {
    expand = function(args)
      if luasnip_ok then
        luasnip.lsp_expand(args.body)
      end
    end,
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = 'luasnip' },
  }),
})
