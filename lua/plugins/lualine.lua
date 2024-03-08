return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
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
