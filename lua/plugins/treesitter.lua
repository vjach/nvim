return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        require("nvim-treesitter").install("c", "cpp", "lua", "python", "javascript", "html", "css", "json", "bash",
            "yaml", "markdown")
    end,
}
