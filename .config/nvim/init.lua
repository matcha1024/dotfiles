require'plugins'

vim.api.nvim_set_keymap('i', '<C-j>', '<Esc>', {})
vim.api.nvim_set_keymap('n', '<C-j>', '<Esc>', {noremap = true})

vim.opt.cursorline = true
vim.opt.number = true
vim.opt.tabstop = 4
