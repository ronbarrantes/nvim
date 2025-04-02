return {
  "laytan/cloak.nvim",
  event = "VeryLazy",
  config = function()
    print("loading cloak")
    require("cloak").setup({
      enabled = true,
      cloak_character = "*",
      cloak_length = nil,
      try_all_patterns = true,
      patterns = {
        -- Match any file starting with '.env'.
        -- This can be a table to match multiple file patterns.
        file_pattern = ".env*",

        -- Match an equals sign and any character after it.
        -- This can also be a table of patterns to cloak,
        -- example: cloak_pattern = { ':.+', '-.+' } for yaml files.
        cloak_pattern = "=.+",

        -- A function, table, or string to generate the replacement.
        -- If left empty, the legacy behavior of keeping the first character is retained.
        replace = nil,
      },
    })
  end,
}