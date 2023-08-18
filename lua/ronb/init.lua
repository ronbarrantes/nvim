require("ronb.set")
require("ronb.remap")

-- TODO: figure out a better place to add this
require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      "node_modules"
    }
  }
}
