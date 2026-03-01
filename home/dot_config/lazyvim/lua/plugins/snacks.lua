return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      -- global picker window config
      win = {
        input = {
          keys = {
            ["<c-h>"] = { "toggle_hidden", mode = { "i", "n" } },
            ["<S-H>"] = { "toggle_hidden", mode = { "i", "n" } },
          },
        },
      },

      -- per-source overrides
      sources = {
        notifications = {
          win = {
            preview = {
              wo = {
                wrap = true,
              },
            },
          },
        },
      },
    },
  },
}
