vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "Fastfile", "Appfile", "Matchfile", "Pluginfile" },
	command = "set filetype=ruby",
})

vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "12.7.1")

vim.g.mapleader = " "

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set nowritebackup")

-- setup treesitter folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

vim.wo.relativenumber = true
vim.wo.number = true

vim.opt.cursorline = true
-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Highlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

local opts = { noremap = true, silent = true }

-- close buffers
vim.keymap.set("n", "<leader>x", ":bd<CR>")
-- save change
vim.keymap.set("n", "<leader>w", ":w<CR>")

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Navigate buffers
vim.keymap.set("n", "<s-h>", ":bnext<cr>", opts)
vim.keymap.set("n", "<s-l>", ":bprevious<cr>", opts)

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- Resize with arrows
vim.keymap.set("n", "<s-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<s-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<s-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<s-Right>", ":vertical resize +2<CR>", opts)

-- Move text up and down (alt mapping is not working)
-- vim.keymap.set("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- vim.keymap.set("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move text up and down (alt mapping is not working)
-- vim.keymap.set("v", "<A-j>", ":m .+1<CR>gv=gv", opts)
-- vim.keymap.set("v", "<A-k>", ":m .-2<CR>gv=gv", opts)

-- keep the pasted text in buffer
vim.keymap.set("v", "p", '"_dP', opts)

-- Insert (alt mapping is not working)
-- vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
