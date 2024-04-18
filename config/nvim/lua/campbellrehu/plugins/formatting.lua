return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        svelte = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        graphql = { "prettierd" },
        lua = { "stylua" },
        python = { "isort", "black" },
        go = { "gofumpt", "goimports", "golines" },
        bash = { "shfmt", "beautysh", "shellcheck", "shellharden" },
        csharp = { "csharpier" },
        fish = { "fish_indent" },
        sql = { "sql_formatter" },
        terraform = { "terraform_fmt" },
        ["*"] = { "codespell" },
      }
    })
  end
}
