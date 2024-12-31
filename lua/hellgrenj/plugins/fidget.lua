return {
    "j-hui/fidget.nvim",
    config = function()
        require('fidget').setup({
            -- Options related to notification subsystem
            notification = {
                override_vim_notify = true
            },
        })
    end
}
