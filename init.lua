require("settings")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none",
		"https://github.com/folke/lazy.nvim",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    -- Disable semantic highlighting from LSP
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

--
--
--
-- -- ✅ Only load plugins from the plugins module
-- require("config.mason")
-- require("config.lsp")
