return {
    'github/copilot.vim',
    config = function()
        -- toggle github copilot
        vim.api.nvim_set_keymap('n', '<leader>cp', '<Cmd>lua vim.g.copilot_enabled = not vim.g.copilot_enabled<CR>',
            { noremap = true, silent = true })
    end
}
