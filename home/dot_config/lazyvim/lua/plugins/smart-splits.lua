return {
  "mrjones2014/smart-splits.nvim",
  lazy = false,
  keys = {
    {
      "<c-h>",
      function()
        require("smart-splits").move_cursor_left()
      end,
      mode = "n",
      desc = "Move left",
    },
    {
      "<c-j>",
      function()
        require("smart-splits").move_cursor_down()
      end,
      mode = "n",
      desc = "Move down",
    },
    {
      "<c-k>",
      function()
        require("smart-splits").move_cursor_up()
      end,
      mode = "n",
      desc = "Move up",
    },
    {
      "<c-l>",
      function()
        require("smart-splits").move_cursor_right()
      end,
      mode = "n",
      desc = "Move right",
    },
  },
}
