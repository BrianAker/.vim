" Vim syntax file
" Language:	MySQL
" Maintainer:	Konstantin Osipov <rabid@mail.ru>
" Last Change:	2003 June 28

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

" The SQL reserved words, defined as keywords.

syn keyword sqlSpecial  false null true

syn keyword sqlKeyword	add as asc begin by column
syn keyword sqlKeyword	compress connect current default desc
syn keyword sqlKeyword	else elsif end exclusive file for from
syn keyword sqlKeyword	function group having identified auto_increment
syn keyword sqlKeyword	index primary key into is loop mode modify
syn keyword sqlKeyword	nocompress nowait on off start distinct
syn keyword sqlKeyword	synonym table then to trigger like escape 
syn keyword sqlKeyword	unique user validate values view whenever
syn keyword sqlKeyword	where with option order privileges procedure
syn keyword sqlKeyword	public resource return row rowlabel rownum rows
syn keyword sqlKeyword	session share size smallint type using not and or
syn keyword sqlKeyword	in if any some all between exists

syn keyword sqlOperator union intersect minus

syn keyword sqlStatement alter analyze audit comment commit create
syn keyword sqlStatement delete drop execute explain grant insert lock noaudit
syn keyword sqlStatement rename revoke rollback savepoint select set
syn keyword sqlStatement truncate update show unlock replace check 

syn keyword sqlType	binary boolean bigint char character date decimal 
syn keyword sqlType	double float integer int long number raw smallint 
syn keyword sqlType	tinyint varchar varchar2 varray blob text mediumblob
syn keyword sqlType	mediumtext unsigned

" Strings and characters:
syn region sqlString		start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region sqlString		start=+'+  skip=+\\\\\|\\'+  end=+'+

" Numbers:
syn match sqlNumber		"-\=\<\d*\.\=[0-9_]\>"

" Comments:
syn region sqlComment    start="/\*"  end="\*/"
syn match sqlComment	"--.*"

syn sync ccomment sqlComment
syn match	sqlComment		"#.*$" 

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_sql_syn_inits")
  if version < 508
    let did_sql_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink sqlComment	Comment
  HiLink sqlKeyword	sqlSpecial
  HiLink sqlNumber	Number
  HiLink sqlOperator	sqlStatement
  HiLink sqlSpecial	Special
  HiLink sqlStatement	Statement
  HiLink sqlString	String
  HiLink sqlType	Type

  delcommand HiLink
endif

let b:current_syntax = "mysql_test"

" vim: ts=8
