return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	config = function()
		require("nvim-treesitter").install({
			"c",
			"cpp",
			"lua",
			"python",
			"javascript",
			"html",
			"css",
			"json",
			"bash",
			"yaml",
			"markdown",
			"cmake",
		})

		-- Start Tree-sitter highlighting for buffers with parsers
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				pcall(vim.treesitter.start, args.buf)

				-- folds (core)
				vim.wo.foldmethod = "expr"
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			end,
		})
	end,
}
