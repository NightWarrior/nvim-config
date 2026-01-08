-- Protected call to avoid startup errors if treesitter not yet installed
local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

if vim.loop.os_uname().sysname == "Windows_NT" then
  local install_ok, install = pcall(require, 'nvim-treesitter.install')
  if install_ok then
    install.compilers = { "zig" }
  end
end

configs.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "vimdoc", "javascript", "typescript", "python", "c", "lua", "vim", "vimdoc", "query" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
  }
}
