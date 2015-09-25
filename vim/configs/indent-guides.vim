if ! has("gui_running")
  let g:indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=darkgrey
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=black
endif

" disable guides for nerdtree and help
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

" mapping for indent guide toogle
:nmap <silent> <Leader>ig <Plug>IndentGuidesToggle

" start indentation from level 2
let g:indent_guides_start_level = 2

" enable on startup
let g:indent_guides_enable_on_vim_startup = 1
