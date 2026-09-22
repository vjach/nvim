return {
  "LunarVim/bigfile.nvim",
  lazy = false,
  config = function()
    require("bigfile").setup({
      filesize = 2,   -- MB
      pattern = { "*" },
      features = {
        "indent_blankline",
        "illuminate",
        "lsp",
        "syntax",
        "treesitter",
        "vimopts",
        "matchparen",
        "filetype",
      },
    })
  end,
}
