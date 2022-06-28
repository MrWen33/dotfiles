" autodetect git usr bin path
function! GetGitUsrBinPath()
  let gitExePath = system("where git")
  let gitMainPathArr = split(gitExePath, "\\")[0:-3]
  let gitUsrBinArr = gitMainPathArr + ['usr', 'bin']
  return join(gitUsrBinArr, '\\')
endfunction

let $PATH = GetGitUsrBinPath().";".$PATH

" load vim plugs
source $HOME/.vim/plug.vim

set number relativenumber
set encoding=utf-8

set tabstop=4
set autoindent
set smartindent

:set ic

" key mapping
let mapleader = " "
:inoremap jk <Esc>
nnoremap <leader>p "+p

" fzf
nnoremap <leader><leader> :Rg<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>

" nerdtree
let NERDTreeShowHidden=1
nnoremap <leader>t :NERDTree<CR>

" markdown
let g:mkdp_port='8894'
let g:vim_markdown_math = 1
let g:mkdp_echo_preview_url = 1
autocmd FileType markdown nnoremap <silent> <leader>i :call mdip#MarkdownClipboardImage()<CR>
let g:mdip_imgdir = 'pic'
let g:mdip_imgname = 'image'

