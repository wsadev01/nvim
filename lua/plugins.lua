local pluginspath = vim.fn.stdpath("data") .. "/lazy"
local lazypath = pluginspath .. "/lazy.nvim"

-- Install lazy
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	print("lazy just installed, please restart neovim")
	return
end

-- Install plugins
lazy.setup({
	spec = {
		require("plugins.alpha"),
		require("plugins.ansi"),
		require("plugins.chadtree"),
		require("plugins.cmp"),
		require("plugins.colorizer"),
		require("plugins.devicons"),
		require("plugins.fzf"),
		require("plugins.gitsigns"),
		require("plugins.guess-indent"),
		require("plugins.increname"),
		require("plugins.indent"),
		require("plugins.lsp"),
		require("plugins.lualine"),
		require("plugins.luasnip"),
		require("plugins.mason"),
		require("plugins.mason-dap"),
		require("plugins.matchparen"),
		require('plugins.nvim-ts-autotag'),
		require("plugins.osc52-yank"),
		require('plugins.remember'),
		require("plugins.scrollbar"),
		require("plugins.terminal"),
		require("plugins.tmux"),
		require("plugins.theme"),
		require("plugins.tint"),
		require("plugins.toggleterm"),
		require("plugins.treesitter"),
		require("plugins.trouble"),
		require("plugins.surround"),
	},
	dev = {
		path = "~/.local/src",
	},
	lockfile = vim.fn.stdpath("config") .. "/lua/plugins/lazy-lock.json",
	ui = {
		size = { width = 0.8, height = 0.8 },
		wrap = true,
		border = "shadow",
		icons = require("utils.icons").lazy,
	},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true,
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

require("toggleterm").setup{size=15, direction=vertical,on_open=function()vim.cmd("startinsert")end}
require("remember").setup{}

