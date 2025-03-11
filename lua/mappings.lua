require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
