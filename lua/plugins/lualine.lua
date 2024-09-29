return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        section_separators = { right = "", left = "" },
        component_separators = { right = "", left = "" },
        theme = "catppuccin-frappe",
        -- theme = "auto",
      },
      sections = {
        lualine_c = {
          {
            "buffers",
            show_filename_only = false,
          },
        },
      },
    })
  end,
}
