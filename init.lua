vim.api.nvim_set_keymap("i", "jk", "<ESC>", {noremap = true, silent = true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.relativenumber = true

require("config.lazy")
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = { "c", "lua", "cpp"},
	sync_install  = false,
	highlight = {enable = true},
	indent = {enable = true}
	})

require("config.cmakeconfig")

vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {silent = true})
