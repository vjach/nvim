return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
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
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
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
