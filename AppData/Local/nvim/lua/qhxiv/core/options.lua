local opt = vim.opt

opt.clipboard = 'unnamedplus'
opt.cursorline = true

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.mouse = a
opt.wrap = false

opt.swapfile = false
opt.backup = false

opt.ignorecase = true
opt.smartcase = true

opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8

opt.updatetime = 50

opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.cmd.colorscheme "habamax"
