syn clear

if exists("b:current_syntax")
    finish
endif
let s:cpo_save = &cpo
set cpo&vim

syn match bmDir  /^[^|]\+/ contains=bmVar nextgroup=bmSep
    syn match bmVar  /\$\w\+/ contained contains=NONE
    syn match bmVar  /\${[^}]\+}\+/ contained contains=NONE


syn match bmSecond /|.*$/ contains=bmSep,bmName
    syn match bmSep  /|/ contained nextgroup=bmName
    syn match bmName /[^|]\+$/ contained

hi def link bmName Identifier
hi def link bmSep  Operator
hi def link bmVar  Type

let b:current_syntax = "bash-bookmarks"

let &cpo = s:cpo_save
unlet s:cpo_save
