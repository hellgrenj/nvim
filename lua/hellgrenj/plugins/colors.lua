return {
    'rose-pine/neovim',
    -- 'folke/tokyonight.nvim',
    name = 'rose-pine',

    config = function()
    -- set colorscheme
    vim.cmd.colorscheme('rose-pine')

    -- my custom highlights
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" }) -- <- black left padding
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

    vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#17181a", fg = "#17181a" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#17181a" })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "#17181a" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "#17181a", fg = "#17181a" })
    vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { bg = "#17181a", fg = "#f75779" })
    vim.api.nvim_set_hl(0, "TelescopeMatching", { bg = "#17181a", fg = "#f75779" })
    vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#1e1f21", fg = "#f75779" })
    vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { bg = "#17181a", fg = "#f75779" })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "#17181a", fg = "#f75779" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "#17181a", fg = "#17181a" })
    vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = "#17181a", fg = "#b2b4b8" })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "#17181a", fg = "#17181a" })

    vim.api.nvim_set_hl(0, "Pmenu", { bg = "#17181a", fg = "#17181a" })
    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#1e1f21", fg = "#c4a7e7" })
    vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#2e2f31" })
    vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#565758" })
    end
}
