return {
    {
        'mfussenegger/nvim-dap',
        config = function()
            local dap = require "dap"
            dap.configurations.go = {
                {
                    type = 'go',
                    name = 'Debug',
                    request = 'launch',
                    showLog = false,
                    program = "${file}",
                    dlvToolPath = vim.fn.exepath('dlv') -- make sure dlv is in the PATH
                },
            }
            -- DAP bindings
            vim.keymap.set("n", '<leader>dk', function() require('dap').continue() end)
            vim.keymap.set("n", '<leader>dl', function() require('dap').run_last() end)
            vim.keymap.set("n", '<leader>b', function() require('dap').toggle_breakpoint() end)
            vim.keymap.set("n", '<leader>do', function() require('dap').step_over() end)
            vim.keymap.set("n", '<leader>di', function() require('dap').step_into() end)
            vim.keymap.set("n", '<leader>du', function() require('dap').step_out() end)
            vim.keymap.set("n", '<leader>ds', function() require('dap').disconnect() end)
            -- DAP UI
            vim.keymap.set("n", '<leader>dui', function() require('dapui').toggle() end)
        end
    },
    {
        'theHamsta/nvim-dap-virtual-text',
        config = function()
            require("nvim-dap-virtual-text").setup()
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            require("dapui").setup()
        end
    },
    {
        'leoluz/nvim-dap-go',
        config = function()
            require('dap-go').setup()
        end
    },
}
