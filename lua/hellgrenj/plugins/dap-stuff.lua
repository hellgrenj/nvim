return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      local dap = require('dap')

      -- Go (dlv)
      dap.configurations.go = {
        {
          type = 'go',
          name = 'Debug',
          request = 'launch',
          showLog = false,
          program = "${file}",
          dlvToolPath = vim.fn.exepath('dlv'),
        },
      }

      -- .NET (C#) via netcoredbg
      local mason_netcoredbg = vim.fn.stdpath('data') .. '/mason/bin/netcoredbg'
      local netcoredbg_path = vim.loop.fs_stat(mason_netcoredbg) and mason_netcoredbg
        or vim.fn.exepath('netcoredbg')

      dap.adapters.coreclr = {
        type = 'executable',
        command = netcoredbg_path,
        args = { '--interpreter=vscode' },
      }

      local function build_and_pick_dll()
        vim.fn.system({ 'dotnet', 'build', '-c', 'Debug' })
        local root = vim.fn.getcwd()
        local guess = vim.fn.glob(root .. '/bin/Debug/*/*.dll')
        if guess ~= '' then return guess end
        return vim.fn.input('Path to DLL: ', root .. '/', 'file')
      end

      dap.configurations.cs = {
        {
          type = 'coreclr',
          name = 'Launch (build & run)',
          request = 'launch',
          program = function() return build_and_pick_dll() end,
          cwd = '${workspaceFolder}',
          stopAtEntry = false,
          justMyCode = true,
          env = {},
          args = {},
          console = 'integratedTerminal',
        },
        {
          type = 'coreclr',
          name = 'Attach to process',
          request = 'attach',
          processId = require('dap.utils').pick_process,
        },
      }


        -- aliases needed for neo-test to work with leader td and dap ...
        dap.adapters.netcoredbg   = dap.adapters.coreclr
        dap.adapters.netcoredebug = dap.adapters.coreclr   -- just in case of a typoed name

      -- Keymaps
      vim.keymap.set("n", '<leader>dk', function() dap.continue() end)
      vim.keymap.set("n", '<leader>dl', function() dap.run_last() end)
      vim.keymap.set("n", '<leader>b',  function() dap.toggle_breakpoint() end)
      vim.keymap.set("n", '<leader>do', function() dap.step_over() end)
      vim.keymap.set("n", '<leader>di', function() dap.step_into() end)
      vim.keymap.set("n", '<leader>du', function() dap.step_out() end)
      vim.keymap.set("n", '<leader>ds', function() dap.disconnect() end)
      vim.keymap.set("n", '<leader>dui', function() require('dapui').toggle() end)
    end,
  },

  {
    'theHamsta/nvim-dap-virtual-text',
    config = function()
      require('nvim-dap-virtual-text').setup()
    end,
  },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap' },
    config = function()
      local dap, dapui = require('dap'), require('dapui')
      dapui.setup()
      dap.listeners.after.event_initialized['dapui'] = function() dapui.open() end
      dap.listeners.before.event_terminated['dapui'] = function() dapui.close() end
      dap.listeners.before.event_exited['dapui']      = function() dapui.close() end
    end,
  },

  {
    'leoluz/nvim-dap-go',
    config = function()
      require('dap-go').setup()
    end,
  },
}

