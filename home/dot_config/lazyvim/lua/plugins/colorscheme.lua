return {
  -- add other themes here
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
  },

  {
    "catppuccin/nvim",
    lazy = false,
    opts = {
      transparent_background = true,
    },
  },

  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.everforest_background = "medium"
      vim.g.everforest_transparent_background = 2
      vim.g.everforest_ui_contrast = "low"
      vim.g.everforest_current_word = "high contrast background"
      vim.g.everforest_diagnostic_line_highlight = 1
      vim.g.everforest_diagnostic_virtual_text = "colored"
      vim.cmd.colorscheme("everforest")
    end,
  },

  -- Configure LazyVim to load catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
}
