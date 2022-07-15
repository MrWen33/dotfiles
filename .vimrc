" autodetect git usr bin path
"
function! GetGitUsrBinPath()
  let gitExePath = system("where git")
  let gitMainPathArr = split(gitExePath, "\\")[0:-3]
  let gitUsrBinArr = gitMainPathArr + ['usr', 'bin']
  return join(gitUsrBinArr, '\\')
endfunction

let $PATH = GetGitUsrBinPath().";".$PATH

let mapleader = " "

" load vim plugs
source ~/.vim/plug.vim

set number relativenumber
set encoding=utf-8

set shiftwidth=4
set tabstop=4
set expandtab

:set ic

" key mapping

if !exists('g:vscode')
  inoremap jk <Esc>
endif

nnoremap <leader>p "+p


