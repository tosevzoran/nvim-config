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

vim.pack.add({
  {	src = "https://github.com/catppuccin/nvim" },
})

require('catppuccin').setup({
  flavour = 'frappe',
  integrations = {
    gitsigns = true,
    hop = true,
    cmp = true,
    telescope = true,
    neogit = true,
    nvimtree = true,
    treesitter = true,
    diffview = true,
  },
  dim_inactive = {
    enabled = true,
    shade = "dark",
    percentage = 0.15,
  }
})

vim.cmd.colorscheme "catppuccin"

require("config.keymaps")

vim.lsp.enable({"lua_ls"})
