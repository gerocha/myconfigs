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

map <F10> :set list listchars=tab:¬\ ,trail:·,extends:>,precedes:< <CR>

colorscheme wombat256mod

" 80 characters line
let &colorcolumn=join(range(81,999),",")
hi ColorColumn ctermfg=grey ctermbg=black

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

" End Vundle

hi statusline ctermfg=darkgrey ctermbg=black
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

