local ls = require("luasnip")  -- LuaSnip's main module
local s = ls.snippet           -- Function to create a snippet
local t = ls.text_node         -- Static text
local i = ls.insert_node       -- Placeholder/Insert point where the user can type
local fmt = require("luasnip.extras.fmt").fmt  -- For formatting snippets

-- Define a snippet
local my_first_snippet = s("fn",  -- Trigger text
  fmt("def {}({}):\n    {}", {    -- Snippet content with placeholders
    i(1, "function_name"),  -- Placeholder 1
    i(2, "args"),           -- Placeholder 2
    i(0)                    -- The final placeholder (jumped to after the last one)
  })
)

-- Return a list of snippets
return {
  my_first_snippet,
  -- Add more snippets here
}

