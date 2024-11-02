return {
    'folke/zen-mode.nvim',
    config = function()
        -- toggle function that stays on current buffer
        local function toggleZenMode() -- because in on_close it runs too early... 
            local zen_mode_active = require("zen-mode.view").is_open()
            if zen_mode_active then
                local current_zen_buf = vim.api.nvim_get_current_buf()
                require("zen-mode").toggle() -- first toggle off
                vim.api.nvim_set_current_buf(current_zen_buf) -- then set the last visited zen buffer as current
            else
                require("zen-mode").toggle()
            end
        end

        -- Zen Mode configuration
        require("zen-mode").setup({
            window = {
                backdrop = 1,
                width = 120,
                height = 0.90,
                options = {},
            },
            plugins = {
                options = {
                    enabled = true,
                    ruler = false,
                    showcmd = false,
                    laststatus = 0,
                },
                twilight = { enabled = false },
                gitsigns = { enabled = true },
                tmux = { enabled = true },
                kitty = { enabled = false, font = "+4" },
                alacritty = { enabled = false, font = "14" },
                wezterm = { enabled = false, font = "+4" },
            },
        })

        vim.api.nvim_set_keymap("n", "<leader>zn", "", {
            noremap = true,
            silent = true,
            callback = toggleZenMode
        })
    end
}

