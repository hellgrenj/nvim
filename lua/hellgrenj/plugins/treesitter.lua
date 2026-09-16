return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install({
            "vimdoc",
            "javascript",
            "typescript",
            "c",
            "lua",
            "rust",
            "jsdoc",
            "bash",
            "go",
            "markdown",
            "markdown_inline",
        })

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                if pcall(vim.treesitter.start, args.buf) then
                    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    if vim.bo[args.buf].filetype == "markdown" then
                        vim.bo[args.buf].syntax = "on"
                    end
                end
            end,
        })
    end,
}
