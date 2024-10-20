return {
  -- add other themes here
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
  },

  {
    "catppuccin/nvim",
    lazy = false,
  },

  -- Configure LazyVim to load catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
  },
}
