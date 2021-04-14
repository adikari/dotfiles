set runtimepath+=$HOME/dotfiles/vim

call plug#begin('~/dotfiles/vim/plugged')

Plug 'aliou/bats.vim'

Plug 'bling/vim-airline'

Plug 'dense-analysis/ale'

Plug 'editorconfig/editorconfig-vim'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'jlanzarotta/bufexplorer'

Plug 'junegunn/goyo.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call system("ctags --version")
if ! v:shell_error
  Plug 'majutsushi/tagbar'
endif

Plug 'MarcWeber/vim-addon-mw-utils'

call system("ag --version")
if ! v:shell_error
  Plug 'mileszs/ack.vim'
endif

Plug 'morhetz/gruvbox'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-vimtex', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'josa42/coc-sh', {'do': 'yarn install --frozen-lockfile'}

Plug 'Raimondi/delimitMate'

Plug 'scrooloose/nerdtree'

Plug 'sheerun/vim-polyglot'

Plug 'terryma/vim-multiple-cursors'

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'

if executable("pandoc")
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'
endif

Plug 'wakatime/vim-wakatime'

Plug 'wesQ3/vim-windowswap'

call plug#end()
