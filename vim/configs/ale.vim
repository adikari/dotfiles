let g:ale_set_highlights = 0

let g:ale_sign_priority=30
let g:gitgutter_sign_priority=9

nmap <silent> <C-g> <Plug>(ale_previous_wrap)
nmap <silent> <C-h> <Plug>(ale_next_wrap)

highlight ALEError ctermbg=none cterm=underline
highlight ALEWarning ctermbg=none cterm=underline"
