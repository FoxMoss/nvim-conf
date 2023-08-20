---@type ChadrcConfig
local M = {}
M.ui = { theme = 'dark_horizon' }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

vim.cmd('source /home/foxmoss/.config/nvim/lua/custom/vimrc.vim')

vim.cmd("set mouse=")
vim.cmd("nnoremap <silent> <S-h> :silent :bp<CR>")
vim.cmd("nnoremap <silent> <S-l> :silent :bn<CR>")
vim.cmd("nnoremap <leader>ca :lua vim.lsp.buf.code_action()<CR>")
vim.cmd("command! W :w")
vim.wo.relativenumber = true


return M
