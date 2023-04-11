function ToggleMouse()
    print(vim.opt.mouse)
    if vim.opt.mouse == 'a' then
       vim.opt.mouse = ''
   elseif vim.opt.mouse == '' then
       vim.opt.mouse = 'a'
   end
end


vim.keymap.set("n", "<leader>mm", function() vim.opt.mouse = 'a'; print('Mouse Enabled') end)
vim.keymap.set("n", "<leader>mn", function() vim.opt.mouse = nil; print('Mouse Disabled') end)
