" jjdescription syntax file
" Language:	jjdescription file
" Maintainer:	Adrià Vilanova <me@avm99963.com>
" Filenames:	*.jjdescription
" Source: Based on syntax/gitcommit.vim
" Last Change:	2024 Oct 26

if exists("b:current_syntax")
  finish
endif

scriptencoding utf-8

syn case match
syn sync minlines=50
syn sync linebreaks=1

if has("spell")
  syn spell toplevel
endif

if get(g:, 'jjdescription_summary_length') < 0
  syn match   jjdescriptionSummary	"^.*$" contained containedin=jjdescriptionFirstLine nextgroup=jjdescriptionOverflow contains=@Spell
elseif get(g:, 'jjdescription_summary_length', 1) > 0
  exe 'syn match   jjdescriptionSummary	"^.*\%<' . (get(g:, 'jjdescription_summary_length', 50) + 1) . 'v." contained containedin=jjdescriptionFirstLine nextgroup=jjdescriptionOverflow contains=@Spell'
endif
syn match   jjdescriptionOverflow	".*" contained contains=@Spell
syn match   jjdescriptionBlank	"^.\+" contained contains=@Spell
syn match   jjdescriptionFirstLine	"\%^.*" nextgroup=jjdescriptionBlank,jjdescriptionComment skipnl

syn match   jjdescriptionComment "^JJ: .*"

syn match   jjdescriptionHeader	"\%(^JJ: \)\@<=\S.*:\%(\n^$\)\@!$" contained containedin=jjdescriptionComment

" Sigils extracted from https://github.com/martinvonz/jj/blob/95283dd04f7047c48356de1addd3d59d35ec5bce/cli/src/diff_util.rs#L1542.
syn match   jjdescriptionType		"\%(^JJ:\s\+\)\@<=[CRMAD]\ze " contained containedin=jjdescriptionComment nextgroup=jjdescriptionFile skipwhite
syn match   jjdescriptionFile		".*" contained

syn region  jjdescriptionSelected	start=/^\z(^JJ: \)This commit contains the following changes:$/ end=/^\z1$\|^\z1\@!/ contains=jjdescriptionHeader,jjdescriptionSelectedType containedin=jjdescriptionComment contained transparent fold

syn match   jjdescriptionSelectedType		"\%(^JJ:\s\+\)\@<=[CRMAD]\ze " contained nextgroup=jjdescriptionSelectedFile skipwhite
syn match   jjdescriptionSelectedFile	".*" contained

hi def link jjdescriptionSummary		Keyword
hi def link jjdescriptionComment		Comment
hi def link jjdescriptionSelectedType	jjdescriptionType
hi def link jjdescriptionType		Type
hi def link jjdescriptionHeader		PreProc
hi def link jjdescriptionSelectedFile	jjdescriptionFile
hi def link jjdescriptionFile		Constant
hi def link jjdescriptionBlank		Error

let b:current_syntax = "jjdescription"
