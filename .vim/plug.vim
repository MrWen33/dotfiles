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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'ferrine/md-img-paste.vim'

Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


