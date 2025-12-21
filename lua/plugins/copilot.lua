return {
    "https://github.com/zbirenbaum/copilot.lua.git",
    lazy = true,
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            panel = {
                enabled = true,
                auto_refresh = true,
            },
            suggestion = {
                enabled = true,
                auto_trigger = true,
                keymap = {
                    accept_word = "<C-w>", -- Ctrl+L to accept next word
                    accept_line = "<C-l>", -- Ctrl+Enter to accept full suggestion
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
