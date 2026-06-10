return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    highlights = {
      fill = { bg = "NONE" },
      background = { bg = "NONE" },
      tab = { bg = "NONE" },
      tab_separator = { fg = "#627E97", bg = "NONE" },
      tab_selected = { bg = "#1f2335" },
      tab_separator_selected = { fg = "#627E97", bg = "NONE" },
      close_button_selected = { bg = "#1f2335" },
    },
    options = {
      mode = "tabs",
      separator_style = { "|", "|" },
    },
  },
}
