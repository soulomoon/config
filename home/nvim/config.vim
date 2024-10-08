set termguicolors
syntax on
" colorscheme onedark " Or whatever colorscheme you make
inoremap jk <esc>
" inoremap <esc> <nop>

let g:windowswap_map_keys = 0 "prevent default bindings
" autocmd VimEnter * CHADopen
set timeoutlen=500
let g:mapleader = "\<Space>"
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>: <cmd>Telescope commands<cr>
nnoremap <leader>S :lua require('spectre').open()<CR>
nnoremap <C-f> :lua require('spectre').open()<CR>

