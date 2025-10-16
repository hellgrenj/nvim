return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  config = function()
    require("markview").setup()

    vim.keymap.set("n", "<leader>mv", function()
      vim.cmd("Markview splitToggle")
    end, { desc = "Toggle Markview preview" })



    -- Code blocks
    vim.api.nvim_set_hl(0, "MarkviewCode",        { bg = "#1E1E2E", fg = "#E0E0E0" })
    vim.api.nvim_set_hl(0, "MarkviewCodeBlock",   { bg = "#1E1E2E", fg = "#E0E0E0" })
    vim.api.nvim_set_hl(0, "MarkviewInlineCode",  { bg = "#2A2A3C", fg = "#E0E0E0" })

    -- Headings (H1–H6)
    vim.api.nvim_set_hl(0, "MarkviewHeading1", { bg = "#2F1B1B", fg = "#FF6B6B", bold = true })
    vim.api.nvim_set_hl(0, "MarkviewHeading2", { bg = "#2B1E2F", fg = "#C678DD", bold = true })
    vim.api.nvim_set_hl(0, "MarkviewHeading3", { bg = "#1F2A2F", fg = "#61AFEF", bold = true })
    vim.api.nvim_set_hl(0, "MarkviewHeading4", { bg = "#232F1F", fg = "#98C379", bold = true })
    vim.api.nvim_set_hl(0, "MarkviewHeading5", { bg = "#2F2C1F", fg = "#E5C07B", bold = true })
    vim.api.nvim_set_hl(0, "MarkviewHeading6", { bg = "#2F1F2E", fg = "#D19A66", bold = true })

    -- Blockquotes
    vim.api.nvim_set_hl(0, "MarkviewQuote", { bg = "#2A2A2A", fg = "#B0B0B0", italic = true })

    -- Lists and checkboxes
    vim.api.nvim_set_hl(0, "MarkviewList",     { fg = "#C0C0C0", bold = true })
    vim.api.nvim_set_hl(0, "MarkviewCheckbox", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "MarkviewCheckboxChecked",   { fg = "#98C379", bold = true })
    vim.api.nvim_set_hl(0, "MarkviewCheckboxUnchecked", { fg = "#E06C75", bold = true })




    end,
}

