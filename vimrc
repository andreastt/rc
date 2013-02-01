" ato's vim config

" Better safe than sorry
set nocompatible


" Tabs ************************************************************************
"set tabstop=4      " how many columns a tab counts for, affects look
set expandtab     " produces the appropriate number of spaces
set shiftwidth=2  " how many columns on reindent operations
"set softtabstop   " see http://tedlogan.com/techblog3.html


" Indenting ********************************************************************
set autoindent


" Whitespaces ****************************************************************
set listchars=tab:»·,trail:·
set list


" Comments *******************************************************************
"set comments=b:#,:%,n:>,n:\|


" Scrollbars ******************************************************************
set sidescrolloff=2
set numberwidth=4


" Windows *********************************************************************
set equalalways " Multiple windows, when created, are equal in size
set splitbelow splitright

"Vertical split then hop to new buffer
noremap ,v :vsp^M^W^W<cr>
noremap ,h :split^M^W^W<cr>


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
syntax on

colorscheme muon


" Line Wrapping ***************************************************************
set nowrap
set linebreak  " Wrap at word
set joinspaces " Sane space operation
"set textwidth=72
set textwidth=0


" Mappings ********************************************************************

" Rebind Tab to call C-f
set cinkeys=!^F
inoremap <Tab> <C-f>

" Have Q reform things that look similar to what surrounds the cursor, or just
" format the paragraph if in visual mode.
nmap q gqay
vnoremap q gq

" Insert New Line
map <S-Enter> O<ESC> " awesome, inserts new line without going into insert mode
map <Enter> o<ESC>

" Map Shift+j to Page Down, and Shift+k to Page Up
nnoremap <S-j> <PageDown>
nnoremap <S-k> <PageUp>


" Directories *****************************************************************
" Setup backup location and enable
set backupdir=/tmp
set backup

" Set Swap directory
set directory=/tmp


" Exuberant tags **************************************************************
" Traverse tree up to root until a tags file is found
set tags=./.tags;/


" File Stuff ******************************************************************
filetype on
filetype plugin on
filetype indent on

" For C-like programming, have automatic indentation:
"autocmd FileType c,cpp,slang set cindent

" Insert leading comment character automatically if starting a new line in the
" middle of a comment
autocmd FileType c,cpp,java set formatoptions+=ro cindent

autocmd FileType java set textwidth=100

" For both CSS and HTML, use spaces instead of tabs, and make tab stop
" at 2 characters:
autocmd FileType html,css set expandtab tabstop=2
let g:html_indent_inctags = "body,head,tbody,p,article,header,footer,section"

" In Makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
autocmd FileType make set noexpandtab shiftwidth=8

autocmd FileType python set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=99 smarttab expandtab

autocmd FileType json set formatoptions=tcq21 shiftwidth=2 softtabstop=2 tabstop=8 expandtab foldmethod=syntax

" Use tabs, but visually represent them using 4 columns
autocmd FileType go set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab


" Misc ************************************************************************
set backspace=indent,eol,start
set matchpairs+=<:>
set vb t_vb= " Turn off the bell, this could be more annoying, but I'm not sure how

" Sets what is saved when you save a session
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize


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

