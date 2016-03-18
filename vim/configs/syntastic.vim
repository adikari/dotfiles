let g:syntastic_python_checkers=['pyflakes']

let g:syntastic_php_checkers = ['php']
if executable("phpcs")
  let g:syntastic_php_checkers += ['phpcs']
  let g:syntastic_php_phpcs_args="--standard=PSR2"
endif

let g:syntastic_typescript_checkers = []
if executable("tsc")
  let g:syntastic_typescript_checkers += ['tsc']
endif
if executable("tslint")
  let g:syntastic_typescript_checkers += ['tslint']
endif

if executable("jshint")
  let g:syntastic_javascript_checkers = ['jshint']
endif

" populate errors to vim location lists
let g:syntastic_always_populate_loc_list = 1

