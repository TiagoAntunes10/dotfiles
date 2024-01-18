-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Options
lvim.use_icons = true
vim.opt.relativenumber = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false

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
-- Move the selected lines together
lvim.keys.visual_mode["J"] = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode["K"] = ":m '<-2<CR>gv=gv"
lvim.keys.insert_mode["C-c"] = "<Esc>"
lvim.keys.normal_mode["C-s"] = ":w<CR>"
lvim.keys.normal_mode["<leader>h"] = ":split<CR>"
lvim.keys.normal_mode["<leader>v"] = ":vsplit<CR>"

-- Takes the line below and appends it to the line above, but keeping the
-- cursor in the same spot
lvim.keys.normal_mode["J"] = "mzJ`z"

-- Half page jumping with the cursor in the middle
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"

-- Leave search terms in the middle
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"

-- Paste without losing the current buffer
lvim.keys.visual_mode["<leader>p"] = [["_dP]]

-- Copy to the system clipboard
lvim.keys.normal_mode["<leader>y"] = [["+y]]
lvim.keys.visual_mode["<leader>y"] = [["+y]]
lvim.keys.normal_mode["<leader>Y"] = [["+Y]]

-- Delete to void register
lvim.keys.normal_mode["<leader>d"] = [["_d]]
lvim.keys.visual_mode["<leader>d"] = [["_d]]

lvim.keys.normal_mode["Q"] = "<nop>"

-- Switch between projects using tmux
lvim.keys.normal_mode["<C-f>"] = "<cmd>silent !tmux neww tmux-sessionizer<CR>"
-- lvim.keys.normal_mode["<leader>f"] = vim.lsp.buf.format

-- Quick fix navigation
lvim.keys.normal_mode["<C-k>"] = "<cmd>cnext<CR>zz"
lvim.keys.normal_mode["<C-j>"] = "<cmd>cprev<CR>zz"
lvim.keys.normal_mode["<leader>k"] = "<cmd>lnext<CR>zz"
lvim.keys.normal_mode["<leader>j"] = "<cmd>lprev<CR>zz"

-- Replace the word you are on
lvim.keys.normal_mode["<leader>s"] = [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]

-- Change the file to a executable file (for bash files)
lvim.keys.normal_mode["<leader>x"] = "<cmd>!chmod +x %<CR>"

lvim.keys.normal_mode["<leader><leader>"] = function()
	vim.cmd("so")
end

-- Open Undotree
lvim.keys.normal_mode["<leader>u"] = ":UndotreeToggle<CR>"

-- Enter vim-fugitive
lvim.keys.normal_mode["<leader>gt"] = ":Git<CR>"

-- Fuzzy finder
local builtin = require('telescope.builtin')
lvim.keys.normal_mode["<leader>pf"] = builtin.find_files
lvim.keys.normal_mode["<C-p>"] = builtin.git_files
lvim.keys.normal_mode["<leader>pv"] = function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end
lvim.keys.normal_mode["<leader>vh"] = builtin.help_tags

-- Plugins
lvim.plugins = {
	{ "mbbill/undotree" },
	{ "tpope/vim-fugitive" },
	{ "42Paris/42header" }
}
