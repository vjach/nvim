return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		opts = {
			keymap = {
				preset = "default",
				["<Tab>"] = { "fallback" },
				["<S-Tab>"] = { "fallback" },
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				trigger = {
					show_on_keyword = false,
					show_on_trigger_character = false,
				},
				documentation = {
					auto_show = true,
				},
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
	},
}
