return {
	"https://github.com/zbirenbaum/copilot.lua.git",
	lazy = true,
	event = "InsertEnter",
	config = function()
		vim.g.copilot_no_tab_map = true
		require("copilot").setup({
			panel = {
				enabled = true,
				auto_refresh = true,
			},
			suggestion = {
				enabled = true,
				auto_trigger = false,
				keymap = {
					accept_word = "<C-w>",
					accept_line = "<C-l>",
					accept = "<C-Enter>",
					next = "<C-n>",
					prev = "<C-p>",
					dismiss = "<C-d>",
				},
			},
			filetypes = { ["*"] = true },
		})

		-- Ensure Esc always exits insert mode
		vim.api.nvim_set_keymap("i", "<Esc>", "<Esc>", { noremap = true, silent = true })
	end,
}
