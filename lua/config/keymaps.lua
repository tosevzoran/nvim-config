local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>w', ':w<cr>')

-- Navigate buffers
vim.keymap.set("n", "<leader>x", ":bp<Bar>sp<Bar>bn<Bar>bd<CR>")
vim.keymap.set("n", "<s-h>", ":bnext<cr>", opts)
vim.keymap.set("n", "<s-l>", ":bprevious<cr>", opts)


-- neotree
vim.keymap.set("n", "<leader>e", ":Neotree toggle right<CR>", { desc = "Toggle explorer" })

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>ff", builtin.live_grep, { desc = "Live grep" })

vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
nim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })

vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord" })

vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "[F]ind [T]odos" })
-- Shortcut for searching your neovim configuration files
vim.keymap.set("n", "<leader>sn", function()
  builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })
