return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
      { 'hrsh7th/cmp-nvim-lua' },
    },
    config = function()
      local lsp_zero = require('lsp-zero')

      lsp_zero.on_attach(function(_, bufnr)
        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K",  vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>vd",  vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>vf", function()
          vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
        end, opts)
        vim.keymap.set({ 'n', 'x' }, 'ff', function()
          vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
        end, opts)
      end)

      -- autoformat Go on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
        end,
      })

    -- autoformat C# on save
      vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = "*.cs",
          callback = function()
            vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
          end,
        })


      local cmp = require('cmp')
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      cmp.setup({
        sources = {
          { name = 'path' },
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
          { name = 'vim-dadbod-completion' },
        },
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ['<C-Space>'] = cmp.mapping.complete(),
        }),
      })

        require("mason").setup({
          registries = {
            "github:mason-org/mason-registry",      -- the default core registry
            "github:Crashdummyy/mason-registry",    -- adds roslyn & rzlslsp
          },
        })
          require('mason-lspconfig').setup({
        ensure_installed = {
          'ts_ls','rust_analyzer','gopls','pylsp','bashls','zls','biome','clangd', 'html'
          -- intentionally no 'omnisharp' / 'csharp_ls' (installed separatly below)
          -- TODO: manually install MasonInstall roslyn 
          -- netcoredbg is not an LSP but a DAP adapter cant be added above but installed via :MasonInstall netcoredbg (TODO: could be installed via mason-tool-installer tho i think...)
        },
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(vim.lsp.config(lua_opts))
          end,
          pylsp = function()
            require('lspconfig').pylsp.setup(vim.lsp.config({
              settings = {
                pylsp = {
                  plugins = {
                    pycodestyle = {
                      ignore = { 'E501', 'W503', 'E402' },
                      maxLineLength = 120,
                    },
                  },
                },
              },
            }))
          end,
        }
      })


    -- rzls integration with roslyn.nvim
        local rzls_path = vim.fn.expand("$MASON/packages/rzls/libexec")
        local cmd = {
          "roslyn",
          "--stdio",
          "--logLevel=Information",
          "--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
          "--razorSourceGenerator=" .. vim.fs.joinpath(rzls_path, "Microsoft.CodeAnalysis.Razor.Compiler.dll"),
          "--razorDesignTimePath=" .. vim.fs.joinpath(rzls_path, "Targets", "Microsoft.NET.Sdk.Razor.DesignTime.targets"),
          "--extension",
          vim.fs.joinpath(rzls_path, "RazorExtension", "Microsoft.VisualStudioCode.RazorExtension.dll"),
        }

       require("roslyn").setup({
          cmd = cmd,
          handlers = require("rzls.roslyn_handlers"),
          -- on_attach = ...,
          -- capabilities = ...,
          -- settings = { ... },
        })
     end
  },

  -- extras
  { 'hrsh7th/nvim-cmp' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'neovim/nvim-lspconfig' },

    -- importing roslyn.nvim for C# support
  { 'seblyng/roslyn.nvim', opts = {} },
  { 'tris203/rzls.nvim', opts = {} },
}

