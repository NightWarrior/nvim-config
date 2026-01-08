local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Python provider setup (cross-platform)
if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
  -- Windows path
  local python_path = vim.fn.expand('~/.venvs/nvim/Scripts/python.exe')
  if vim.fn.filereadable(python_path) == 1 then
    vim.g.python3_host_prog = python_path
  end
else
  -- Unix/Linux/Mac path
  local python_path = vim.fn.expand('~/.venvs/nvim/bin/python3')
  if vim.fn.filereadable(python_path) == 1 then
    vim.g.python3_host_prog = python_path
  end
end

require('taimoor')

-- set backspace=indent,eol,start
