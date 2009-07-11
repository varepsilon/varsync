let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
imap <F9> :w!:make
imap <F4> :mks!
imap <F2> :w!
inoremap <expr> <C-Space> (&omnifunc == '' || pumvisible() ? "\" : "\\")
inoremap <C-S-Space> 
cnoremap <S-Del> <Del>
inoremap <S-Del> <Del>
cnoremap <S-BS> <BS>
inoremap <S-BS> <BS>
cnoremap <C-Del> <Del>
inoremap <C-Del> "_dw
cnoremap <C-BS> 
inoremap <C-BS> 
inoremap <C-CR> o
inoremap <S-CR> 
inoremap <S-Tab> 	
inoremap <C-S-F3> #
inoremap <C-F3> *
inoremap <S-F3> N
inoremap <F3> n
inoremap <silent> <C-Down> :move .+1
inoremap <silent> <C-Up> :move .-2
inoremap <C-PageDown> L
inoremap <C-PageUp> H
inoremap <C-End> G$
inoremap <C-Home> gg0
inoremap <C-S-Home> <S-Home>gg
map! <S-Insert> <MiddleMouse>
cnoremap <C-Insert> 
vnoremap  ggVG$
nnoremap  ggVG$
vnoremap <silent> <expr>  (mode() =~# "[vV]" ? "\0o$" : "")
nnoremap  
nnoremap  "+Y
vnoremap  "_d
nnoremap  "_dw
vnoremap <silent> <expr>  winheight(0)/2 . "\"
nnoremap <silent> <expr>  winheight(0)/2 . "\"
vnoremap  :promptrepl
nnoremap  :promptrepl
xnoremap i l
xnoremap e j
xnoremap u k
xnoremap n h
xnoremap  
snoremap  <C-End><End>
xnoremap  G$
nnoremap  G$
vnoremap 	 <Nul>
nnoremap <silent> 	 :nohlsearch|pclose
snoremap <NL> <C-Home><Home>
xnoremap <NL> gg0
nnoremap <NL> gg0
onoremap  B
vnoremap  B
nnoremap  B
nnoremap  i
vnoremap  :browse tabnew
nnoremap  :browse tabnew
nnoremap i l
nnoremap e j
nnoremap u k
nnoremap n h
nnoremap  
noremap <silent>  :tabnew
vnoremap <silent> <expr>  winheight(0)/2 . "\"
nnoremap <silent> <expr>  winheight(0)/2 . "\"
noremap <silent>  :call CloseWindow()
nnoremap  "+dd
onoremap  W
vnoremap  W
nnoremap  W
xnoremap <silent>   :let b:tmp_var=&sw|set sw=1|normal! gv>:let &sw=b:tmp_var|normal! gv
nnoremap   i <Right>
nnoremap ( 
nnoremap ) 	
onoremap , e
xnoremap , e
nnoremap , e
onoremap - gg
xnoremap - gg
nnoremap - gg
inoremap <expr> � pumvisible() ? "\<C-n>" : "\<C-x>\<C-o>\<C-n>\<C-p>\<C-r>=pumvisible() ? \"\\<Down>\" : \"\"\<CR>"
xnoremap ; z
nnoremap ; z
xnoremap A V
nnoremap A V
imap ° \right)
imap ¹ \left(
inoremap <expr> » pumvisible() ? "\<C-n>" : "\<C-x>\<C-o>\<C-n>\<C-p>\<C-r>=pumvisible() ? \"\\<Down>\" : \"\"\<CR>"
onoremap B ,
xnoremap B ,
nnoremap B ,
imap ä \dot{}s
imap æ \frac{}{}nns
imap ï <Right><Right>
imap Ý \right]
imap Û \left[
imap å <Down>
imap õ <Up>
imap î <Left>
imap é <Right>
xnoremap C y
nnoremap C yy
onoremap E 5j
xnoremap <silent> E @='5e'
nnoremap <silent> E @='5e'
onoremap F F
xnoremap F F
nnoremap F F
onoremap I 5l
xnoremap <silent> I @='5i'
nnoremap <silent> I @='5i'
onoremap K N
xnoremap K N
nnoremap K N
onoremap L ^
xnoremap L ^
nnoremap L ^
onoremap N 5h
xnoremap <silent> N @='5n'
nnoremap <silent> N @='5n'
onoremap P T
xnoremap P T
nnoremap P T
vmap Q gq
nnoremap Q @q
omap Q gq
xnoremap <silent> <expr> S (mode() =~# "[V]" ? "\0o$I" : "I")
nnoremap S I
xnoremap <silent> <expr> T (mode() =~# "[V]" ? "\0o$A" : "A")
nnoremap T A
onoremap U 5k
xnoremap <silent> U @='5u'
nnoremap <silent> U @='5u'
xnoremap V p
nnoremap V p
xnoremap W C
nnoremap W C
xnoremap X d
nnoremap X dd
onoremap Y $
xnoremap Y $
nnoremap Y $
xnoremap Z :redo
nnoremap Z 
nmap <silent> \tl :exe 'Tlist'|wincmd p
map \c s{,t}
map \p s(,t)
onoremap _ G
xnoremap _ G
nnoremap _ G
xnoremap a v
nnoremap a v
onoremap b ;
xnoremap b ;
nnoremap b ;
xnoremap c y
nnoremap c y
onoremap e j
xnoremap e j
nnoremap e j
onoremap f f
xnoremap f f
nnoremap f f
nmap gx <Plug>NetrwBrowseX
xnoremap gQ Q
nnoremap gQ Q
xnoremap gU U
nnoremap gU U
xnoremap gX X
nnoremap gX X
xnoremap gK K
nnoremap gK K
xnoremap gs s
nnoremap gs s
onoremap g, ge
xnoremap g, ge
nnoremap g, ge
xnoremap <silent> <expr> h winheight(0)-1 . "\"
nnoremap <silent> <expr> h winheight(0)-1 . "\"
onoremap i l
xnoremap i l
nnoremap i l
xnoremap <silent> <expr> j winheight(0)-1 . "\"
nnoremap <silent> <expr> j winheight(0)-1 . "\"
onoremap k n
xnoremap k n
nnoremap k n
onoremap l b
xnoremap l b
nnoremap l b
onoremap n h
xnoremap n h
nnoremap n h
onoremap p t
xnoremap p t
nnoremap p t
xnoremap <silent> <expr> s (mode() =~# "[V]" ? "\0o$I" : "I")
nnoremap s i
xnoremap <silent> <expr> t (mode() =~# "[V]" ? "\0o$A" : "A")
nnoremap t a
onoremap u k
xnoremap u k
nnoremap u k
xnoremap v gP
nnoremap v gP
nnoremap ww cc
xnoremap w c
nnoremap w c
xnoremap x d
nnoremap x x
onoremap y w
xnoremap y w
nnoremap y w
xnoremap z :undo
nnoremap z u
map <F12> :set tw=0 wrap linebreak
map <S-Insert> <MiddleMouse>
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
map <F8> :call clearmatches()
map <F7> :match ErrorMsg '\%>80v.\+'
map <F9> :w!:make
map <F6> :TlistToggle
map <F5> :bnext
map <F4> :mks!
map <F2> :w!
map <F11> :set spell spelllang=
map <F10> :set spell spelllang=ru,en
nnoremap <S-Del> "_d$
nnoremap <S-BS> "_d^
nnoremap <C-Del> "_dw
nnoremap <C-BS> a<Left><Right>
vnoremap <BS> "_d
nnoremap <BS> a<Left><BS><Right>
vnoremap <Del> "_d
nnoremap <Del> "_x
nnoremap <C-CR> o
nnoremap <S-CR> O
vnoremap <S-Tab> >gv
nnoremap <S-Tab> i	<Right>
xnoremap <silent> <S-Space> :let b:tmp_var=&sw|set sw=1|normal! gv<:let &sw=b:tmp_var|normal! gv
noremap <silent> <C-S-Tab> :tabprev
noremap <silent> <C-Tab> :tabnext
vnoremap <C-S-F3> #
nnoremap <C-S-F3> #
vnoremap <C-F3> *
nnoremap <C-F3> *
vnoremap <S-F3> N
nnoremap <S-F3> N
vnoremap <F3> n
nnoremap <F3> n
noremap <C-LeftDrag> <LeftDrag>
noremap <S-LeftMouse> <LeftMouse>V
noremap <C-LeftMouse> <LeftMouse>
vnoremap <silent> <C-Down> :move '>+1gv
vnoremap <silent> <C-Up> :move '<-2gv
nnoremap <silent> <C-Down> :move .+1
nnoremap <silent> <C-Up> :move .-2
vnoremap <C-PageDown> L
nnoremap <C-PageDown> L
vnoremap <C-PageUp> H
nnoremap <C-PageUp> H
snoremap <C-End> <C-End><End>
xnoremap <C-End> G$
nnoremap <C-End> G$
snoremap <C-Home> <C-Home><Home>
xnoremap <C-Home> gg0
nnoremap <C-Home> gg0
vnoremap <C-S-Home> <S-Home>gg
nnoremap <C-S-Home> <S-Home>gg
nnoremap <silent> <F1> :tab help
vnoremap <silent> <expr> <S-PageDown> winheight(0)-1 . "\"
vnoremap <silent> <expr> <S-PageUp> winheight(0)-1 . "\"
vnoremap <silent> <expr> <PageDown> winheight(0)-1 . "\"
vnoremap <silent> <expr> <PageUp> winheight(0)-1 . "\"
nnoremap <silent> <expr> <PageDown> winheight(0)-1 . "\"
nnoremap <silent> <expr> <PageUp> winheight(0)-1 . "\"
cnoremap  
inoremap  
cnoremap  
cnoremap  <Del>
inoremap  <Del>
inoremap  <Down>
inoremap  :promptrepl
cnoremap  <C-Right>
inoremap  <C-Right>
inoremap 	 
cnoremap <NL> <C-Left>
inoremap <NL> <C-Left>
cnoremap  <Left>
inoremap  <Left>
inoremap <expr>  pumvisible() ? "\" : "\u\"
inoremap <expr>  pumvisible() ? "\<C-n>" : "\<C-n>\<C-r>=pumvisible() ? \"\\<Down>\" : \"\"\<CR>"
inoremap  <Up>
cnoremap  +
cnoremap <silent>  :call CloseWindow()
inoremap <silent>  :call CloseWindow()
cnoremap  <Right>
inoremap  <Right>
map ç o\begin{gather*}\end{gather*}<Up><S-Tab>
map å o\begin{equation*}\end{equation*}<Up><S-Tab>
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set background=dark
set backspace=indent,eol,start
set cmdheight=2
set completeopt=longest,menuone
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set guifont=Consolas\ 13
set guioptions=acirm
set helplang=ru
set hlsearch
set iminsert=0
set imsearch=0
set incsearch
set lazyredraw
set mouse=a
set ruler
set scrolloff=1
set shiftwidth=4
set shortmess=aoO
set showtabline=2
set smartindent
set spelllang=ru,en
set nostartofline
set tabstop=4
set termencoding=utf-8
set virtualedit=block
set whichwrap=b,s,[,],<,>,h,l
set window=35
set winwidth=1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/progs/projects/varsync/trunk
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +6 testsuite/ssh-basic.test
badd +177 Makefile
badd +256 runtests.sh
badd +24 ./benchmark/run.rb
badd +57 ~/progs/projects/site-queries/trunk/proto/lib/run.rb
badd +32 ./orig/rrsync/rrsync.rb
badd +348 ~/.vimrc
badd +17 ~/progs/projects/site-queries/trunk/proto/test/test_extract_queries.rb
badd +466 options.c
badd +1845 flist.c
badd +265 checksum.c
badd +534 rsync.h
badd +32 byteorder.h
badd +615 config.h
badd +9 drafts/1.c
badd +71 proto.h
badd +33 lib/compat.c
badd +754 receiver.c
badd +227 generator.c
badd +350 match.c
badd +994 clientserver.c
badd +345 sender.c
badd +1038 main.c
badd +1204 io.c
badd +32 io.h
badd +30 errcode.h
badd +80 log.c
badd +2860 rsync.yo
badd +298 rsync.c
args testsuite/ssh-basic.test
edit ./benchmark/run.rb
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=RubyBalloonexpr()
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=^\\s*#\\s*define
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=indent
setlocal foldminlines=1
setlocal foldnestmax=0
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=^\\s*\\<\\(load\\|w*require\\)\\>
setlocal includeexpr=substitute(substitute(v:fname,'::','/','g'),'$','.rb','')
setlocal indentexpr=GetRubyIndent()
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,=end,=elsif,=when,=ensure,=rescue,==begin,==end
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri\ -T
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=rubycomplete#Complete
setlocal path=.,/usr/lib/ruby/site_ruby/1.8,/usr/lib/ruby/site_ruby/1.8/x86_64-linux,/usr/lib/ruby/site_ruby,/usr/lib/ruby/vendor_ruby/1.8,/usr/lib/ruby/vendor_ruby/1.8/x86_64-linux,/usr/lib/ruby/vendor_ruby,/usr/lib/ruby/1.8,/usr/lib/ruby/1.8/x86_64-linux,,~/.gem/ruby/1.8/gems/gettext-2.0.1/lib,~/.gem/ruby/1.8/gems/locale-2.0.1/lib,~/.gem/ruby/1.8/gems/unicode-0.1/.,/usr/lib/ruby/gems/1.8/gems/gettext-2.0.1/lib,/usr/lib/ruby/gems/1.8/gems/hpricot-0.6/lib,/usr/lib/ruby/gems/1.8/gems/hpricot-0.6/lib/i686-linux,/usr/lib/ruby/gems/1.8/gems/rutils-1.0.2/lib,/usr/lib/ruby/gems/1.8/gems/unicode-0.1/.,/usr/lib/ruby/gems/1.8/gems/ya2yaml-0.26/lib
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal smartindent
setlocal softtabstop=0
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=.rb
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=2
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 22 - ((12 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
22
normal! 027l
tabedit checksum.c
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 30 + 55) / 111)
exe 'vert 2resize ' . ((&columns * 80 + 55) / 111)
argglobal
enew
file __Tag_List__
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <kMultiply> :silent! %foldopen!
inoremap <buffer> <silent> <kMinus> :silent! foldclose
inoremap <buffer> <silent> <kPlus> :silent! foldopen
nnoremap <buffer> <silent> * :silent! %foldopen!
nnoremap <buffer> <silent> + :silent! foldopen
nnoremap <buffer> <silent> - :silent! foldclose
nnoremap <buffer> <silent> = :silent! %foldclose
nnoremap <buffer> <silent> q :close
nnoremap <buffer> <silent> <kMultiply> :silent! %foldopen!
nnoremap <buffer> <silent> <kMinus> :silent! foldclose
nnoremap <buffer> <silent> <kPlus> :silent! foldopen
inoremap <buffer> <silent> * :silent! %foldopen!
inoremap <buffer> <silent> + :silent! foldopen
inoremap <buffer> <silent> - :silent! foldclose
inoremap <buffer> <silent> = :silent! %foldclose
inoremap <buffer> <silent> q :close
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=Tlist_Ballon_Expr()
setlocal nobinary
setlocal bufhidden=delete
setlocal nobuflisted
setlocal buftype=nofile
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'taglist'
setlocal filetype=taglist
endif
setlocal foldcolumn=3
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=9999
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=0
setlocal foldnestmax=20
setlocal foldtext=v:folddashes.getline(v:foldstart)
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal nomodifiable
setlocal nrformats=octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal smartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=ru,en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'taglist'
setlocal syntax=taglist
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
set winfixwidth
setlocal winfixwidth
setlocal nowrap
setlocal wrapmargin=0
wincmd w
argglobal
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'c'
setlocal filetype=c
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal smartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=ru,en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
setlocal syntax=c
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
46,83fold
85,116fold
130,199fold
200,250fold
46
normal zc
85
normal zc
130
normal zc
200
normal zc
let s:l = 270 - ((6 * winheight(0) + 16) / 33)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
270
normal! 021l
wincmd w
exe 'vert 1resize ' . ((&columns * 30 + 55) / 111)
exe 'vert 2resize ' . ((&columns * 80 + 55) / 111)
tabedit generator.c
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'c'
setlocal filetype=c
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal smartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=ru,en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
setlocal syntax=c
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 804 - ((32 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
804
normal! 019l
tabedit match.c
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 30 + 55) / 111)
exe 'vert 2resize ' . ((&columns * 80 + 55) / 111)
argglobal
enew
file __Tag_List__
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <kMultiply> :silent! %foldopen!
inoremap <buffer> <silent> <kMinus> :silent! foldclose
inoremap <buffer> <silent> <kPlus> :silent! foldopen
nnoremap <buffer> <silent> * :silent! %foldopen!
nnoremap <buffer> <silent> + :silent! foldopen
nnoremap <buffer> <silent> - :silent! foldclose
nnoremap <buffer> <silent> = :silent! %foldclose
nnoremap <buffer> <silent> q :close
nnoremap <buffer> <silent> <kMultiply> :silent! %foldopen!
nnoremap <buffer> <silent> <kMinus> :silent! foldclose
nnoremap <buffer> <silent> <kPlus> :silent! foldopen
inoremap <buffer> <silent> * :silent! %foldopen!
inoremap <buffer> <silent> + :silent! foldopen
inoremap <buffer> <silent> - :silent! foldclose
inoremap <buffer> <silent> = :silent! %foldclose
inoremap <buffer> <silent> q :close
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=Tlist_Ballon_Expr()
setlocal nobinary
setlocal bufhidden=delete
setlocal nobuflisted
setlocal buftype=nofile
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'taglist'
setlocal filetype=taglist
endif
setlocal foldcolumn=3
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=9999
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=0
setlocal foldnestmax=20
setlocal foldtext=v:folddashes.getline(v:foldstart)
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal nomodifiable
setlocal nrformats=octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal smartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=ru,en
setlocal statusline=
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'taglist'
setlocal syntax=taglist
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
set winfixwidth
setlocal winfixwidth
setlocal nowrap
setlocal wrapmargin=0
wincmd w
argglobal
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'c'
setlocal filetype=c
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=0
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal smartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=ru,en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
setlocal syntax=c
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 350 - ((7 * winheight(0) + 16) / 33)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
350
normal! 03l
wincmd w
exe 'vert 1resize ' . ((&columns * 30 + 55) / 111)
exe 'vert 2resize ' . ((&columns * 80 + 55) / 111)
tabedit rsync.h
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'cpp'
setlocal filetype=cpp
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=0
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
set linebreak
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal smartindent
setlocal softtabstop=0
set spell
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'cpp'
setlocal syntax=cpp
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 585 - ((16 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
585
normal! 08l
tabedit sender.c
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'c'
setlocal filetype=c
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=0
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=ccomplete#Complete
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=4
setlocal noshortname
setlocal smartindent
setlocal softtabstop=0
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=ru,en
setlocal statusline=
setlocal suffixesadd=
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'c'
setlocal syntax=c
endif
setlocal tabstop=4
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabnext 5
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=1 shortmess=aoO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . s:sx
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
