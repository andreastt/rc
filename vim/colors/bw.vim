hi clear
set background=light
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = 'beauty256'

hi Normal gui=none guifg=Black guibg=White ctermfg=0 ctermbg=231

hi Cursor guifg=White guibg=Black ctermfg=231 ctermbg=16
hi LineNr gui=bold guifg=#828c95 guibg=#bbbbbb ctermfg=244 ctermbg=7
hi NonText gui=bold guifg=DarkGray guibg=#bbbbbb ctermfg=7 ctermbg=NONE
hi SpecialKey term=bold ctermfg=4
hi Title term=bold ctermfg=5
hi Visual term=reverse ctermbg=7 guifg=White guibg=#829db9
hi Ignore ctermfg=bg guifg=bg

hi FoldColumn guifg=Black guibg=#979797 ctermbg=7 ctermfg=4
hi Folded guifg=Black guibg=#bbbbbb  ctermbg=7 ctermfg=244
hi StatusLine guifg=#ddddff guibg=#220088 ctermfg=5 ctermbg=231
hi StatusLineNC guifg=#829db9 guibg=Black ctermfg=8 ctermbg=188
hi VertSplit gui=bold guifg=#9ca6af guibg=Black cterm=bold ctermfg=231 ctermbg=8
hi Wildmenu guifg=Black guibg=White ctermfg=0 ctermbg=11
hi Pmenu guibg=Grey65 guifg=Black gui=none ctermfg=250 ctermbg=238
hi PmenuSbar guibg=Grey50 guifg=fg gui=none ctermbg=214
hi PmenuSel guibg=Yellow guifg=Black gui=none ctermbg=214 ctermfg=16
hi PmenuThumb guibg=Grey75 guifg=fg gui=none cterm=reverse

hi IncSearch cterm=reverse
hi Search ctermbg=11 ctermfg=0

hi ModeMsg ctermfg=0 ctermbg=11
hi MoreMsg gui=bold guifg=ForestGreen
hi Question gui=bold guifg=ForestGreen
hi WarningMsg ctermbg=9

hi Comment ctermfg=8 ctermbg=NONE
hi Special ctermfg=8
hi Error ctermfg=15 ctermbg=197
hi Identifier ctermfg=0
hi PreProc ctermfg=0
hi Todo cterm=bold ctermfg=21 ctermbg=NONE
hi Type ctermfg=0
hi Underlined gui=underline guifg=Blue
hi Directory ctermfg=132
hi Pmenu ctermfg=250 ctermbg=238
hi PmenuSel ctermbg=214 ctermfg=16

hi Boolean ctermfg=0
hi Constant ctermfg=0
hi Number ctermfg=0
hi String ctermfg=0
hi helpNote ctermbg=220 ctermfg=16

hi Label gui=bold,underline guifg=Sienna4
hi Statement ctermfg=0
hi htmlStatement ctermfg=0

hi htmlBold gui=bold
hi htmlItalic gui=italic
hi htmlUnderline gui=underline
hi htmlBoldItalic gui=bold,italic
hi htmlBoldUnderline gui=bold,underline
hi htmlBoldUnderlineItalic gui=bold,underline,italic
hi htmlUnderlineItalic gui=underline,italic

"hi docSpecial guifg=RoyalBlue1
"hi docTrans guibg=White guifg=White
"hi docCode guifg=#00aa00