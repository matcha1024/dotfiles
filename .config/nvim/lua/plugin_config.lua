----- lualine.config -----
require("lualine").setup({
	options = {
		icons_enabled = true,
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		disabled_filetypes = {},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			{
				"filename",
				file_status = true, -- displays file status (readonly status, modified status)
				path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
			},
		},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = "  ", warn = "  ", info = "  ", hint = "  " },
			},
			"encoding",
			"filetype",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{
				"filename",
				file_status = true, -- displays file status (readonly status, modified status)
				path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
			},
		},
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "fugitive" },
})

----- lspsaga.config -----
require("lspsaga").setup({
	error_sign = "",
	warn_sign = "",
	hint_sign = "",
	infor_sign = "",
	border_style = "round",
	code_action_icon = "● ",
	highlight_prefix = false,
})

----- cmp.config -----
require("cmp").setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-d>"] = require("cmp").mapping.scroll_docs(-4),
		["<C-f>"] = require("cmp").mapping.scroll_docs(4),
		["<C-Space>"] = require("cmp").mapping.complete(),
		["<C-e>"] = require("cmp").mapping.close(),
		["<tab>"] = require("cmp").mapping.confirm({
			behavior = require("cmp").ConfirmBehavior.Replace,
			select = true,
		}),
	},
	sources = require("cmp").config.sources({
		{ name = "nvim_lsp" },
	}, {
		{ name = "buffer" },
	}),
	formatting = {
		format = require("lspkind").cmp_format({ with_text = false, maxwidth = 50 }),
	},
})
vim.cmd([[highlight! default link CmpItemKind CmpItemMenuDefault]])

----- nvim-treesitter.config -----
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = false,
		disable = {},
	},
	yati = { enable = true, disable = {} },
})

----- telescope.config -----
require("telescope").setup({
	defaults = {
		mappings = {
			n = {
				["<C-j>"] = require("telescope.actions").close,
			},
		},
	},
})

----- file_browser.config -----
require("telescope").load_extension("file_browser")

----- nvim-autopairs.config -----
require("nvim-autopairs").setup({})

----- toggleterm.config -----
require("toggleterm").setup({
	size = 15,
	open_mapping = [[<c-\>]],
	hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_terminals = true,
	start_in_insert = true,
	insert_mappings = true, -- whether or not the open mapping applies in insert mode
	terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
	persist_size = true,
	direction = "horizontal",
	float_opts = {
		border = "curved",
	},
	close_on_exit = true, -- close the terminal window when the process exits
})

----- mason.config -----
local mason = require("mason")
local mason_package = require("mason-core.package")
local mason_registry = require("mason-registry")
local null_ls = require("null-ls")

mason.setup({})

local null_sources = {}

for _, package in ipairs(mason_registry.get_installed_packages()) do
	local package_categories = package.spec.categories[1]
	if package_categories == mason_package.Cat.Formatter then
		table.insert(null_sources, null_ls.builtins.formatting[package.name])
	end
	if package_categories == mason_package.Cat.Linter then
		table.insert(null_sources, null_ls.builtins.diagnostics[package.name])
	end
end

null_ls.setup({
	sources = null_sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.format()
					vim.cmd("Lspsaga toggle_virtual_text")
				end,
			})
		end
	end,
})

require("mason-lspconfig").setup({})
require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({})
	end,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = true,
	signs = true,
	update_in_insert = false,
})

----- fidget.config -----
require("fidget").setup({})

----- bufferline.config -----
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.termguicolors = true
require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = false,
		enforce_regular_tabs = true,
	},
})

----- alpha.config -----
require("alpha").setup(require("alpha.themes.dashboard").config)

----- notify.config -----
require("notify").setup({})

----- sidebar-nvim.config -----
require("sidebar-nvim").setup({
	open = true,
	hide_statusline = false,
	side = "right",
	sections = { "datetime", "files", "diagnostics", "git", "symbols" },
	datetime = { format = "%a %b %d, %H:%M:%S", clocks = { { name = "Tokyo" } } },
})

----- indent_blankline.config -----
require("indent_blankline").setup({})

----- scrollbar.config -----
require("scrollbar").setup()

----- trouble.config -----
require("trouble").setup({})

----- rust-tools.config -----
require("rust-tools").setup({
	tools = {
		inlay_hints = {
			parameter_hints_prefix = " ",
			other_hints_prefix = " ",
		},
		hover_actions = {
			auto_focus = true,
		},
	},
})
