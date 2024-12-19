local calendar_dir = vim.fn.expand("~/local-nvim-plugins/mcal.nvim")
if vim.fn.isdirectory(calendar_dir) ~= 0 then
    -- Return the plugin configuration if the directory exists
    return {
        dir = calendar_dir,
        config = function()
            require("mcal").setup()
        end,
    }
else
    return {}
end
