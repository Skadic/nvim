return {
	"loctvl842/monokai-pro.nvim",
	{
		"EdenEast/nightfox.nvim",
		opts = {
			options = {
				styles = {
					keywords = "bold",
					comments = "italic",
				},
				modules = {
					cmp = true,
					diagnostic = {
						enable = true,
						background = true,
					},
					native_lsp = {
						enable = true,
						background = true,
					},
					nvimtree = true,
					telescope = true,
					whichkey = true,
					symbol_outline = true,
					gitsigns = true,
				},
			},
		},
	},
	{
		"sainnhe/sonokai",
		config = function()
			vim.g.sonokai_enable_italic = true
			vim.g.sonokai_style = "shusia"
		end,
	},
}
