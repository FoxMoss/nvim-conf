let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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


