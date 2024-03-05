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

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Navigate buffers
vim.keymap.set("n", "<s-h>", ":bnext<cr>", opts)
vim.keymap.set("n", "<s-l>", ":bprevious<cr>", opts)

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

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
