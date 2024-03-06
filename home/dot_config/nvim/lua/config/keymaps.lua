-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- change lazy keybinds
local Util = require("lazyvim.util")
vim.keymap.del("n", "<leader>l")
vim.keymap.set("n", "<leader>Ll", "<cmd>Lazy<cr>", { desc = "Lazy" })
vim.keymap.set("n", "<leader>Lc", function() Util.news.changelog() end, { desc = "LazyVim Changelog" })

-- obsidian.nvim
vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Open note" })
vim.keymap.set("n", "<leader>oO", "<cmd>ObsidianOpen<CR>", { desc = "Open note in obsidian" })
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "New note" })
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search notes" })
vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLink<CR>", { desc = "Link existing note" })
vim.keymap.set("n", "<leader>oL", "<cmd>ObsidianLinkNew<CR>", { desc = "Create and link new note" })
vim.keymap.set("n", "<leader>oe", "<cmd>ObsidianExtractNote<CR>", { desc = "Extract selection to new note" })
vim.keymap.set("n", "<leader>op", "<cmd>ObsidianPasteImg<CR>", { desc = "Paste image" })
vim.keymap.set("n", "<leader>oi", "<cmd>ObsidianTemplate<CR>", { desc = "Insert template" })

-- vimtex
vim.keymap.set("n", "<leader>li", "<plug>(vimtex-info)", { desc = "View Info" })
-- vim.keymap.set("n", "<leader>lI", "<plug>(vimtex-info-full)", { desc = "View Full Info" })
vim.keymap.set("n", "<leader>lt", "<plug>(vimtex-toc-open)", { desc = "Open Table of Contents" })
vim.keymap.set("n", "<leader>lT", "<plug>(vimtex-toc-toggle)", { desc = "Toggle Table of Contents" })
vim.keymap.set("n", "<leader>lq", "<plug>(vimtex-log)", { desc = "View Log" })
vim.keymap.set("n", "<leader>lv", "<plug>(vimtex-view)", { desc = "View Compiled Document" })
vim.keymap.set("n", "<leader>lr", "<plug>(vimtex-reverse-search)", { desc = "Reverse Search" })
vim.keymap.set("n", "<leader>ll", "<plug>(vimtex-compile)", { desc = "Compile" })
-- vim.keymap.set("n", "<leader>lL", "<plug>(vimtex-compile-selected)", { desc = "Compile Selected" })
vim.keymap.set("n", "<leader>lk", "<plug>(vimtex-stop)", { desc = "Stop Compilation" })
-- vim.keymap.set("n", "<leader>lK", "<plug>(vimtex-stop-all)", { desc = "Stop All Compilation" })
vim.keymap.set("n", "<leader>le", "<plug>(vimtex-errors)", { desc = "View Errors" })
vim.keymap.set("n", "<leader>lo", "<plug>(vimtex-compile-output)", { desc = "View Compile Output" })
vim.keymap.set("n", "<leader>lg", "<plug>(vimtex-status)", { desc = "View Status" })
-- vim.keymap.set("n", "<leader>lG", "<plug>(vimtex-status-all)", { desc = "View Status (All)" })
vim.keymap.set("n", "<leader>lc", "<plug>(vimtex-clean)", { desc = "Clean" })
vim.keymap.set("n", "<leader>lC", "<plug>(vimtex-clean-full)", { desc = "Clean Full" })
-- vim.keymap.set("n", "<leader>lm", "<plug>(vimtex-imaps-list)", { desc = "List of Maps" })
-- vim.keymap.set("n", "<leader>lx", "<plug>(vimtex-reload)", { desc = "Reload" })
-- vim.keymap.set("n", "<leader>lX", "<plug>(vimtex-reload-state)", { desc = "Reload State" })
vim.keymap.set("n", "<leader>ls", "<plug>(vimtex-toggle-main)", { desc = "Toggle Main" })
vim.keymap.set("n", "<leader>la", "<plug>(vimtex-context-menu)", { desc = "Context Menu" })


-- to adjust which-key configuration
require("config/which-key")


