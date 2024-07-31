local f = require("utils.functions")
local r = require("utils.remaps")

-- buffers
r.noremap("n", "<c-n>", ":bn<cr>", "next buffer")
r.noremap("n", "<c-p>", ":bp<cr>", "prev buffer")
r.noremap("n", "<c-x>", ":bd<cr>", "exit buffer")
r.noremap("n", "<c-b>", ":enew<cr>", "new buffer")

-- tabs
r.noremap("n", "<leader><tab>j", "<cmd>tablast<cr>",  "Last Tab" )
r.noremap("n", "<leader><tab>h", "<cmd>tabfirst<cr>", "First Tab" )
r.noremap("n", "<s-tab>", "<cmd>tabprevious<cr>", "Previous Tab" )
r.noremap("n", "<C-Tab>", "<cmd>tabnext<cr>", "Next Tab" )
r.noremap("n", "<leader><tab>q", "<cmd>tabclose<cr>", "Close Tab" )
r.noremap("n", "<c-q>", "<cmd>tabclose<cr>", "Close Tab" )
r.noremap("n", "<c-t>", "<cmd>tabnew<cr>",  "New Tab" )

r.noremap('n', '<C-J>', '<C-W><C-J>', 'Move to window below')
r.noremap('n', '<C-K>', '<C-W><C-K>', 'Move to window above')
r.noremap('n', '<C-L>', '<C-W><C-L>', 'Move to window to the right')
r.noremap('n', '<C-H>', '<C-W><C-H>', 'Move to window to the left')

---- JSON pretty print
r.noremap("n", "<leader>j", ":%!jq .<cr>", "jq format")

-- remove highlighting
r.noremap("n", "<esc><esc>", ":nohlsearch<cr>", "remove highlighting", { silent = true })

-- remove trailing white space
f.cmd("Nows", "%s/\\s\\+$//e", { desc = "remove trailing whitespace" })

-- remove blank lines
f.cmd("Nobl", "g/^\\s*$/d", { desc = "remove blank lines" })

-- spell check
f.cmd("Sp", "setlocal spell! spell?", { desc = "toggle spell check" })
r.noremap("n", "<leader>s", ":Sp<cr>", "toggle spell check")

-- pseudo tail functionality
f.cmd("Tail", 'set autoread | au CursorHold * checktime | call feedkeys("G")', { desc = "pseudo tail functionality" })

-- make current buffer executable
f.cmd("Chmodx", "!chmod a+x %", { desc = "make current buffer executable" })
r.noremap("n", "<leader>x", ":Chmodx<cr>", "chmod +x buffer")

-- fix syntax highlight
f.cmd("FixSyntax", "syntax sync fromstart", { desc = "reload syntax highlighting" })

-- ToggleTerm commands
--
vim.api.nvim_set_keymap('n', '<leader>1', [[ToggleTerm 1]], { noremap = true, silent = true })
r.noremap('n', '<leader>Tp', ':TermExec direction=vertical dir=% cmd="source %:p:h/venv/bin/activate && clear" size=20 name=py<CR>', "Open (py) terminal and source venv")
r.noremap('n', '<leader>1', ':1ToggleTerm Size=15 <CR>', "Open terminal 1")
r.noremap('n', '<leader>2', ':2ToggleTerm Size=15 <CR>', "Open terminal 2")
r.noremap('n', '<leader>3', ':3ToggleTerm Size=15 <CR>', "Open terminal 3")

local tt_opts = {buffer = 0}

r.noremap('t', '<C-h>', "<Cmd>wincmd h<CR>", "", tt_opts)
r.noremap('t', '<C-j>', "<Cmd>wincmd j<CR>", "", tt_opts)
r.noremap('t', '<C-k>', "<Cmd>wincmd k<CR>", "", tt_opts)
r.noremap('t', '<C-l>', "<Cmd>wincmd l<CR>", "", tt_opts)

vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
-- r.noremap('t', '<Esc>', [[<C-\><C-n>]], "", tt_opts)

-- the worst place in the universe
r.noremap("n", "Q", "<nop>", "")

-- move blocks
r.noremap("v", "J", ":m '>+1<CR>gv=gv", "move block up")
r.noremap("v", "K", ":m '<-2<CR>gv=gv", "move block down")

-- focus scrolling
r.noremap("n", "<C-d>", "<C-d>zz", "scroll down")
r.noremap("n", "<C-u>", "<C-u>zz", "scroll up")

-- focus highlight searches
r.noremap("n", "n", "nzzzv", "next match")
r.noremap("n", "N", "Nzzzv", "prev match")

-- remove trailing whitespaces and ^M chars
f.autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	callback = function(_)
		local save_cursor = vim.fn.getpos(".")
		vim.cmd [[%s/\s\+$//e]]
		vim.fn.setpos(".", save_cursor)
	end,
})
