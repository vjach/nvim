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

            local on_attach = function(_, bufnr)
                local opts = { noremap = true, silent = true, buffer = bufnr }

                -- Keybindings
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            end
            -- Python: pyright
            lspconfig.pyright.setup({
                on_attach = on_attach,
            })

            -- C++: clangd
            lspconfig.clangd.setup({
                on_attach = on_attach,
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
    "nvim-lualine/lualine.nvim",
    {
      "EdenEast/nightfox.nvim",
      lazy = false,
      priority = 1000,
      config = function()
         -- Set your preferred background
        vim.o.background = "dark" -- or "light"
        vim.opt.termguicolors = false -- disable truecolor for screen
        vim.cmd.colorscheme("nordfox")
      end,
    },
    {
      "github/copilot.vim", -- OR use 'zbirenbaum/copilot.lua' for async
      config = function()
        vim.cmd("Copilot enable")
      end
    }
}
