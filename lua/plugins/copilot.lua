return {
    {
        "github/copilot.vim", -- OR use 'zbirenbaum/copilot.lua' for async
        config = function()
            vim.cmd("Copilot enable")
        end
    }
}
