-- TODO: Finish Neogen implementation
local opts = { noremap = true, silent = true }

return {
  "danymat/neogen",
  config = true,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
  vim.keymap.set("n", "<leader>d", ":lua require('neogen').generate()<CR>", opts)
}
