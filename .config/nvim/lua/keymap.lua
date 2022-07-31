local set_keymap = function(mode, lhs, rhs, opts)
	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end
local opts = { noremap = true, silent = true }

set_keymap("n", "<space>f", "<cmd>Format<CR>", opts)
set_keymap("n", "<C-l>", "<cmd>BufferLineCycleNext<CR>", opts)
set_keymap("n", "<C-h>", "<cmd>BufferLineCyclePrev<CR>", opts)
set_keymap("n", "<C-w>", "<cmd>bdelete<CR>", opts)
set_keymap("n", "<C-t>", "<cmd>tabnew<CR>", opts)
set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
set_keymap("n", ";ff", "<cmd>Telescope find_files<CR>", opts)
set_keymap("n", ";fb", "<cmd>Telescope file_browser<CR>", opts)
set_keymap("i", "<C-j>", "<Esc>", opts)
set_keymap("n", "<C-j>", "<Esc>", opts)
set_keymap("n", "<space>x", "<cmd>TroubleToggle<CR>", opts)
set_keymap("n", "<RightMouse>", "<LeftMouse><cmd>lua vim.lsp.buf.hover()<CR>", {})
