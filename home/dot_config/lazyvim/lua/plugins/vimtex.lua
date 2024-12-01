return {
  "lervag/vimtex",
  config = function()
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_quickfix_open_on_warning = 0
  end,
  keys = {
    -- vimtex
    -- { "n", "<leader>li", "<plug>(vimtex-info)", { desc = "View Info" } },
    -- { "n", "<leader>lI", "<plug>(vimtex-info-full)", { desc = "View Full Info" } },
    -- { "n", "<leader>lt", "<plug>(vimtex-toc-open)", { desc = "Open Table of Contents" } },
    -- { "n", "<leader>lT", "<plug>(vimtex-toc-toggle)", { desc = "Toggle Table of Contents" } },
    -- { "n", "<leader>lq", "<plug>(vimtex-log)", { desc = "View Log" } },
    -- { "n", "<leader>lv", "<plug>(vimtex-view)", { desc = "View Compiled Document" } },
    -- { "n", "<leader>lr", "<plug>(vimtex-reverse-search)", { desc = "Reverse Search" } },
    -- { "n", "<leader>ll", "<plug>(vimtex-compile)", { desc = "Compile" } },
    -- { "n", "<leader>lL", "<plug>(vimtex-compile-selected)", { desc = "Compile Selected" } },
    -- { "n", "<leader>lk", "<plug>(vimtex-stop)", { desc = "Stop Compilation" } },
    -- { "n", "<leader>lK", "<plug>(vimtex-stop-all)", { desc = "Stop All Compilation" } },
    -- { "n", "<leader>le", "<plug>(vimtex-errors)", { desc = "View Errors" } },
    -- { "n", "<leader>lo", "<plug>(vimtex-compile-output)", { desc = "View Compile Output" } },
    -- { "n", "<leader>lg", "<plug>(vimtex-status)", { desc = "View Status" } },
    -- { "n", "<leader>lG", "<plug>(vimtex-status-all)", { desc = "View Status (All)" } },
    -- { "n", "<leader>lc", "<plug>(vimtex-clean)", { desc = "Clean" } },
    -- { "n", "<leader>lC", "<plug>(vimtex-clean-full)", { desc = "Clean Full" } },
    -- { "n", "<leader>lm", "<plug>(vimtex-imaps-list)", { desc = "List of Maps" } },
    -- { "n", "<leader>lx", "<plug>(vimtex-reload)", { desc = "Reload" } },
    -- { "n", "<leader>lX", "<plug>(vimtex-reload-state)", { desc = "Reload State" } },
    -- { "n", "<leader>ls", "<plug>(vimtex-toggle-main)", { desc = "Toggle Main" } },
    -- { "n", "<leader>la", "<plug>(vimtex-context-menu)", { desc = "Context Menu" } },
  },
}
