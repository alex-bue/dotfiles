return {
		"catppuccin/nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		name = "catppuccin",
		lazy = false,
		opts = {
		-- enable more integrations if needed
		integrations = {
			gitsigns = true,
			mason = true,
			mini = true,
			native_lsp = {
				enabled = true,
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
			},
			neotree = true,
			noice = true,
			notify = true,
			semantic_tokens = true,
			treesitter = true,
			which_key = true,
		},
		 },
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin-frappe")
	end,
	}
