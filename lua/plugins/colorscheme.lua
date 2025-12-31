return {
	"lifepillar/vim-solarized8",
	lazy = false, -- load at startup
	priority = 2000,
	config = function()
		-- Use the dark version
		vim.g.solarized_termcolors = 256
		vim.o.background = "dark"
		vim.cmd("colorscheme solarized8_flat")

		-- Pastel Tree-sitter capture overrides (works with any colorscheme)
		-- Pastel+, slightly more colorful, aligned with standard highlighting
		-- Put this AFTER: vim.cmd("colorscheme solarized8_flat")

		local hi = vim.api.nvim_set_hl
	end,
}
