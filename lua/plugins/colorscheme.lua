return {
    "lifepillar/vim-solarized8",
    lazy = false, -- load at startup
    config = function()
        -- Use the dark version
        vim.g.solarized_termcolors = 256
        vim.cmd("colorscheme solarized8_flat")
        vim.o.background = "dark"
    end,
}
