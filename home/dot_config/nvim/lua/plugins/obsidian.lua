return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "obsidian-vault-main",
        path = "/Users/ab/Library/Mobile Documents/iCloud~md~obsidian/Documents/obsidian-vault-main",
      },
    },


    disable_frontmatter = true,

    -- Set default notes directory
    notes_subdir = "01-zettelkasten",
    new_notes_location = "notes_subdir",

    -- Option for ObsidianNew
    note_id_func = function(title)
      if title == nil or title == '' then
        error("File name is required.")
      end
      return title
    end,

    templates = {
      subdir = "_templates"
    },

    preferred_link_style = "wiki",

    -- Prefix with timestamp
    image_name_func = function()
      return string.format("%s-", os.date("%Y%m%d%H%M%S"))
    end,

		-- Options for ObsidianPasteImg
    attachments = {
			-- Default folder
      img_folder = "_attachments",

			-- Output string format
      img_text_func = function(client, path)
        local link_path_str
        local vault_relative_path = client:vault_relative_path(path)

        if vault_relative_path ~= nil then
          -- Convert the `obsidian.Path` object to a string
          link_path_str = tostring(vault_relative_path)
        else
          -- If `vault_relative_path` is `nil`, convert the original `path` to a string
          link_path_str = tostring(path)
        end

        local display_name = vim.fs.basename(link_path_str)
        return string.format("![[%s]]", display_name)
      end,
    },
  },
}
