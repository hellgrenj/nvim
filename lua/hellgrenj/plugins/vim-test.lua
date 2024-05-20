return {
    'vim-test/vim-test',
    config = function()
        -- VIM TEST (no lua module available ..)
        vim.keymap.set('n', '<leader>tn', ':TestNearest<CR>', { silent = true })
        vim.keymap.set('n', '<leader>tf', ':TestFile<CR>', { silent = true })
        -- this config is needed for the C# unit tests to run with TestNearest.. TestFile doesnt work at all with xunit and .net
        -- go and rust just worked out of the box...
        -- to get TestFile functionality in .net with xunit you can do TestNearest on the classname...
        vim.g["test#csharp#runner"] = "dotnettest"

        -- run go unit tests with -v flag
        vim.g["test#go#gotest#options"] = "-v"
        -- nmap <silent> <leader>td :lua require('dap-go').debug_test()<CR>
        vim.keymap.set("n", '<leader>td', function() require('dap-go').debug_test() end)
    end
}
