vim.cmd[[packadd packer.nvim]]

require'packer'.startup(function()
        use'tpope/vim-fugitive'
        use'tpope/vim-rhubarb'

        use{
                'nvim-lualine/lualine.nvim',
                requires = {'kyazdani42/nvim-web-devicons', opt = true},
        }

        use 'kristijanhusak/defx-git'
        use 'kristijanhusak/defx-icons'
        use 'Shougo/defx.nvim'
        use 'neovim/nvim-lspconfig'
        use 'tami5/lspsaga.nvim'
        use 'folke/lsp-colors.nvim'
        use 'L3MON4D3/LuaSnip'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/nvim-cmp'
        use 'onsails/lspkind-nvim'
        use 'nvim-treesitter/nvim-treesitter'
        use 'nvim-lua/popup.nvim'
        use 'nvim-lua/plenary.nvim'
        use 'nvim-telescope/telescope.nvim'
        use 'windwp/nvim-autopairs'
        use 'akinsho/toggleterm.nvim'
        use 'rcarriga/nvim-notify'
        use 'EdenEast/nightfox.nvim'
        use "williamboman/nvim-lsp-installer"
        use 'goolord/alpha-nvim'
        use 'j-hui/fidget.nvim'
        use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
        use 'sidebar-nvim/sidebar.nvim'
        use 'lukas-reineke/indent-blankline.nvim'
        use 'petertriho/nvim-scrollbar'
end)

require('lualine').setup {
  options = {
    icons_enabled = true,
    section_separators = {left = '', right = ''},
    component_separators = {left = '', right = ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
    }},
    lualine_x = {
      { 'diagnostics', sources = {"nvim_diagnostic"}, symbols = {error = '  ', warn = '  ', info = '  ', hint = '  '} },
      'encoding',
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    }},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'fugitive'}
}


require('lspsaga').setup{
        error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
}


require('cmp').setup({
        snippet = {
                expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                end,
        },
        mapping = {
      ['<C-d>'] = require('cmp').mapping.scroll_docs(-4),
      ['<C-f>'] = require('cmp').mapping.scroll_docs(4),
      ['<C-Space>'] = require('cmp').mapping.complete(),
      ['<C-e>'] = require('cmp').mapping.close(),
      ['<tab>'] = require('cmp').mapping.confirm({
        behavior = require('cmp').ConfirmBehavior.Replace,
        select = true
      }),
    },
    sources = require('cmp').config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    }),
    formatting = {
            format = require('lspkind').cmp_format({with_text = false, maxwidth = 50})
    }
})
vim.cmd[[highlight! default link CmpItemKind CmpItemMenuDefault]]

require('nvim-treesitter.configs').setup{
        highlight = {
                enable = true,
                disable = {},
        },
        indent = {
                enable = true,
                disable = {},
        },
}

vim.api.nvim_set_keymap('n', ';f', '<cmd>Telescope find_files<CR>', {noremap=true, silent=true})
require('telescope').setup{
        defaults = {
                mappings = {
                        n = {
                                ["<C-j>"] = require('telescope.actions').close
                        },
                },
        }
}

require('nvim-autopairs').setup{}

require("toggleterm").setup{
  size = 15,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  direction = 'float',
  float_opts = {
                border = 'curved',
        },
  close_on_exit = true, -- close the terminal window when the process exits
}


vim.cmd("colorscheme nightfox")
require('nightfox').setup({
        options = {
                styles = {
                        functions = "italic",
                }
        }
})

require('alpha').setup(require'alpha.themes.startify'.config)

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end


  local opts = { noremap = true, silent = true }
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local lsp_installer = require "nvim-lsp-installer"
local lspconfig = require "lspconfig"
lsp_installer.setup()
for _, server in ipairs(lsp_installer.get_installed_servers()) do
  lspconfig[server.name].setup {
                capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = on_attach,

  }
end

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        -- disable virtual text
        virtual_text = true,

        -- show signs
        signs = true,

        -- delay update diagnostics
        update_in_insert = false,
      }
)


require("fidget").setup{}

vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.termguicolors = true
require("bufferline").setup{
        options = {
                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = false,
                show_buffer_close_icons = false,
                show_close_icon = false,
                show_tab_indicators = false
        }
}
vim.api.nvim_set_keymap("n", "<C-l>", "<cmd>BufferLineCycleNext<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<C-h>", "<cmd>BufferLineCyclePrev<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<C-w>", "<cmd>bdelete<CR>", {noremap=true, silent=true})
vim.api.nvim_set_keymap("n", "<C-t>", "<cmd>tabnew<CR>", {noremap=true, silent=true})

require'alpha'.setup(require'alpha.themes.startify'.config)

require("notify").setup{}

require("sidebar-nvim").setup({
        open = true,
        hide_statusline = true,
        side = "right",
        sections = {"datetime", "files", "diagnostics", "git", "symbols"},
        datetime = {format = "%a %b %d, %H:%M", clocks = {{name="Tokyo"}}}
})

require("indent_blankline").setup{}

require("scrollbar").setup()
