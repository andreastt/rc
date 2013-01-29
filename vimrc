" -----------------------------------------------------------------------------
" | VIM Settings |
" | (see gvimrc for gui vim settings) |
" -----------------------------------------------------------------------------

set nocompatible
 
" Tabs ************************************************************************
"set tabstop=4      " how many columns a tab counts for, affects look
set expandtab     " produces the appropriate number of spaces
set shiftwidth=2  " how many columns on reindent operations
"set softtabstop   " see http://tedlogan.com/techblog3.html

 
" Indenting ********************************************************************
"set ai " Automatically set the indent of a new line (local to buffer)
"set si " smartindent  (local to buffer)

set autoindent
set smartindent


" Whitespaces ****************************************************************
highlight RedundantWhitespace ctermbg=red guibg=red
match RedundantWhitespace /\s\s$\| \+\ze\t/


" Comments *******************************************************************
set comments=b:#,:%,n:>,n:\|
 

" Scrollbars ******************************************************************
set sidescrolloff=2
set numberwidth=4
 
 
" Windows *********************************************************************
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright
 
"Vertical split then hop to new buffer
:noremap ,v :vsp^M^W^W<cr>
:noremap ,h :split^M^W^W<cr>
 
 
" Cursor highlights ***********************************************************
"set cursorline
"set cursorcolumn
 
 
" Searching *******************************************************************
set hlsearch   " highlight search
set incsearch  " incremental search, search as you type
set ignorecase " Ignore case when searching
set smartcase  " Ignore case when searching lowercase
 
 
" Colors **********************************************************************
set t_Co=256 " 256 colors
"set background=dark
syntax on

colorscheme muon
"colorscheme beauty256

 
" Status Line *****************************************************************
"set showcmd
"set ruler " Show ruler
"set ch=2 " Make command line two lines high
"set statusline=%f\ %2*%m\ %1*%h%r%=[%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}\ %{getfperm(@%)}]\ 0x%B\ %12.(%c:%l/%L%)
 
 
" Line Wrapping ***************************************************************
set nowrap
set linebreak  " Wrap at word
set joinspaces " Sane space operation
"set textwidth=72
set textwidth=0

 
" Mappings ********************************************************************
" Map leader to |
"let mapleader = "|"

" Map t to NERDtree.
nmap t :NERDTree<Enter>

" Have Q reformat the current paragraph (or selected text if there is any):
nnoremap Q gqap
vnoremap Q gq


" Directories *****************************************************************
" Setup backup location and enable
set backupdir=/tmp
set backup
 
" Set Swap directory
set directory=/tmp
 
 
" File Stuff ******************************************************************
filetype plugin on
filetype indent on

" Enable filetype detection:
filetype on

" For C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent

" For actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro cindent

" For Perl programming, have thins in braces indenting themselves:
autocmd FileType perl set smartindent

" For HTML, generally format text, but if a long line has been created, leave
" it alone when editing.
autocmd FileType html set filetype=xhtml formatoptions+=tl

" For CSS, also have things in braces indented:
autocmd FileType css set smartindent

" For both CSS and HTML, use spaces instead of tabs, and make tab stop
" at 2 characters:
autocmd FileType html,css set expandtab smartindent tabstop=2 "textwidth=78
let g:html_indent_inctags = "body,head,tbody,p,article,header,footer,section"

" No textwidth on programming files.
autocmd FileType pl,pm,c,h,rb,php set textwidth=0

" In makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8

autocmd FileType python set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 smarttab expandtab

autocmd FileType json set autoindent formatoptions=tcq21 shiftwidth=2 softtabstop=2 tabstop=8 expandtab foldmethod=syntax

" Golang
autocmd FileType go set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

if has("autocmd") && exists("+omnifunc")
        autocmd Filetype *
        \ if &omnifunc == "" |
        \   setlocal omnifunc=syntaxcomplete#Complete |
        \endif
endif


" Inser New Line **************************************************************
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>
set fo-=r " do not insert a comment leader after an enter, (no work, fix!!)
 

" Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
 
 
" Misc ************************************************************************
set backspace=indent,eol,start
"set number " Show line numbers
set matchpairs+=<:>
set vb t_vb= " Turn off the bell, this could be more annoying, but I'm not sure how
 

" Mouse ***********************************************************************
set mouse=a          " Enable the mouse
set selectmode=mouse " Behave xterm
 
 
" Cursor Movement *************************************************************
" Make cursor move by visual lines instead of file lines (when wrapping)
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge
 
 
" GUI ************************************************************************
if has("gui_running")
  set guioptions=egmrt
endif
