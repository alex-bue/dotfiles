return {
  "L3MON4D3/LuaSnip",
  config = function ()
    -- Load my snippets
    require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/luasnippets"})

    -- Set LuaSnip config options
    require("luasnip").config.set_config({
      enable_autosnippets = true,
      -- Use <Tab> to trigger visual selection
      store_selection_keys = "<tab>",
    })
  end,
  keys = {
    {
      "<tab>",
      function()
        if require("luasnip").expand_or_jumpable() then
          return "<Plug>luasnip-expand-or-jump"
        else
          return "<tab>"
        end
      end,
      expr = true,
      silent = true,
      mode = "i",
    },
    { "<C-f>", function() require("luasnip").jump(1) end, mode = {"i", "s"} },
  }
}
