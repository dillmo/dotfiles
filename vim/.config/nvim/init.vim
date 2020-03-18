call plug#begin('~/.local/share/nvim/plugged')

" LSP client
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" elixir language support
Plug 'elixir-editors/vim-elixir'
" elixir format on save
Plug 'mhinz/vim-mix-format'
" elixir tooling
Plug 'slashmili/alchemist.vim'

" javascript language support
Plug 'pangloss/vim-javascript'
" jsx syntax highlighting
Plug 'MaxMEllon/vim-jsx-pretty'
" html5 support
Plug 'othree/html5.vim'
" json support
Plug 'elzr/vim-json'
" JSDoc generation
Plug 'heavenshell/vim-jsdoc'

" comment blocks of code with 'gcc'
Plug 'tpope/vim-commentary'

" elm language support
Plug 'andys8/vim-elm-syntax'

" fuzzy finding, buffer switching, etc.
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

" time tracking
Plug 'wakatime/vim-wakatime'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" relative line numbers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu
set relativenumber

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mix format
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mix_format_on_save = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" terminal mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
tnoremap <Esc> <C-\><C-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" two spaces for indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2
set shiftwidth=2
set expandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" file explorer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>e :Explore<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JSDoc generation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jsdoc_allow_input_prompt = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CoC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> K :call CocAction('doHover')<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" denite
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction
call denite#custom#var('file/rec', 'command',
\ ['rg', '--files', '--glob', '!.git'])
nnoremap <leader>f :Denite file/rec<CR>
nnoremap <leader>b :Denite buffer<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" apex
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.cls set filetype=apex


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" disable modelines
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nomodeline
