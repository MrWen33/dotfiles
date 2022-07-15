" Install vim-plug if not found
if empty(glob('$HOME/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ".$HOME."/.vim/autoload/plug.vim --create-dirs ".
    \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


" Add Plugins
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

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'ferrine/md-img-paste.vim'

Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

source $HOME/.vim/cocsettings.vim

" fuzzy search
:verbose nnoremap <leader><leader> :CtrlPMixed<CR>
:verbose nnoremap <leader>f :CtrlP<CR>
:verbose nnoremap <leader>b :CtrlPBuffer<CR>

" nerdtree
let NERDTreeShowHidden=1
:verbose nnoremap <leader>t :NERDTree<CR>

" markdown
let g:mkdp_port='8894'
let g:vim_markdown_math = 1
let g:mkdp_echo_preview_url = 1
autocmd FileType markdown nnoremap <silent> <leader>i :call mdip#MarkdownClipboardImage()<CR>
let g:mdip_imgdir = 'pic'
let g:mdip_imgname = 'image'


