local popclock_dir = vim.fn.expand("~/popclock.nvim")
if vim.fn.isdirectory(popclock_dir) ~= 0 then
    -- Return the plugin configuration if the directory exists
    return {
        dir = popclock_dir,
        config = function()
            -- require("popclock").setup({ key_binding = "<leader>kl", position = "center", bgcolor="#FFFFFF", fgcolor="#000000" })
            require("popclock").setup({key_binding = "<leader>kl"})
        end
    }
else
    return {}
end
