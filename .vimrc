" Sample .vimrc file by Martin Brochhaus
" Presented at PyCon APAC 2012


" ============================================
" Note to myself:
" DO NOT USE <C-z> FOR SAVING WHEN PRESENTING!
" ============================================


" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Specific syntax
autocmd BufNewFile,BufRead *.wppl set syntax=javascript


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" easier moving between tabs
map <Leader>j <esc>:tabprevious<CR>
map <Leader>k <esc>:tabnext<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and length
set number  " show line numbers
set colorcolumn=80
highlight ColorColumn ctermbg=233

set tw=79   " width of document (used by gd)
set wrap  " automatically wrap on load
set linebreak
set nolist  " list disables linebreak
" " set formatoptions-=t   " automatically wrap text when typing

" Real programmers don't use TABs but spaces
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Right side tab width
let right_side_width = min([100, &columns - 90])


" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()


" lightline
let g:lightline = {
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" Taglist
let Tlist_Close_On_Select = 0
let Tlist_Use_Right_Window = 1


" ============================================================================
" Python IDE Setup
" ============================================================================


" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2
"" let g:Powerline_symbols = 'fancy'
"" set encoding=utf-8
set nocompatible
set t_Co=256


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

" YouCompleteMe
let g:ycm_key_invoke_completion = '<C-Tab>'
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
noremap <leader>d :YcmCompleter GoTo<CR>

" Jedi-vim
let g:jedi#completions_command = '<C-j>'
let g:jedi#use_tabs_not_buffers = 1

" Jedi-vim
let g:jedi#use_tabs_not_buffers = 1

" ============================================================================
" TagBar Plugin 
" ============================================================================

nmap <leader>o :TagbarToggle<CR>

let g:tagbar_width = right_side_width
let g:tagbar_sort = 0
let g:tagbar_compact = 1

" Syntastic
let g:syntastic_quiet_messages = {
    \ "regex":   ['invalid-name',
                \ 'missing-docstring',
                \ 'too-few-public-methods'],
    \ }
let g:syntastic_python_checkers = ['pyflake', 'python']

command Pylint SyntasticCheck pylint

" Chromebook mappings
" Change windows
nmap <leader>wj :wincmd h<CR> 
nmap <leader>wk :wincmd l<CR>

" Jedi completions
let g:jedi#completions_command = "<C-J>"

" ============================================================================
" Vundle 
" ============================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
call vundle#end()            " required
filetype plugin indent on    " required

" LanguageTool
let g:languagetool_jar="~/.languagetool/LanguageTool-3.8/languagetool-commandline.jar"
