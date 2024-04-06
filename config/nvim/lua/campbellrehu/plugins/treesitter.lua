return {
  "nvim-treesitter/nvim-treesitter", 
  event = { "BuffReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag"
  },
  config = function () 
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "lua", "vim", "vimdoc", "typescript", "golang", "rust", "markdown", "javascript", "html" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },  
      autotag = {
        enable = true,
      },
    })
  end,
}
