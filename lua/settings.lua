vim.o.termguicolors = true
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

vim.g.mapleader = "\\"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true

vim.keymap.set("n", "<leader>f", function()
    require("conform").format({
        async = true,
        lsp_fallback = true,
    })
end, { desc = "Format file with conform.nvim" })

vim.keymap.set("n", ",b", "<cmd>ls<CR>:b ", { desc = "List buffers" })
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 10
