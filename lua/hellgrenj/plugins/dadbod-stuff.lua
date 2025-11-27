-- return {
--   {
--     'tpope/vim-dadbod',
--     dependencies = {
--       'kristijanhusak/vim-dadbod-ui',
--       'kristijanhusak/vim-dadbod-completion',
--     },
--     init = function()
--       -- Enable Nerd Font icons in DBUI
--       vim.g.db_ui_use_nerd_fonts = 1
--     end,
--   },
-- }
--
--
return {
  {
    'tpope/vim-dadbod',
    dependencies = {
      'kristijanhusak/vim-dadbod-ui',
      'kristijanhusak/vim-dadbod-completion',
    },
    init = function()
      -- Enable Nerd Font icons in DBUI
      vim.g.db_ui_use_nerd_fonts = 1
    end,
    config = function()
      -- Make dadbod output (dbout) readable: real columns, no folding/wrapping
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "dbout",
        callback = function()
          vim.opt_local.wrap = false        -- don't wrap lines
          vim.opt_local.foldenable = false  -- disable folds
          vim.opt_local.list = false        -- hide · and other listchars
        end,
      })
    end,
  },
}

