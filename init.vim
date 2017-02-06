" NeoBundle Scripts-------------------------
if has('vim_starting')
	set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
	set runtimepath+=~/.config/nvim
endif

let neobundle_readme=expand('~/.config/nvim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.config/nvim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"
endif

call neobundle#begin(expand('$HOME/.config/nvim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

" THIS IS WHERE YOUR PLUGINS WILL COME

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'vim-scripts/grep.vim'
NeoBundle 'vim-scripts/CSApprox'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'avelino/vim-bootstrap-updater'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'Valloric/YouCompleteMe', {  
     \ 'build'      : {
        \ 'mac'     : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'unix'    : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'windows' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'cygwin'  : './install.sh --clang-completer --system-libclang --omnisharp-completer'
        \ }
     \ }
NeoBundle 'ensime/ensime-vim'

call neobundle#end()

" Tab line when shown for all buffers.
let g:airline#extensions#tabline#enabled = 1

let g:gitgutter_sign_column_always = 1

set expandtab
set shiftwidth=2
set softtabstop=2

" Key mappings
" ==============
" Buffer Navigation
nmap <C-j> :bprevious<cr>
nmap <C-l> :bNext<cr>
nmap <C-k> :ls<cr>
nmap <C-c> :bdelete<cr>
" import in scala
nmap <C-i> :EnSuggestImport<cr>

set hidden
set number

colo desert

filetype plugin indent on

NeoBundleCheck
