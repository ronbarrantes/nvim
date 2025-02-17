return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier.with({
          extra_args = { "--end-of-line", "lf", "--insert-final-newline", "true" },
        }),
        null_ls.builtins.formatting.stylua.with({
          extra_args = { "--config-path", vim.fn.expand("~/.config/nvim/stylua.toml") },
        }),
        null_ls.builtins.formatting.shfmt.with({
          extra_args = { "-i", "2", "-ci", "-bn", "-sr", "-kp", "-fn" },
        }),
        -- Add other formatters and linters as needed
      },
    })
  end,
}