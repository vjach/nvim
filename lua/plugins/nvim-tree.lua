return {
	"nvim-tree/nvim-tree.lua", -- plugin repository
	lazy = false, -- load at startup
	config = function()
		-- Nvim Tree setup with marks, move, copy, rename, etc.
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
				side = "left",
			},
			renderer = {
				group_empty = true,
				icons = {
					show = {
						file = false,
						folder = false,
						folder_arrow = false,
						git = false,
					},
				},
			},
			filters = {
				dotfiles = true,
			},
			git = {
				enable = false,
			},
		})

		local api = require("nvim-tree.api")
		--api.tree.toggle()
		--api.fs.rename()
		--api.fs.remove()
		--api.fs.copy.node() -- copy current node
		--api.fs.cut.node() -- cut current node
		--api.fs.paste.node() -- paste node

		-- Keymaps for Nvim Tree
		vim.keymap.set("n", "<leader>e", api.tree.toggle, { desc = "Toggle Nvim Tree" })
		vim.keymap.set("n", "<leader>m", api.marks.toggle, { desc = "Toggle mark" })
		vim.keymap.set("n", "<leader>x", api.fs.cut, { desc = "Cut" })
		vim.keymap.set("n", "<leader>c", api.fs.copy.node, { desc = "Copy" })
		vim.keymap.set("n", "<leader>p", api.fs.paste, { desc = "Paste" })
		vim.keymap.set("n", "<leader>r", api.fs.rename, { desc = "Rename" })
		vim.keymap.set("n", "<leader>d", api.fs.remove, { desc = "Delete" })
	end,
}
