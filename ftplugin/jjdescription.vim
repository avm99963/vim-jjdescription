" jjdescription filetype plugin
" Language:	jjdescription file
" Maintainer:	Adrià Vilanova <me@avm99963.com>
" Source: Based on ftplugin/gitcommit.vim
" Last Change:	2024 Jan 30

" Only do this when not done yet for this buffer
if (exists("b:did_ftplugin"))
  finish
endif

let b:did_ftplugin = 1

setlocal nomodeline tabstop=8 formatoptions+=tl textwidth=72
setlocal formatoptions-=c formatoptions-=r formatoptions-=o formatoptions-=q formatoptions+=n
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}]\\s\\+\\\|^\\s*[-*+]\\s\\+

let b:undo_ftplugin = 'setl modeline< tabstop< formatoptions< tw< com< cms< formatlistpat<'

let &l:comments = ':JJ: '
let &l:commentstring = 'JJ: %s'
