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

if !exists('g:vscode')
  inoremap jk <Esc>
endif

nnoremap <leader>p "+p


