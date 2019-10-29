set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Styling
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '!'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_generic = 1
let g:syntastic_javascript_eslint_exec = '/bin/ls'
let g:syntastic_javascript_eslint_args='-f compact'

" aggregate errors
let g:syntastic_aggregate_errors = 1

let g:syntastic_python_checkers=['pyflakes']

let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args="--standard=PSR2"

let g:syntastic_typescript_checkers = ['tslint', 'tsc']
let g:syntastic_typescript_tsc_fname = ''

let g:syntastic_html_tidy_exec = 'tidy5'


