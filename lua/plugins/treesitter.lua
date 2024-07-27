return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"RRethy/nvim-treesitter-textsubjects",
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		---@diagnostic disable-next-line
		treesitter.setup({
			ensure_installed = {
				"bash",
				"css",
				"dockerfile",
				"graphql",
				"hcl",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"php",
				"python",
				"regex",
				"regex",
				"ruby",
				"rust",
				"scss",
				"sql",
				"terraform",
				"tsx",
				"typescript",
				"vim",
				"yaml",
			},
			highlight = {
				enable = true,
			},
			match = {
				enable = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "zi",
					node_incremental = "zi",
					scope_incremental = "zo",
					node_decremental = "zd",
				},
			},
			indent = {
				enable = true,
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>rp"] = "@parameter.inner",
				},
				swap_previous = {
					["<leader>rP"] = "@parameter.inner",
				},
			},
			textsubjects = {
				enable = true,
				keymaps = {
					["."] = "textsubjects-smart",
					[";"] = "textsubjects-container-outer",
					["i;"] = "textsubjects-container-inner",
				},
			},
		})

		local r = require("utils.remaps")
		r.noremap("n", "<leader>dp", function()
			vim.treesitter.inspect_tree({ command = "botright 60vnew" })
		end, "treesitter playground")

		r.noremap("n", "<C-e>", function()
			local result = vim.treesitter.get_captures_at_cursor(0)
			print(vim.inspect(result))
		end, "show treesitter capture group")

		r.map_virtual("zi", "init selection")
		r.map_virtual("zi", "expand node")
		r.map_virtual("zo", "expand scope")
		r.map_virtual("zd", "decrement scope")

		r.map_virtual("<leader>rp", "swap parameter to next")
		r.map_virtual("<leader>rP", "swap parameter to previous")
		end,
	build = function()
		vim.cmd [[TSUpdate]]
	end,
}
