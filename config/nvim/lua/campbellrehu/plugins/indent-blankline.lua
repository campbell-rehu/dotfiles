return {
  "lukas-reineke/indent-blankline.nvim",
  version = "3.5.4",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    indent = { char = "┊" },
  },
}
