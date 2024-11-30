return {
  "hellgrenj/popclock.nvim",
  config = function()
    require("popclock").setup({
      key_binding = "<leader>kl", -- Default: <leader>kl
      position = "top",       -- Default: 'center'
      fgcolor = "#b5befe",       -- Default: '#b5befe'
      bgcolor = nil,       -- Default: nil (transparent)
    })
  end,
}

