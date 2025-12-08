vim.pack.add({{
  src = "https://github.com/nvim-telescope/telescope.nvim",
  tag = "v2.0.0",
}, 
  "https://github.com/nvim-lua/plenary.nvim",
})

require("telescope").setup({
  pickers = {
    find_files = {
      hidden = true,
      find_command = {
        "rg",
        "--files",
        "--hidden",
        "--glob",
        "!**/.git/*",
      },
    },
    live_grep = {
      hidden = true,
      additional_args = function(opts)
        return {
          "--hidden",
          "--glob",
          "!**/.git/*",
        }
      end,
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({}),
    },
  },
})

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")
