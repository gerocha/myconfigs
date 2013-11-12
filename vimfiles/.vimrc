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
hi ColorColumn ctermfg=grey ctermbg=black guifg=grey guibg=black

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
au BufRead *.py map <F8> :w !python <CR>

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

"PyMode
"
"
"

" Disable pylint checking every save
let g:pymode_lint_write = 0
"
" Set key 'R' for run python code
let g:pymode_run_key = 'R'

" Load the whole plugin
let g:pymode = 1

" Load show documentation plugin
" let g:pymode_doc = 1
"
" " Show python documentation
let g:pymode_doc_key = 'K'
"
"

" Load run code plugin
 let g:pymode_run = 1
"
"

" Load pylint code plugin
let g:pymode_lint = 1
"
" " Switch pylint, pyflakes, pep8, mccabe code-checkers
" " Can have multiple values "pep8,pyflakes,mcccabe"
" " Choices are: pyflakes, pep8, mccabe, pylint, pep257
let g:pymode_lint_checker = "pyflakes,pep8,mccabe"
"
" " Skip errors and warnings
" " E.g. "E501,W002", "E2,W" (Skip all Warnings and Errors startswith E2) and
" etc
let g:pymode_lint_ignore = "E501"
"
" " Select errors and warnings
" " E.g. "E4,W"
let g:pymode_lint_select = ""
"
" " Run linter on the fly
let g:pymode_lint_onfly = 0
"
" " Pylint configuration file
" " If file not found use 'pylintrc' from python-mode plugin directory
let g:pymode_lint_config = "$HOME/.pylintrc"
"
" " Check code every save
let g:pymode_lint_write = 1
"
" " Auto open cwindow if errors were found
let g:pymode_lint_cwindow = 1
"
" " Show error message if cursor placed at the error line
let g:pymode_lint_message = 1
"
" " Auto jump on first error
let g:pymode_lint_jump = 0
"
" " Hold cursor in current window
" " when quickfix is open
let g:pymode_lint_hold = 0
"
" " Place error signs
let g:pymode_lint_signs = 1
"
" " Maximum allowed mccabe complexity
let g:pymode_lint_mccabe_complexity = 8
"
" " Minimal height of pylint error window
let g:pymode_lint_minheight = 3
"
" " Maximal height of pylint error window
let g:pymode_lint_maxheight = 6
"
" " Symbol definition
let g:pymode_lint_todo_symbol = 'WW'
let g:pymode_lint_comment_symbol = 'CC'
let g:pymode_lint_visual_symbol = 'RR'
let g:pymode_lint_error_symbol = 'EE'
let g:pymode_lint_info_symbol = 'II'
let g:pymode_lint_pyflakes_symbol = 'FF'

let g:pymode_virtualenv = 1

" Additional python paths
let g:pymode_paths = []
"
" " Load breakpoints plugin
let g:pymode_breakpoint = 1
"
" " Key for set/unset breakpoint
let g:pymode_breakpoint_key = '<leader>b'
"
" " Autoremove unused whitespaces
let g:pymode_utils_whitespaces = 1
"
" " Enable pymode indentation
let g:pymode_indent = 1
"
" " Set default pymode python options
let g:pymode_options = 1

"Enable python objects and motion
let g:pymode_motion = 1



" Enable python code folding
let g:pymode_folding = 1

"Enable pymode's custom syntax highlighting
let g:pymode_syntax = 1
"
" " Enable all python highlightings
let g:pymode_syntax_all = 1
"
" " Highlight "print" as a function
let g:pymode_syntax_print_as_function = 0
"
" " Highlight indentation errors
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"
" " Highlight trailing spaces
let g:pymode_syntax_space_errors = g:pymode_syntax_all
"
" " Highlight string formatting
let g:pymode_syntax_string_formatting = g:pymode_syntax_all
"
" " Highlight str.format syntax
let g:pymode_syntax_string_format = g:pymode_syntax_all
"
" " Highlight string.Template syntax
let g:pymode_syntax_string_templates = g:pymode_syntax_all
"
" " Highlight doc-tests
let g:pymode_syntax_doctests = g:pymode_syntax_all
"
" " Highlight builtin objects (__doc__, self, etc)
let g:pymode_syntax_builtin_objs = g:pymode_syntax_all
"
" " Highlight builtin functions
let g:pymode_syntax_builtin_funcs = g:pymode_syntax_all
"
" " Highlight exceptions
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all
"
" " Highlight equal operator
let g:pymode_syntax_highlight_equal_operator = g:pymode_syntax_all
"
" " Highlight stars operator
let g:pymode_syntax_highlight_stars_operator = g:pymode_syntax_all
"
" " Highlight `self`
let g:pymode_syntax_highlight_self = g:pymode_syntax_all
"
" " For fast machines
let g:pymode_syntax_slow_sync = 0


" Load rope plugin
let g:pymode_rope = 1

" Map keys for autocompletion
let g:pymode_rope_autocomplete_map = '<C-Space>'
"
" " Auto create and open ropeproject
let g:pymode_rope_auto_project = 1
"
" " Enable autoimport
let g:pymode_rope_enable_autoimport = 1
"
" " Auto generate global cache
let g:pymode_rope_autoimport_generate = 1
"
let g:pymode_rope_autoimport_underlineds = 0
"
let g:pymode_rope_codeassist_maxfixes = 10
"
let g:pymode_rope_sorted_completions = 1
"
let g:pymode_rope_extended_complete = 1
"
" let g:pymode_rope_autoimport_modules = ["os","shutil","datetime"]
"
" let g:pymode_rope_confirm_saving = 1
"
" let g:pymode_rope_global_prefix = "<C-x>p"
"
" let g:pymode_rope_local_prefix = "<C-c>r"
"
let g:pymode_rope_vim_completion = 1
"
" let g:pymode_rope_guess_project = 1
"
" let g:pymode_rope_goto_def_newwin = ""
"
" let g:pymode_rope_always_show_complete_menu = 0
