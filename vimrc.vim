let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

hi Normal guibg=NONE ctermbg=NONE

map <Leader>vp :VimuxPromptCommand<CR>

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'preservim/vimux'
Plug 'ThePrimeagen/vim-be-good'
Plug 'ThePrimeagen/harpoon'
Plug 'mogelbrod/vim-jsonpath'
Plug 'OmniSharp/omnisharp-vim'
Plug 'https://gitlab.com/verticallity/spwn-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'
Plug 'ellisonleao/glow.nvim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'prabirshrestha/vim-lsp'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'sbdchd/neoformat'
Plug 'ashyisme/2048'
Plug 'wakatime/vim-wakatime'

let g:neoformat_try_node_exe = 1

if executable('rust-analyzer')
  au User lsp_setup call lsp#register_server({
        \   'name': 'Rust Language Server',
        \   'cmd': {server_info->['rust-analyzer']},
        \   'whitelist': ['rust'],
        \ })
endif

let g:jsonpath_register = '*'

au FileType json noremap <buffer> <silent> <leader>d :call jsonpath#echo()<CR>
au FileType json noremap <buffer> <silent> <leader>g :call jsonpath#goto()<CR>
call plug#end()


function! s:JbzClangFormat(first, last)
  let l:winview = winsaveview()
  execute a:first . "," . a:last . "!clang-format"
  call winrestview(l:winview)
endfunction
command! -range=% JbzClangFormat call <sid>JbzClangFormat (<line1>, <line2>)

nnoremap <leader>e :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-m> <CR>
let g:NERDTreeWinPos = "right"

let g:NERDTreeShowLineNumbers=1
autocmd BufEnter NERD_* setlocal rnu

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let NERDTreeQuitOnOpen = 1

set scrolloff=10
