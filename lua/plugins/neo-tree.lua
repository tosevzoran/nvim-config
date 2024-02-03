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
      vim.keymap.set('n', '<leader>e', ':Neotree toggle right<CR>')
      vim.keymap.set('n', '<leader>g', ':Neotree float git_status<CR>')
    end
}
