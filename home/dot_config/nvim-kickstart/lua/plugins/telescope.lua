return { -- Fuzzy Finder (files, lsp, etc)
	-- NOTE: Plugins can specify dependencies.
	--
	-- The dependencies are proper plugin specifications as well - anything
	-- you do for a plugin at the top level, you can do for a dependency.
	--
	-- Use the `dependencies` key to specify the dependencies of a particular plugin
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			"nvim-telescope/telescope-fzf-native.nvim",

			-- `build` is used to run some command when the plugin is installed/updated.
			-- This is only run then, not every time Neovim starts up.
			build = "make",

			-- `cond` is a condition used to determine whether this plugin should be
			-- installed and loaded.
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },

		-- Useful for getting pretty icons, but requires a Nerd Font.
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		-- Telescope is a fuzzy finder that comes with a lot of different things that
		-- it can fuzzy find! It's more than just a "file finder", it can search
		-- many different aspects of Neovim, your workspace, LSP, and more!
		--
		-- The easiest way to use Telescope, is to start by doing something like:
		--  :Telescope help_tags
		--
		-- After running this command, a window will open up and you're able to
		-- type in the prompt window. You'll see a list of `help_tags` options and
		-- a corresponding preview of the help.
		--
		-- Two important keymaps to use while in Telescope are:
		--  - Insert mode: <c-/>
		--  - Normal mode: ?
		--
		-- This opens a window that shows you all of the keymaps for the current
		-- Telescope picker. This is really useful to discover what Telescope can
		-- do as well as how to actually do it!

		-- [[ Configure Telescope ]]
		-- See `:help telescope` and `:help telescope.setup()`
		require("telescope").setup({
			-- You can put your default mappings / updates / etc. in here
			--  All the info you're looking for is in `:help telescope.setup()`
			--
			-- defaults = {
			--   mappings = {
			--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
			--   },
			-- },
			-- pickers = {}
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		-- See `:help telescope.builtin`
		local builtin = require("telescope.builtin")
		-- find
		vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Find Files" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
		vim.keymap.set("n", "<leader>bb", builtin.buffers, { desc = "Find existing buffers" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find existing buffers" })
		vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Find Resume" })
		vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = 'Find Recent Files ("." for repeat)' })
		-- Find your Neovim configuration files
		vim.keymap.set("n", "<leader>fc", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Find config files (neovim)" })
		-- search
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search Help" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "Search Select Telescope" })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search current Word" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search by Grep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search Diagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Search Resume" })

		-- Slightly advanced example of overriding default behavior and theme
		vim.keymap.set("n", "<leader>sb", function()
			-- You can pass additional configuration to Telescope to change the theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "Search (fuzzy) in current buffer" })

		-- It's also possible to pass additional configuration options.
		--  See `:help telescope.builtin.live_grep()` for information about particular keys
		vim.keymap.set("n", "<leader>sf", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "Search in Open Files" })
	end,
}
