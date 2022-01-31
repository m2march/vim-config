set nocompatible              " required
filetype off                  " required
let mapleader = ","
syntax on

" IDE Guide: ttps://realpython.com/vim-and-python-a-match-made-in-heaven/
" + Flavors

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Bundle 'Valloric/YouCompleteMe'

" Syntax
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'

" CtrlP
Plugin 'kien/ctrlp.vim'

" Lightline
Plugin 'itchyny/lightline.vim'

" Tagbar
Plugin 'majutsushi/tagbar'

" Indentation
Plugin 'vim-scripts/indentpython.vim'

Plugin 'ivanov/vim-ipython'

Plugin 'tidalcycles/vim-tidal'
Plugin 'supercollider/scvim'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'

"Plugin 'plasticboy/vim-markdown'

Plugin 'ternjs/tern_for_vim'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" Ack inside vim
Plugin 'mileszs/ack.vim' 

" vim-latex
Plugin 'lervag/vimtex'

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Unnecessary Whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set textwidth=79
set smartindent

set encoding=utf-8

autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType cpp setlocal ts=2 sts=2 sw=2
autocmd FileType tex setlocal ts=2 sts=2 sw=2


" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_goto_buffer_command = 'split'
map <leader>d  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>n  :YcmCompleter GoToReferences<CR>
nnoremap <S-K> :YcmCompleter GetDoc<CR>
let g:jedi#documentation_command = "<leader>r"

" easier moving between tabs
map <Leader>j <esc>:tabprevious<CR>
map <Leader>k <esc>:tabnext<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Showing line numbers and length
set number  " show line numbers
set colorcolumn=80
highlight ColorColumn ctermbg=233

" lightline
let g:lightline = {
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
set laststatus=2
if !has('gui_running')
      set t_Co=256
endif

" Taglist
let right_side_width = float2nr(round(&columns * 0.25))
let g:tagbar_width = right_side_width
let Tlist_Close_On_Select = 0
let Tlist_Use_Right_Window = 1
nmap <leader>op :TagbarToggle<CR>

let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }


" SimplyFold
let g:SimpylFold_docstring_preview=1
let g:SimpylFold_fold_docstring=0
let g:SimpylFold_fold_import=0


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
" let g:ctrlp_map = '<leader>eg'
noremap <leader>eg :CtrlP<CR>
noremap <leader>el :CtrlP .<CR>
noremap <leader>ecc :CtrlPClearAllCaches<CR>
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_working_path_mode = 'ra'

" Syntastic
let g:syntastic_quiet_messages = {
    \ "regex":   ['invalid-name',
                \ 'missing-docstring',
                \ 'too-few-public-methods'],
    \ }
let g:syntastic_python_checkers = ['pyflake', 'python', 'mypy']

" Chromebook mappings
" Change windows
nmap <leader>wj :wincmd h<CR> 
nmap <leader>wk :wincmd l<CR>

" Backspace fix
set backspace=indent,eol,start

" Split to tab
nmap <leader>ts <C-w>T

" Clipboard yank
noremap <leader>yy :'<,'>w ! xclip -i -selection clipboard<CR><CR>
noremap <leader>pp :read ! xclip -o -selection<CR>

" Reformat paragraph
noremap <leader>rp v}gw 

let maplocalleader=","
nmap <localleader>e :TidalSend<CR>

set visualbell

" Algo2Tad
au BufRead,BufNewFile *.tad
\ nmap <c-l> :w<Return>:!python ~/algoritmos2/herramientas/algo2tad.py %<Return>:source %:r.vim<Return>|
\ imap <c-l> <Esc><c-l>

au FileType tex syn region commentFold start="%-%" end="^$" fold 
au FileType tex hi commentFold ctermfg=DarkBlue
au FileType tex hi Folded ctermfg=DarkBlue ctermbg=Black
au FileType tex set foldmethod=syntax
