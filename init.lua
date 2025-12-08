vim.g.mapleader = " "

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.termguicolors = true
vim.o.smarttab = true
vim.o.swapfile = false
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.cursorline = true

vim.wo.relativenumber = true
vim.wo.number = true

vim.diagnostic.config({
  virtual_text = true
})


require("config.colorscheme")
require("plugins")
require("config.keymaps")

vim.lsp.enable({"lua_ls"})
