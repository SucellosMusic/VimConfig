vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.api.nvim_set_keymap("i", "jk", "<ESC>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "<C-j>", "()<Left>", {})
vim.api.nvim_set_keymap("i", "<C-k>", "<Right>{}<Left>", {})
vim.api.nvim_set_keymap("i", "<C-l>", "<CR><CR><Up>", {})
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 15

require("config.lazy")
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = { "c", "lua", "cpp", 'make' },
	sync_install  = false,
	highlight = {enable = true},
	indent = {enable = true}
	})

vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')
vim.lsp.enable('pylsp')

local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('lua_ls', {
	capabilities = {capabilities},
	filetypes = {'lua'}
})

vim.lsp.config('clangd', {
	capabilites = {capabilities},
	cmd = {'clangd', '--header-insertion=never'},
	filetypes = {'c', 'h' , 'cpp', 'hpp'},
	})

vim.lsp.config('pyslp', {
	capabilities = {capabilities},
	filetypes = {'py', 'pyc', 'pyw', 'pyd', 'pyx', 'pyi', 'pyz'}
})

vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gd', vim.lsp.buf. definition, {})
vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})


vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {silent = true})

