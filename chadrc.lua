---@type ChadrcConfig
local M = {}
M.ui = { theme = 'dark_horizon' }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

vim.cmd('source /home/foxmoss/.config/nvim/lua/custom/vimrc.vim')
require("harpoon").setup({ tabline = false })
vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! TabLineFill guibg=NONE guifg=black')
vim.cmd("nnoremap mm :lua require('harpoon.mark').add_file()<CR>")
vim.cmd("nnoremap mn :lua require('harpoon.ui').toggle_quick_menu()<CR>")
for i = 1, 10, 1 do
  vim.cmd("nnoremap m" .. tostring(i) .. " :lua require(\"harpoon.ui\").nav_file(" .. tostring(i) .. ")<CR>")
end

vim.cmd("set mouse=")
vim.cmd("nnoremap <silent> <S-h> :silent :bp<CR>")
vim.cmd("nnoremap <silent> <S-l> :silent :bn<CR>")
vim.cmd("nnoremap <leader>ca :lua vim.lsp.buf.code_action()<CR>")
vim.cmd("nnoremap <S-z> :redo<CR>")
vim.cmd("nnoremap <C-k> ddkP")
vim.cmd("nnoremap <C-j> ddjP")
vim.cmd("command! W :w")
vim.wo.relativenumber = true


return M
