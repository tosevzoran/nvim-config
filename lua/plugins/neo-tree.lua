--     ["A"]  = "git_add_all",
--     ["ga"] = "git_add_file",
--     ["gu"] = "git_unstage_file",
--     ["gr"] = "git_revert_file",
--     ["gc"] = "git_commit"
--     ["gp"] = "git_push",
--     ["gg"] = "git_commit_and_push",

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          --            --visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          --            hide_by_name = {
          --              ".github",
          --              ".gitignore"
          --            },
          never_show = { ".git" },
        },
        use_libuv_file_watcher = true,
        follow_current_file = {
          enabled = true,
        },
      },
    })

    vim.keymap.set("n", "<leader>e", ":Neotree toggle right<CR>", { desc = "Toggle explorer" })
    -- vim.keymap.set("n", "<leader>g", ":Neotree float git_status<CR>", { desc = "Toggle git status window" })
  end,
}
