return {
    -- Core
    {
        "stevearc/conform.nvim",
        config = function()
            require("formatting")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.clangd.setup({
                on_attach = function(_, bufnr)
                    local map = function(mode, lhs, rhs, desc)
                        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
                    end

                    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
                    map("n", "gr", vim.lsp.buf.references, "Find references")
                    map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
                    map("n", "K", vim.lsp.buf.hover, "Hover documentation")
                end,
            })
        end,
    },
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "python", "cpp", "cmake", "bash" },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                },
            })
        end,
    },

    -- UI
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",
    "nvim-lualine/lualine.nvim",
    {
      "lifepillar/vim-solarized8",
      priority = 1000, -- Load before other plugins for correct colors
      lazy = false,    -- Load immediately at startup
      config = function()
        -- Use 256-color mode (best for screen and most terminals)
        vim.g.solarized_termcolors = 256
        vim.g.solarized_visibility = "normal"
        vim.g.solarized_diffmode = "high"
        vim.g.solarized_statusline = "low"

        -- Optional: prevent transparency issues
        vim.g.solarized_termtrans = 0

        -- Set your preferred background
        vim.o.background = "dark" -- or "light"

        -- Enable truecolor support if terminal allows
        vim.opt.termguicolors = false

        -- Apply the theme
        vim.cmd("colorscheme solarized8_flat")
      end,
        },
}
