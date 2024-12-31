return {
    'github/copilot.vim',
    config = function()
        -- Toggle GitHub Copilot with notification (fidget set to override vim.notify)
        vim.api.nvim_set_keymap('n', '<leader>cp',
            '<Cmd>lua vim.g.copilot_enabled = not vim.g.copilot_enabled; vim.notify("Copilot " .. (vim.g.copilot_enabled and "ON" or "OFF"), vim.log.levels.INFO)<CR>',
            { noremap = true, silent = true })
    end
}

