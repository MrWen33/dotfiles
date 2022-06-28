" autodetect git usr bin path
function! GetGitUsrBinPath()
  let gitExePath = system("where git")
  let gitMainPathArr = split(gitExePath, "\\")[0:-3]
  let gitUsrBinArr = gitMainPathArr + ['usr', 'bin']
  return join(gitUsrBinArr, '\\')
endfunction

let $PATH = GetGitUsrBinPath().$PATH

function! Cond(Cond, ...)
  let opts = get(a:000, 0, {})
  return a:Cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin('~/.vim/plugged')
" below are some vim plugin for demonstration purpose

if !exists('g:vscode')
  Plug 'joshdick/onedark.vim'
  Plug 'iCyMind/NeoSolarized'

  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'preservim/nerdtree'

  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
endif

Plug 'preservim/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'ferrine/md-img-paste.vim'

Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

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
nnoremap <leader>t :NERDTree<CR>

" markdown
let g:mkdp_port='8894'
let g:vim_markdown_math = 1
let g:mkdp_echo_preview_url = 1

autocmd FileType markdown nnoremap <silent> <leader>i :call mdip#MarkdownClipboardImage()<CR>
let g:mdip_imgdir = 'pic'
let g:mdip_imgname = 'image'

