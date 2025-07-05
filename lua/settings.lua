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
