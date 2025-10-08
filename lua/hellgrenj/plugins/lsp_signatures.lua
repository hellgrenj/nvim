-- lua/plugins/lsp_signature.lua
return {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  opts = {
    -- UI/behavior
    floating_window = true,          -- show a small float near cursor
    hint_enable = false,             -- disable inline virtual-text hints (less noisy)
    fix_pos = true,
    handler_opts = { border = "rounded" },
    zindex = 50,

    -- cycle to the next overload
    select_signature_key = "<C-j>",
  },
}

