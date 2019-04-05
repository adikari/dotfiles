set runtimepath+=$HOME/dotfiles/vim

call plug#begin('~/dotfiles/vim/plugged')

Plug 'amix/vim-zenroom2'

Plug 'airblade/vim-rooter'

Plug 'bling/vim-airline'

Plug 'cakebaker/scss-syntax.vim'

Plug 'Raimondi/delimitMate'

Plug 'editorconfig/editorconfig-vim'

Plug 'ekalinin/Dockerfile.vim'

Plug 'heavenshell/vim-jsdoc'

Plug 'jlanzarotta/bufexplorer'

Plug 'junegunn/goyo.vim'

Plug 'kien/ctrlp.vim'

Plug 'leafgarland/typescript-vim'

Plug 'lervag/vimtex'

call system("ctags --version")
if ! v:shell_error
  Plug 'majutsushi/tagbar'
endif

if executable("phpctags")
  Plug 'vim-php/tagbar-phpctags.vim'
endif

Plug 'MarcWeber/vim-addon-mw-utils'

Plug 'michaeljsmith/vim-indent-object'

Plug 'mileszs/ack.vim'

Plug 'mtscout6/syntastic-local-eslint.vim'

Plug 'mxw/vim-jsx'

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-java', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-vimtex', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}

Plug 'pangloss/vim-javascript'

Plug 'scrooloose/nerdtree'

Plug 'scrooloose/syntastic'

Plug 'Shougo/vimproc.vim', { 'do': 'make' }

Plug 'terryma/vim-expand-region'

Plug 'terryma/vim-multiple-cursors'

Plug 'tobyS/vmustache'

Plug 'tobyS/pdv'

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-cucumber'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-markdown'

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-surround'

Plug 'twerth/ir_black'

if executable("pandoc")
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'
endif

Plug 'vim-scripts/mru.vim'

Plug 'vim-scripts/nginx.vim'

Plug 'vim-scripts/tlib'

Plug 'wesQ3/vim-windowswap'

Plug 'Yggdroot/indentLine'

call plug#end()
