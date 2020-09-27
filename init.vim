call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'
Plug 'pechorin/any-jump.vim'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'pangloss/vim-javascript'
Plug 'tomtom/tcomment_vim'
"Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'ludovicchabant/vim-gutentags'
Plug 'easymotion/vim-easymotion'
Plug 'Chiel92/vim-autoformat'
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-fugitive'
call plug#end()


"colorscheme
if(empty($TMUX))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    if (has("termguicolors"))
        set termguicolors
    endif
endif

colorscheme one

let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"base setting
set number
set expandtab
set tabstop=4
set shiftwidth=0
set softtabstop=-1
set autoindent
set timeoutlen=00

set nofixendofline
"change key bindings
let mapleader=" "
call which_key#register('<Space>', "g:which_key_map")
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
let g:which_key_map = {}
nmap <C-j> 5j
nmap <C-k> 5k

"============coc.nvim
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"vim-hexokinase
"let g:Hexokinase = [ 'foreground' ]

"fzf
"noremap <silent> <leader>bb :Buffers<CR>
noremap <silent> <leader>pf :GFiles<CR>
noremap <silent> <leader>ff :Files<CR>
noremap <silent> <leader>ss :Lines<CR>
"noremap <silent> <leader>h :History<CR>

"vista
"noremap <leader>vo :Vista coc<CR>
"noremap <leader>vq :Vista!<CR>

"comment
nmap <leader>cl g>c
vmap <leader>cl g>
nmap <leader>cu g<c
vmap <leader>cu g<

"anyjump
let g:any_jump_disable_default_keybindings = 1

"easymotion
map <leader>jj <Plug>(easymotion-bd-f)
nmap <leader>jj <Plug>(easymotion-overwin-f)

"autoformat
let g:python3_host_prog='/usr/local/bin/python3'

"vim-which-key
let g:which_key_map['<Tab>'] = ['bprevious', 'previous-buffer']
let g:which_key_map['c'] = {
            \ 'name' : '+comment' ,
            \ }
let g:which_key_map.c.l="comment"
let g:which_key_map.c.u="uncomment"
let g:which_key_map['w'] = {
            \ 'name' : '+windows' ,
            \ 'd' : ['<C-W>c'     , 'delete-window']         ,
            \ '-' : ['<C-W>s'     , 'split-window-below']    ,
            \ '/' : ['<C-W>v'     , 'split-window-right']    ,
            \ 'h' : ['<C-W>h'     , 'window-left']           ,
            \ 'j' : ['<C-W>j'     , 'window-below']          ,
            \ 'l' : ['<C-W>l'     , 'window-right']          ,
            \ 'k' : ['<C-W>k'     , 'window-up']             ,
            \ '?' : ['Windows'    , 'fzf-window']            ,
            \ }
let g:which_key_map.b = {
            \ 'name' : '+buffer' ,
            \ '1' : ['b1'        , 'buffer 1']        ,
            \ '2' : ['b2'        , 'buffer 2']        ,
            \ 'd' : ['bd'        , 'delete-buffer']   ,
            \ 'b' : ['Buffers'   , 'buffer-list']      ,
            \ }
let g:which_key_map.f = {
            \ 'name' : '+files' ,
            \ 'f':['Files', 'files'],
            \ 'h':['History', 'history'],
            \ 's':['w', 'save'],
            \ '.':[':e ~/.config/nvim/init.vim', 'init'],
            \ 'z':[':e ~/.zshrc', 'zshrc'],
            \ }
let g:which_key_map.j = {
            \ 'name' : '+jump' ,
            \ 'a':['AnyJump', 'anyjump'],
            \ 'i':[':CocList outline', 'outlines'],
            \ }
