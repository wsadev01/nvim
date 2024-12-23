return {
	-- "folke/trouble.nvim",
	"folke/trouble.nvim", -- till my pr is merged
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("trouble").setup({
			modes = {
				diagnostics = {
					auto_open = false,
					auto_close = true,
				},
			},
			warn_no_results = false,
			-- stylua: ignore
			icons = require("utils.icons").trouble,
		})
		local r = require("utils.remaps")
		r.noremap("n", "<leader>lr", ":Trouble lsp_references<cr>", "lsp references ")
		r.noremap("n", "<leader>le", ":Trouble document_diagnostics<cr>", "diagnostics")
		r.noremap("n", "<leader>t", function()
			require("lsp_lines").toggle()
			vim.cmd [[Trouble diagnostics]]
		end, "toggle trouble  ")
	end,
}
