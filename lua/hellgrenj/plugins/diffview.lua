return {
    "sindrets/diffview.nvim",
    config = function()
        vim.keymap.set('n', '<leader>dvo', require('diffview').open) 
        vim.keymap.set('n', '<leader>dvc', require('diffview').close)
    end
}
    
