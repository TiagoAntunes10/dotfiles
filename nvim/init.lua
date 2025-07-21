vim.hl = vim.highlight

require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.expandtab = false
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard = "unnamedplus"

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. ("/.vim/undodir")
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- Keymaps
--
-- Shortcut to open Oilvim
vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>")

-- Quick fix navigation
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>")

-- get all references
vim.keymap.set("n", "gr", vim.lsp.buf.references)

-- rename all references
vim.keymap.set("n", "grn", vim.lsp.buf.rename)

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Move the selected lines together
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("i", "C-c", "<Esc>")
vim.keymap.set("n", "C-s", ":w<CR>")
vim.keymap.set("n", "<leader>h", ":split<CR>")
vim.keymap.set("n", "<leader>v", ":vsplit<CR>")

-- Takes the line below and appends it to the line above, but keeping the
-- cursor in the same spot
vim.keymap.set("n", "J", "mzJ'z")

-- Half page jumping with the cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Leave search terms in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without losing the current buffer
vim.keymap.set("v", "<leader>p", [["_dP]])

-- Copy to the system clipboard
vim.keymap.set("n", "<leader>y", [["+y]])
vim.keymap.set("v", "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to void register
vim.keymap.set("n", "<leader>d", [["_d]])
vim.keymap.set("v", "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")

-- Switch between projects using tmux
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")


-- Replace the word you are on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Change the file to a executable file (for bash files)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>")

vim.keymap.set("n", "<leader><leader>",
	function()
		vim.cmd("so")
	end
)

-- Enter vim-fugitive
-- lvim.keys.normal_mode["<leader>gt"] = ":Git<CR>"

require('mini.comment').setup({
	-- Options which control module behavior
	options = {
		-- Function to compute custom 'commentstring' (optional)
		custom_commentstring = nil,

		-- Whether to ignore blank lines when commenting
		ignore_blank_line = false,

		-- Whether to recognize as comment only lines without indent
		start_of_line = false,

		-- Whether to force single space inner padding for comment parts
		pad_comment_parts = true,
	},

	-- Module mappings. Use `''` (empty string) to disable one.
	mappings = {
		-- Toggle comment (like `gcip` - comment inner paragraph) for both
		-- Normal and Visual modes
		comment = '<leader>/',

		-- Toggle comment on current line
		comment_line = '<leader>/',

		-- Toggle comment on visual selection
		comment_visual = '<leader>/',

		-- Define 'comment' textobject (like `dgc` - delete whole comment block)
		-- Works also in Visual mode if mapping differs from `comment_visual`
		textobject = '<leader>/',
	},

	-- Hook functions to be executed at certain stage of commenting
	hooks = {
		-- Before successful commenting. Does nothing by default.
		pre = function() end,
		-- After successful commenting. Does nothing by default.
		post = function() end,
	},
})

require('neogen').setup {
	enabled = true,          --if you want to disable Neogen
	input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
	-- jump_map = "<C-e>"       -- (DROPPED SUPPORT, see [here](#cycle-between-annotations) !) The keymap in order to jump in the annotation fields (in insert mode)
}
