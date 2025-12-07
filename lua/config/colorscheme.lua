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
    shade = "light",
    percentage = 0.15,
  }
})

vim.cmd.colorscheme "catppuccin"
