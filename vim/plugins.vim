set runtimepath+=$HOME/dotfiles/vim

call plug#begin('~/dotfiles/vim/plugged')

Plug 'airblade/vim-gitgutter'

Plug 'amix/vim-zenroom2'

Plug 'bling/vim-airline'

Plug 'Raimondi/delimitMate'

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

if executable("phpctags")
  Plug 'vim-php/tagbar-phpctags.vim'
endif

Plug 'mtscout6/syntastic-local-eslint.vim'

Plug 'MarcWeber/vim-addon-mw-utils'

Plug 'michaeljsmith/vim-indent-object'

Plug 'mileszs/ack.vim'

Plug 'morhetz/gruvbox'

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-vimtex', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'pangloss/vim-javascript'

Plug 'scrooloose/nerdtree'

Plug 'dense-analysis/ale'

Plug 'sheerun/vim-polyglot'

Plug 'Shougo/vimproc.vim', { 'do': 'make' }

Plug 'terryma/vim-expand-region'

Plug 'terryma/vim-multiple-cursors'

Plug 'tobyS/pdv'

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-cucumber'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-surround'

Plug 'twerth/ir_black'

if executable("pandoc")
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'
endif

Plug 'vim-scripts/mru.vim'

Plug 'vim-scripts/tlib'

Plug 'wakatime/vim-wakatime'

Plug 'wesQ3/vim-windowswap'

Plug 'Yggdroot/indentLine'

call plug#end()
