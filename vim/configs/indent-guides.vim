" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" disable guides for nerdtree and help
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

" mapping for indent guide toogle
:nmap <silent> <Leader>ig <Plug>IndentGuidesToggle

