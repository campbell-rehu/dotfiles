return {
  "akinsho/bufferline.nvim",
  version = "4.6.0",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      mode = "buffers",
      separator_style = "slant",
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          separator = true, -- use a "true" to enable the default, or set your own character
        },
      },
    },
  },
}
