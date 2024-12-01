---@type ChadrcConfig
local M = {}
M.ui = { theme = 'catppuccin' }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

vim.diagnostic.config({
  virtual_text = false
})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

vim.cmd('source /home/foxmoss/.config/nvim/lua/custom/vimrc.vim')
vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
vim.cmd('highlight! LineNr guibg=NONE guifg=grey')
vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
vim.cmd('highlight! TabLineFill guibg=NONE guifg=black')
vim.cmd("nnoremap mm :lua require('harpoon.mark').add_file()<CR>")
vim.cmd("nnoremap mn :lua require('harpoon.ui').toggle_quick_menu()<CR>")
for i = 1, 10, 1 do
  vim.cmd("nnoremap m" .. tostring(i) .. " :lua require(\"harpoon.ui\").nav_file(" .. tostring(i) .. ")<CR>")
end

vim.cmd("nmap <S-h> <S-Tab>")
vim.cmd("nmap <S-l> <Tab>")

vim.cmd("nmap <S-C-h> :wincmd k <CR>")
vim.cmd("nmap <S-C-j> :wincmd j <CR>")
vim.cmd("nmap <S-C-k> :wincmd k <CR>")
vim.cmd("nmap <S-C-l> :wincmd l <CR>")

vim.cmd("nnoremap <leader>ca :lua vim.lsp.buf.code_action()<CR>")
vim.cmd("nnoremap <leader>ch :lua vim.lsp.buf.hover()<CR>")
vim.cmd("nnoremap <leader>cr :lua vim.lsp.buf.references()<CR>")
vim.cmd("nnoremap <leader>cd :lua vim.lsp.buf.declaration()<CR>")
vim.cmd("nnoremap <S-z> :redo<CR>")
vim.cmd("nnoremap <C-k> ddkP")
vim.cmd("nnoremap <C-j> ddjP")
vim.cmd("inoremap jh <Esc>");
vim.cmd("command! W :w")
vim.wo.relativenumber = true

vim.cmd("nnoremap <silent> <C-~> :silent <C-\\><C-n>")



return M
