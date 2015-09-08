" Use neocomplcache
let g:neocomplcache_enable_at_startup = 1

" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3

" <CR>: close popup and save indent
inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"

" <TAB>: completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

