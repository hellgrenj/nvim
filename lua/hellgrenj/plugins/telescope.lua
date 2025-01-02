return {
    'nvim-telescope/telescope.nvim',
    -- tag = '0.1.4',
    branch = '0.1.x',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end)
        vim.keymap.set('n', '<leader>lg', function()
            builtin.live_grep()
        end)
        -- Keybinding for function symbols
        vim.api.nvim_set_keymap(
            'n',
            '<leader>lf',
            "<cmd>Telescope lsp_document_symbols symbols=function<CR>",
            { noremap = true, silent = true }
        )

        -- Keybinding for method symbols
        vim.api.nvim_set_keymap(
            'n',
            '<leader>lm',
            "<cmd>Telescope lsp_document_symbols symbols=method<CR>",
            { noremap = true, silent = true }
        )
    end
}
