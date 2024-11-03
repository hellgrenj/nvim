return {
    "sindrets/diffview.nvim",
    config = function()
        local diffview = require('diffview')
        local is_diffview_open = false -- diffview does not expose an is_open()
        vim.keymap.set('n', '<leader>dv', function()
            if is_diffview_open then
                diffview.close()
                is_diffview_open = false
            else
                diffview.open()
                is_diffview_open = true
            end
        end)
    end
}

