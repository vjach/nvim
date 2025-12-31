local root_dir = vim.fs.root(0, {
	"compile_commands.json",
	"compile_flags.txt",
	".git",
})

if root_dir then
	vim.lsp.start({
		name = "clangd",
		cmd = {
			"clangd",
			"--background-index",
			"--clang-tidy",
			"--completion-style=detailed",
			"--header-insertion=iwyu",
		},
		root_dir = root_dir,

		on_attach = function(client, bufnr)
			-- Prevent the “2 seconds later everything recolors” effect
			client.server_capabilities.semanticTokensProvider = nil

			-- If your Neovim has this API, it doesn't hurt:
			pcall(vim.lsp.semantic_tokens.stop, bufnr)
		end,
	})
end
