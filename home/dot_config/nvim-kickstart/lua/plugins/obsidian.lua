return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- see below for full list of optional dependencies
  },
  config = function()
    vim.keymap.set('n', '<leader>oo', '<cmd>ObsidianQuickSwitch<CR>', { desc = 'Open note' })
    vim.keymap.set('n', '<leader>oO', '<cmd>ObsidianOpen<CR>', { desc = 'Open note in obsidian' })
    vim.keymap.set('n', '<leader>on', '<cmd>ObsidianNew<CR>', { desc = 'New note' })
    vim.keymap.set('n', '<leader>os', '<cmd>ObsidianSearch<CR>', { desc = 'Search notes' })
    vim.keymap.set('n', '<leader>ol', '<cmd>ObsidianLink<CR>', { desc = 'Link existing note' })
    vim.keymap.set('n', '<leader>oL', '<cmd>ObsidianLinkNew<CR>', { desc = 'Create and link new note' })
    vim.keymap.set('n', '<leader>oe', '<cmd>ObsidianExtractNote<CR>', { desc = 'Extract selection to new note' })
    vim.keymap.set('n', '<leader>op', '<cmd>ObsidianPasteImg<CR>', { desc = 'Paste image' })
    vim.keymap.set('n', '<leader>oi', '<cmd>ObsidianTemplate<CR>', { desc = 'Insert template' })

    vim.keymap.set('v', '<leader>ol', '<cmd>ObsidianLink<CR>', { desc = 'Link existing note' })
    vim.keymap.set('v', '<leader>oL', '<cmd>ObsidianLinkNew<CR>', { desc = 'Create and link new note' })
  end,
  opts = {
    workspaces = {
      {
        name = 'obsidian-vault-main',
        path = '/Users/ab/Library/Mobile Documents/iCloud~md~obsidian/Documents/obsidian-vault-main',
      },
    },

    -- Default frontmatter
    disable_frontmatter = false,
    note_frontmatter_func = function(note)
      -- Start constructing the frontmatter table.
      local out = {
        aliases = note.aliases,
        tags = note.tags,
        created = os.date '%Y-%m-%d',
        index = {
          '[[]]',
        },
      }

      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- Merge those fields into the frontmatter, ensuring they are kept.
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end

      return out
    end,

    -- Set default notes directory
    notes_subdir = '01-zettelkasten',
    new_notes_location = 'notes_subdir',

    -- Option for ObsidianNew
    note_id_func = function(title)
      if title == nil or title == '' then
        error 'File name is required.'
      end
      return title
    end,

    templates = {
      subdir = '_templates',
    },

    preferred_link_style = 'wiki',

    -- Open URL in default browser
    follow_url_func = function(url)
      vim.fn.jobstart { 'open', url }
    end,

    -- Prefix with timestamp
    image_name_func = function()
      return string.format('%s-', os.date '%Y%m%d%H%M%S')
    end,

    -- Options for ObsidianPasteImg
    attachments = {
      -- Default folder
      img_folder = '_attachments',

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
        return string.format('![[%s]]', display_name)
      end,
    },
  },
}
