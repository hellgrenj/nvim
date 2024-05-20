local simpledash_dir = vim.fn.expand("~/simpledash_cli.nvim")
if vim.fn.isdirectory(simpledash_dir) ~= 0 then
    -- Return the plugin configuration if the directory exists
    return {
        dir = simpledash_dir, 
        config = function()
            require("simpledash_cli").setup()
        end
    }
else
    -- Return nil if the directory does not exist, thus not loading the plugin
    return nil
end

