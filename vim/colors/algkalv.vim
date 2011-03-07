" vi+ color file
" $moose: 2008/02/22

hi clear
	if exists("syntax_on")
		syntax reset
	endif
let g:colors_name="algkalv"

" C language
"hi cBracket	cterm=none		ctermfg=none		ctermbg=yellow
hi cDefine	cterm=none		ctermfg=none		ctermbg=lightcyan
hi cFormat	cterm=bold		ctermfg=blue
hi cOperator	cterm=none		ctermfg=yellow
" comments
hi Comment	cterm=none		ctermfg=none		ctermbg=lightblue
" C/C++ conditionals
hi Conditional	cterm=bold		ctermfg=blue
" numbers/hex
hi Constant	cterm=none		ctermfg=none
hi DiffAdd	cterm=bold		ctermfg=blue
hi diffAdded	cterm=bold		ctermfg=blue
hi DiffChange	cterm=none		ctermfg=none
hi DiffDelete	cterm=none		ctermfg=none
hi DiffFile	cterm=bold		ctermfg=black		ctermbg=lightcyan
hi DiffLine	cterm=none		ctermfg=black		ctermbg=lightblue
hi diffRemoved	cterm=none		ctermfg=none
hi DiffSubname	cterm=none		ctermfg=black		ctermbg=lightblue
hi DiffText	cterm=standout		ctermfg=none
hi Directory	cterm=bold		ctermfg=none
" XHTML entity
hi Entity	cterm=none		ctermfg=black		ctermbg=lightcyan
" unfinished edit and syntax error
hi Error	cterm=none		ctermfg=red		ctermbg=white
" error message in the status line
hi ErrorMsg	cterm=none		ctermfg=red		ctermbg=white
hi FoldColumn	cterm=standout		ctermfg=none
hi Folded	cterm=standout		ctermfg=none
" XHTML tags
hi Function	cterm=bold		ctermfg=blue
hi htmlScriptTag cterm=none		ctermfg=blue
" brackets
hi Identifier	cterm=none		ctermfg=none
hi Ignore	cterm=bold		ctermfg=none
hi Include	cterm=none		ctermfg=none		ctermbg=lightcyan
hi IncSearch	cterm=reverse		ctermfg=none
" line numbers
hi LineNr	cterm=none		ctermfg=blue
hi MoreMsg	cterm=bold		ctermfg=none
" insert/visual mode information
hi ModeMsg	cterm=bold		ctermfg=none		ctermbg=yellow
" ~ at the end
hi NonText	cterm=none		ctermfg=blue
" C/C++ preprocessor defines, names
hi PreProc	cterm=none		ctermfg=none
hi Property	cterm=bold		ctermfg=lightblue
" status confirmation message or question
hi Question	cterm=none		ctermfg=none		ctermbg=cyan
" search highlight - requires 'set hlsearch' in .vimrc
hi Search	cterm=reverse		ctermfg=none
" XHTML server-side includes
hi ServerInc	cterm=none		ctermfg=black		ctermbg=lightblue
hi Special	cterm=bold		ctermfg=none
hi SpecialKey	cterm=bold		ctermfg=none
hi Statement	cterm=bold		ctermfg=none
" split view, status line, current document
hi StatusLine	cterm=bold		ctermfg=black		ctermbg=lightcyan
" split view, status line, the other document
hi StatusLineNC	cterm=none		ctermfg=none
" XHTML server-side includes
hi String	cterm=none		ctermbg=cyan
" XHTML tags
hi Tagg		cterm=none		ctermfg=lightcyan
" XHTML title tag
hi Title	cterm=bold		ctermfg=none
hi Todo		cterm=standout		ctermfg=none
" CSS property/value
hi Type		cterm=none		ctermfg=none
hi Underlined	cterm=underline		ctermfg=none
" Vertical split
hi VertSplit	cterm=none		ctermfg=black		ctermbg=lightcyan
hi VisualNOS	cterm=bold,underline	ctermfg=none
hi WarningMsg	cterm=standout		ctermfg=none
hi WildMenu	cterm=standout		ctermfg=none

