local root_dir = vim.fs.root(0, {
  "compile_commands.json",
  "compile_flags.txt",
  ".git",
})

if root_dir then
  vim.lsp.start({
    name = "clangd",
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--completion-style=detailed",
      "--header-insertion=iwyu",
    },
    root_dir = root_dir,
  })
end

