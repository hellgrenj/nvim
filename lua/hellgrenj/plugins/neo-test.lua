return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      -- adapters
      'nvim-neotest/neotest-go',    
      'Issafalcon/neotest-dotnet',  
    },
    config = function()
      local neotest = require('neotest')

      neotest.setup({
        adapters = {
          require('neotest-go')({
            experimental = { test_table = true },
          }),
          require('neotest-dotnet')({
            dap = {  
                    adapter = "coreclr",
                    justMyCode = true 
                },
            -- discovery_root = "solution", -- uncomment if you want .sln as root
          }),
        },
        output   = { open_on_run = false },
        quickfix = { enabled = false },
      })

      -- generic neotest keymaps (run)
      vim.keymap.set('n', '<leader>tn', function() neotest.run.run() end, { desc = 'Test Nearest' })
      vim.keymap.set('n', '<leader>tf', function() neotest.run.run(vim.fn.expand('%')) end, { desc = 'Test File' })
      vim.keymap.set('n', '<leader>ts', function() neotest.run.run({ suite = true }) end, { desc = 'Test Suite' })
      vim.keymap.set('n', '<leader>to', function() neotest.output_panel.toggle() end, { desc = 'Test Output Panel' })
      vim.keymap.set('n', '<leader>tT', function() neotest.summary.toggle() end, { desc = 'Test Summary (Tree)' })
      vim.keymap.set('n', '<leader>tr', function() neotest.run.run_last() end, { desc = 'Test Re-run Last' })
      vim.keymap.set('n', '<leader>tq', function() neotest.run.stop() end, { desc = 'Test Stop' })

      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'go',
        callback = function()
          vim.keymap.set('n', '<leader>td', function()
            require('dap-go').debug_test()
          end, { buffer = true, desc = 'Go: DAP Debug Test (dap-go)' })
        end,
      })

      -- C#: use neotest with DAP strategy (netcoredbg)
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'cs',
        callback = function()
          vim.keymap.set('n', '<leader>td', function()
            neotest.run.run({ strategy = 'dap' })
          end, { buffer = true, desc = 'C#: DAP Debug Nearest (neotest)' })
        end,
      })

      -- optional: debug the whole current file via DAP (handy for Go table tests)
      vim.keymap.set('n', '<leader>tD', function()
        neotest.run.run({ vim.fn.expand('%'), strategy = 'dap' })
      end, { desc = 'Test Debug File (DAP)' })
    end,
  },
}

