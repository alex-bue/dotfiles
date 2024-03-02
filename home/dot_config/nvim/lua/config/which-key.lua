local wk = require("which-key")

wk.register({
  ["<leader>L"] = {
    name = "+lazy", -- Name of the prefix group
  },
  ["<leader>l"] = {
      name = "+vimtex", -- Name of the prefix group
      i = { "<plug>(vimtex-info)", "View Info" },
      I = { "<plug>(vimtex-info-full)", "View Full Info" },
      t = { "<plug>(vimtex-toc-open)", "Open Table of Contents" },
      T = { "<plug>(vimtex-toc-toggle)", "Toggle Table of Contents" },
      q = { "<plug>(vimtex-log)", "View Log" },
      v = { "<plug>(vimtex-view)", "View Compiled Document" },
      r = { "<plug>(vimtex-reverse-search)", "Reverse Search" },
      l = { "<plug>(vimtex-compile)", "Compile" },
      L = { "<plug>(vimtex-compile-selected)", "Compile Selected" },
      k = { "<plug>(vimtex-stop)", "Stop Compilation" },
      K = { "<plug>(vimtex-stop-all)", "Stop All Compilation" },
      e = { "<plug>(vimtex-errors)", "View Errors" },
      o = { "<plug>(vimtex-compile-output)", "View Compile Output" },
      g = { "<plug>(vimtex-status)", "View Status" },
      G = { "<plug>(vimtex-status-all)", "View Status (All)" },
      c = { "<plug>(vimtex-clean)", "Clean" },
      C = { "<plug>(vimtex-clean-full)", "Clean Full" },
      m = { "<plug>(vimtex-imaps-list)", "List of Maps" },
      x = { "<plug>(vimtex-reload)", "Reload" },
      X = { "<plug>(vimtex-reload-state)", "Reload State" },
      s = { "<plug>(vimtex-toggle-main)", "Toggle Main" },
      a = { "<plug>(vimtex-context-menu)", "Context Menu" },
    },
})
