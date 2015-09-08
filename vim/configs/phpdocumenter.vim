" script bound to Control-P
autocmd FileType php inoremap <Leader>d <ESC>:call PhpDocSingle()<CR>i
autocmd FileType php nnoremap <Leader>d :call PhpDocSingle()<CR>
autocmd FileType php vnoremap <Leader>d :call PhpDocRange()<CR>

