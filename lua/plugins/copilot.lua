return {
	"github/copilot.vim",
	lazy = true,
	cmd = "Copilot",
	event = "InsertEnter",
	init = function()
		vim.keymap.set("i", "<M-g>", "<Plug>(copilot-suggest)")
	end,
}
