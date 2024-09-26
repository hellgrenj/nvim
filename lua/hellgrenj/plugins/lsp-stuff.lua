return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            --- Uncomment these if you want to manage LSP servers from neovim
            -- {'williamboman/mason.nvim'},
            -- {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        },
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.on_attach(function(client, bufnr)
                local opts = { buffer = bufnr, remap = false }

                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
                vim.keymap.set("n", "<leader>vf", function() vim.lsp.buf.formatting() end, opts)
                vim.keymap.set({ 'n', 'x' }, 'ff', function()
                    vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
                end, opts)
            end)
            --- auto format go files on save with gofmt via gopls lsp
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*.go",
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
                require('mason').setup({})
                require('mason-lspconfig').setup({
                    ensure_installed = { 'ts_ls', 'rust_analyzer', 'gopls', 'omnisharp', 'pylsp', 'bashls', 'zls', 'rome' },
                    handlers = {
                        lsp_zero.default_setup,
                        lua_ls = function()
                            local lua_opts = lsp_zero.nvim_lua_ls()
                            require('lspconfig').lua_ls.setup(lua_opts)
                        end,
                        pylsp = function()
                            local pylsp_opts = {
                                settings = {
                                    pylsp = {
                                        plugins = {
                                            pycodestyle = {
                                                ignore = { 'E501', 'W503', 'E402' },
                                                maxLineLength = 120 -- Example: Optionally, you can also adjust the line length
                                            }
                                            -- Add other plugin configurations here if needed
                                        }
                                    }
                                }
                            }
                            require('lspconfig').pylsp.setup(pylsp_opts)
                        end,
                    }
                })


        end
    },
    { 'hrsh7th/nvim-cmp' },
    {
        {"williamboman/mason.nvim" },
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
}
