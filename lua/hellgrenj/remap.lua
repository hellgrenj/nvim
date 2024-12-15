-- remaps of stuff that is not related to a single plugin (those remaps are defined in the plugin's config)

-- netrw dir listing
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move down/up half a page and center in the middle
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true })

-- quickfix up and down
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
