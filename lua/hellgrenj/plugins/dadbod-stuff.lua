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
  },
}

