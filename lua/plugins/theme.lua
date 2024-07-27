return {
	'RRethy/base16-nvim',
	config = function()
		-- Set the colorscheme
		vim.cmd('let base16colorspace=256')
		vim.cmd('colorscheme base16-synth-midnight-dark')
	end
}
