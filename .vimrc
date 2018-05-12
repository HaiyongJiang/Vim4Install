" TODO:
" 1. install vim with python ruby php supports.
" 2. install exuberant ctags (sudo apt-get install exuberant-ctags)

set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

""""""""""""""""""""""""""""""""""""""""""""""
" # install vundle
"""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim_runtime/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
"" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'


" Plugin 'Valloric/YouCompleteM '
" *******************************************************************************
" nerdtree
" Better file browser
Plugin 'scrooloose/nerdtree'



" *******************************************************************************
" Code commenter
Plugin 'scrooloose/nerdcommenter'


" *******************************************************************************
" Class/module browser
Plugin 'majutsushi/tagbar'
" tagbar requires ctags
nmap <F8> :TagbarToggle<CR>


" *******************************************************************************
" Code and files fuzzy finder
" http://kien.github.io/ctrlp.vim/
Plugin 'ctrlpvim/ctrlp.vim'
"" Extension to ctrlp, for fuzzy command finder
Plugin 'fisadev/vim-ctrlp-cmdpalette'
" :CtrlP, :CtrlPBuffer, :CtrlPMRU, :CtrlPMixed, for files/buffers/MRU files search
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'


" *******************************************************************************
" " " Surround
" " Plugin 'tpope/vim-surround'
"

" *******************************************************************************
" Autoclose (propose potential match words)
Plugin 'Townk/vim-autoclose'


" " *******************************************************************************
" " Python autocompletion, go to definition.
" Plugin 'davidhalter/jedi-vim'
"

" *******************************************************************************
" Better autocompletion
Plugin 'Shougo/neocomplete.vim'
" " from neocomplete to deoplete
" if has('nvim')
"   Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plugin 'Shougo/deoplete.nvim'
"   Plugin 'roxma/nvim-yarp'
"   Plugin 'roxma/vim-hug-neovim-rpc'
" endif
" let g:deoplete#enable_at_startup = 1
"

" *******************************************************************************
" Python and other languages code checker
Plugin 'scrooloose/syntastic'
" let g:syntastic_python_checker = 'pyflakes,pep8'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
"

" *******************************************************************************
" Never use develop branch.
Plugin 'python-mode/python-mode' , { 'branch': 'develop' }
let g:pymode_python = ''
let g:pymode_lint = 0
let g:pymode_lint_on_write = 1
let g:pymode_lint_unmodified = 1
let g:pymode_lint_checker = ['pyflakes']
" note that syntax, using [] rather than ','
let g:pymode_lint_ignore = ['E265', 'E266', 'E402', 'E303', 'E302', 'E128', 'E501', 'E127', 'E231', 'E261', 'E262', 'E305', 'W', 'C901']

let g:pymode_rope_lookup_project = 1
let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_modules = ['torch', 'os', 'shutil', 'time', 'matplotlib', 'sys', 'tensorflow', 'numpy']
let g:pymode_rope_autoimport_after_complete = 1

" " Plugin 'hdima/python-syntax'
" "



call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" **************************************************************************
" python highlights
let g:python_highlight_all = 1
let g:python_version_2 = 1


" *******************************************************************************
" nerdcommenter

" add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" *******************************************************************************


" *******************************************************************************
" nerdtree options, cannot place behind 'plugin nerdtree'
" " How can I open a NERDTree automatically when vim starts up?
" autocmd vimenter * NERDTree
" auto focus on the file rather than the nerd tree
autocmd VimEnter * wincmd p
" How can I open a NERDTree automatically when vim starts up if no files were specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" How can I map a specific key or shortcut to open NERDTree?
map <C-n> :NERDTreeToggle<CR>
" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" How can I change default arrows?
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'


" *******************************************************************************
" setting for neocomplete:
" enable neocomplete
let g:neocomplete#enable_at_startup = 1
" Disable AutoComplPop.
let g:acp_enableAtStartup = 1
" Use neocomplete.

" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()




" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

filetype plugin on
syntax on

:hi Search term=standout ctermfg=0 ctermbg=3

syn keyword myTodoKeywords TODO TEST
highlight TodoKeywords cterm=bold term=bold ctermfg=Yellow
" TODO FIXME
hi Todo guifg=SkyBlue
:set relativenumber
:set number

" setup special keys;
let mapleader=','
