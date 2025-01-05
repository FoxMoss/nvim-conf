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
Plug 'lambdalisue/vim-fern'
Plug 'ryanoasis/vim-devicons'
Plug 'sbdchd/neoformat'
Plug 'ashyisme/2048'
Plug 'wakatime/vim-wakatime'
Plug 'mfussenegger/nvim-jdtls'

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

nnoremap <leader>e :Fern . -reveal=% -drawer -right -toggle<CR>
nnoremap <leader>q :q<CR>

set scrolloff=10
