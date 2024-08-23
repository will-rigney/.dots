return {
{
	"nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
	build = ":TSUpdate",
	config = function () 
	  local configs = require("nvim-treesitter.configs")
	  configs.setup({
		  -- todo: languages I actually use here
		  ensure_installed = { "c", "lua", "rust", "javascript", "html", "css" },
		  sync_install = false,
		  highlight = { enable = true },
		  indent = { enable = true },  
		})
	end
  }
}
