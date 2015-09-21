" script bound to pdv
let g:pdv_template_dir = "$HOME/dotfiles/vim/plugged/pdv/templates"

autocmd FileType php inoremap <Leader>d <ESC>:call pdv#DocumentCurrentLine()<CR>i
autocmd FileType php nnoremap <Leader>d :call pdv#DocumentCurrentLine()<CR>

