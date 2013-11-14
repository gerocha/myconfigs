syntax on
set nocp
set encoding=utf-8
set smarttab
set expandtab
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start
set autoindent
set sm
set showmode
set ruler
set title
set nu
set ttyfast
set cursorline
set nowrap
set ls=2
set hlsearch
set incsearch
set tabpagemax=15
set preserveindent
set modeline
set tabstop=8
set background=dark
set t_Co=256
filetype indent on

map <C-l> :set list listchars=tab:¬\ ,trail:·,extends:>,precedes:< <CR>

colorscheme wombat256mod

" 80 characters line
let &colorcolumn=join(range(81,999),",")
hi ColorColumn ctermfg=darkgrey ctermbg=black guifg=darkgrey guibg=black

autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Vundle
filetype off
filetype plugin indent on
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundle 'joonty/vim-phpqa.git'
Bundle 'vim-scripts/Git-Branch-Info'
Bundle 'vim-scripts/ctags.vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'vim-scripts/AutoComplPop'
Bundle 'scrooloose/nerdtree'
Bundle 'StanAngeloff/php.vim'
Bundle 'klen/python-mode'
Bundle 'hynek/python-pep8-indent'


" Bundle 'joonty/vdebug.git'
" Bundle 'joonty/vim-phpunitq'
" Bundle 'vim-scripts/po.vim'

" End Vundle

hi statusline ctermfg=darkgrey ctermbg=black guifg=darkgrey guibg=black
set statusline=%f                                       " Path to the file
set statusline+=\ -\                                    " Separator
set statusline+=\ %Y%y                                  " Type of the file
set statusline+=\ LANG:%{&spelllang}                    " Language
set statusline+=\ column:%c                             " Current Column
set statusline+=\ lines:%l/%L                           " Current line
set statusline+=\ %{''.(&fenc!=''?&fenc:&enc).''}       " Encoding
set statusline+=\ %{&ff}\                               " Format of the file


set statusline+=[
set statusline+=\ %{&wrap?'wrap':'nowrap'}
set statusline+=\ %{&hlsearch?'hlsearch':''}
set statusline+=\ %{&paste?'paste':''}
set statusline+=]
set statusline+=\ %r                                    " read only flag '[RO]'
set statusline+=\ %2*%m%*                               " modified flag '[+]' if modifiable
set statusline+=\ %h                                    " help flag '[Help]'

set statusline+=\ %{strftime(\"%Y-%m-%d\ %H:%M\")}

set statusline+=\ %4*%{GitBranchInfoString()}
let g:git_branch_status_head_current=1

" php syntax checker
au BufRead *.php map <F8> :w !php -l<CR>
" python syntax checker
" au BufRead *.py map <F8> :w !python <CR>
hi Error guifg=#ff0000 gui=undercurl

" php unit test
" au BufRead *.php map <F5> :Test %<CR>
"

" NerdTree
let g:NERDTreeWinPos = "right"
imap <F12> <ESC> :NERDTreeToggle <CR> i
map <F12> :NERDTreeToggle <CR>
vmap <F12> <ESC> :NERDTreeToggle <CR> v

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufRead *.vala,*.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala,*.vapi setfiletype vala
autocmd BufWritePre *.py :%s/\s\+$//e

" Python Mode
let g:pymode_rope = 1

let g:pymode_run_key = '<F8>'

let g:pymode_lint_write = 0
let g:pymode_rope_autocomplete_map = '<C-Space>'
let g:pymode_rope_auto_project = 1

let g:pymode_rope_vim_completion = 1


let g:pymode_folding = 1

let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8,mccabe"

let g:pymode_lint_minheight = 3
let g:pymode_lint_maxheight = 6

let g:pymode_lint_todo_symbol = 'WW'
let g:pymode_lint_comment_symbol = 'CC'
let g:pymode_lint_visual_symbol = 'RR'
let g:pymode_lint_error_symbol = 'EE'
let g:pymode_lint_info_symbol = 'II'
let g:pymode_lint_pyflakes_symbol = 'FF'

let g:pymode_virtualenv = 1

let g:pymode_indent = 1


" Enable pymode's custom syntax highlighting
let g:pymode_syntax = 1

" Enable all python highlightings
let g:pymode_syntax_all = 1

" Highlight "print" as a function
let g:pymode_syntax_print_as_function = 0

" Highlight indentation errors
let g:pymode_syntax_indent_errors = g:pymode_syntax_all

" Highlight trailing spaces
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Highlight string formatting
let g:pymode_syntax_string_formatting = g:pymode_syntax_all

" Highlight str.format syntax
let g:pymode_syntax_string_format = g:pymode_syntax_all

" Highlight string.Template syntax
let g:pymode_syntax_string_templates = g:pymode_syntax_all

" Highlight doc-tests
let g:pymode_syntax_doctests = g:pymode_syntax_all

" Highlight builtin objects (__doc__, self, etc)
let g:pymode_syntax_builtin_objs = g:pymode_syntax_all

" Highlight builtin functions
let g:pymode_syntax_builtin_funcs = g:pymode_syntax_all

" Highlight exceptions
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all

" Highlight equal operator
let g:pymode_syntax_highlight_equal_operator = g:pymode_syntax_all

" Highlight stars operator
let g:pymode_syntax_highlight_stars_operator = g:pymode_syntax_all

" Highlight `self`
let g:pymode_syntax_highlight_self = g:pymode_syntax_all

" For fast machines
let g:pymode_syntax_slow_sync = 0
