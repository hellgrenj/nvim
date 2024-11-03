local popclock_dir = vim.fn.expand("~/popclock.nvim")
if vim.fn.isdirectory(popclock_dir) ~= 0 then
    -- Return the plugin configuration if the directory exists
    return {
        dir = popclock_dir,
        config = function()
            require("popclock").setup({ name = "Clock" })
        end
    }
else
    return {}
end
