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
vim.opt.scrolloff = 25

require("config.lazy")
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = { "c", "lua", "cpp", "markdown", "markdown_inline" },
	sync_install  = false,
	highlight = {enable = true},
	indent = {enable = true}
	})


require("config.cmakeconfig")

vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {silent = true})
