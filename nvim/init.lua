vim.hl = vim.highlight

require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>")

vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>")

vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "grn", vim.lsp.buf.rename)
