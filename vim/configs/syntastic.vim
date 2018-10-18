set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_checkers=['pyflakes']

let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args="--standard=PSR2"

let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint', 'tsc']
let g:syntastic_typescript_tsc_fname = ''

let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_html_tidy_exec = 'tidy5'

" Styling
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '!'

" populate errors to vim location lists
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 1

" aggregate errors
let g:syntastic_aggregate_errors = 1

