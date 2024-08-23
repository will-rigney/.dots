return {
	{
	  "neovim/nvim-lspconfig",
	  event = "VeryLazy",
	  config = function () 
		local lspconfig = require("lspconfig")
		-- setup lsps
		lspconfig.rust_analyzer.setup({})
		lspconfig.lua_ls.setup{}
	  end
    }
}
