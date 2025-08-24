vim.keymap.set('n', '<leader>M', require('treesj').toggle)
-- For extending default preset with `recursive = true`
vim.keymap.set('n', '<leader>m', function()
  require('treesj').toggle({ split = { recursive = true } })
end)
