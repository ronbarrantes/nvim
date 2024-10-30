return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      highlight = {
        enable = true,
      },
    
--      sync_install = false,
      auto_install = true,
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true,
      },
--      additional_vim_regex_highlighting = false,
      -- ensure these language parsers are installed
           -- Using this option may slow down your editor, and you may see some duplicate
      -- Instead of true it can also be a list of languages
--       additional_vim_regex_highlighting = false,
      ensure_installed = {
        "json", 
        "zig",
        "rust",
        "sql",
        "asm",
        "comment",
        "templ",
        "make",
        "llvm",
        "javascript",
        "http",
        "csv",
        "cuda",
        "cmake",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "go",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
