require("plugins")
require("plugin_config")
require("keymap")

vim.opt.cursorline = true
vim.opt.number = true
vim.opt.tabstop = 4
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.cmd("colorscheme tokyonight")
vim.notify = require("notify")
vim.cmd("set mouse=a")
