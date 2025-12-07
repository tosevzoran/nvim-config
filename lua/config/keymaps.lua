local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>w', ':w<cr>')

-- Navigate buffers
vim.keymap.set("n", "<leader>x", ":bp<Bar>sp<Bar>bn<Bar>bd<CR>")
vim.keymap.set("n", "<s-h>", ":bnext<cr>", opts)
vim.keymap.set("n", "<s-l>", ":bprevious<cr>", opts)


-- neo-tree
vim.keymap.set("n", "<leader>e", ":Neotree toggle right<CR>", { desc = "Toggle explorer" })
