local nvimTree = require("nvim-tree.api")

    vim.keymap.set("n", "<Leader>tr", function() nvimTree.tree.toggle() end )
    vim.keymap.set("n", "<Leader>tf", function() nvimTree.tree.find_file() end )

