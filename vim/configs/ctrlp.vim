let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](git|hg|svn|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|class|jar|war|ear|DS_Store)$',
  \ }

