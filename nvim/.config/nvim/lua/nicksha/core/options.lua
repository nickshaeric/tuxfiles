local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.guicursor = ""
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.wrap = false
opt.showmode = false
opt.signcolumn = "yes"
opt.colorcolumn = "80"
opt.laststatus = 3

-- Editing
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true

-- File Handling
opt.fileencoding = "utf-8"
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Clipboard
opt.clipboard = "unnamedplus"

-- Completion
opt.completeopt = { "menuone", "noselect" }

-- Scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Misc.
opt.mouse = "a"
opt.splitright = true
opt.splitbelow = true
