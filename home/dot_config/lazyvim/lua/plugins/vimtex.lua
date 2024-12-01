return {
  "lervag/vimtex",
  config = function()
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_quickfix_open_on_warning = 0
  end,
  keys = {
    { "<leader>li", "<plug>(vimtex-info)", desc = "View Info" },
    { "<leader>lI", "<plug>(vimtex-info-full)", desc = "View Full Info" },
    { "<leader>lt", "<plug>(vimtex-toc-open)", desc = "Open Table of Contents" },
    { "<leader>lT", "<plug>(vimtex-toc-toggle)", desc = "Toggle Table of Contents" },
    { "<leader>lq", "<plug>(vimtex-log)", desc = "View Log" },
    { "<leader>lv", "<plug>(vimtex-view)", desc = "View Compiled Document" },
    { "<leader>lr", "<plug>(vimtex-reverse-search)", desc = "Reverse Search" },
    { "<leader>ll", "<plug>(vimtex-compile)", desc = "Compile" },
    { "<leader>lL", "<plug>(vimtex-compile-selected)", desc = "Compile Selected" },
    { "<leader>lk", "<plug>(vimtex-stop)", desc = "Stop Compilation" },
    { "<leader>lK", "<plug>(vimtex-stop-all)", desc = "Stop All Compilation" },
    { "<leader>le", "<plug>(vimtex-errors)", desc = "View Errors" },
    { "<leader>lo", "<plug>(vimtex-compile-output)", desc = "View Compile Output" },
    { "<leader>lg", "<plug>(vimtex-status)", desc = "View Status" },
    { "<leader>lG", "<plug>(vimtex-status-all)", desc = "View Status (All)" },
    { "<leader>lc", "<plug>(vimtex-clean)", desc = "Clean" },
    { "<leader>lC", "<plug>(vimtex-clean-full)", desc = "Clean Full" },
    { "<leader>lm", "<plug>(vimtex-imaps-list)", desc = "List of Maps" },
    { "<leader>lx", "<plug>(vimtex-reload)", desc = "Reload" },
    { "<leader>lX", "<plug>(vimtex-reload-state)", desc = "Reload State" },
    { "<leader>ls", "<plug>(vimtex-toggle-main)", desc = "Toggle Main" },
    { "<leader>la", "<plug>(vimtex-context-menu)", desc = "Context Menu" },
  },
}
