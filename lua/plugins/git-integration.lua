return {
	-- {
	-- 	"tpope/vim-fugitive",
	-- },
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
			-- "ibhagwan/fzf-lua",           -- optional
		},
		config = function()
			require("neogit").setup({})

			vim.keymap.set("n", "<leader>gs", ":Neogit<cr>", {
				silent = true,
				noremap = true,
				desc = "Open Neo[G]it [S]tatus",
			})

			vim.keymap.set("n", "<leader>dv", ":DiffviewOpen<cr>", {
				silent = true,
				noremap = true,
				desc = "[D]iff[V]iew open",
			})

			vim.keymap.set("n", "<leader>dc", ":DiffviewClose<cr>", {
				silent = true,
				noremap = true,
				desc = "[D]iff[V]iew close",
			})

			vim.keymap.set("n", "<leader>gb", ":Telescope git_branches<cr>", {
				silent = true,
				noremap = true,
				desc = "Search [G]it [B]ranches",
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {
				desc = "[G]itsigns [p]review",
			})

			vim.keymap.set("n", "<leader>g[", ":Gitsigns next_hunk<CR>", {
				silent = true,
				noremap = true,
				desc = "Go to next hunk",
			})

			vim.keymap.set("n", "<leader>g]", ":Gitsigns prev_hunk<CR>", {
				silent = true,
				noremap = true,
				desc = "Go to prev hunk",
			})

			vim.keymap.set("n", "<leader>g]", ":Gitsigns prev_hunk<CR>", {
				silent = true,
				noremap = true,
				desc = "Go to prev hunk",
			})

			vim.keymap.set("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<CR>", {
				silent = true,
				noremap = true,
				desc = "[T]oggle current line [B]lame",
			})

			vim.keymap.set("n", "<leader>ts", ":Gitsigns toggle_signs<CR>", {
				silent = true,
				noremap = true,
				desc = "[T]oggle [S]igns",
			})
		end,
	},
}
