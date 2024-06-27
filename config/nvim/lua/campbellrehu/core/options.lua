vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true -- show relative line numbers in left margin
opt.number = true -- show absolute line number where cursor is

opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false

opt.ignorecase = true -- case-insensitive search
opt.smartcase = true -- if mixed case in search, search becomes case-sensitive

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes" -- show sign column in left margin

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true
