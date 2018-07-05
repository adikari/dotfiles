let g:syntastic_python_checkers=['pyflakes']

let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args="--standard=PSR2"

let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint']
let g:syntastic_typescript_tsc_fname = ''

let g:syntastic_javascript_checkers = ['jshint', 'eslint']
let g:syntastic_html_tidy_exec = 'tidy5'

" populate errors to vim location lists
let g:syntastic_always_populate_loc_list = 1

" aggregate errors
let g:syntastic_aggregate_errors = 1
