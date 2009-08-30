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
set guioptions=camri
set helplang=ru
set hlsearch
set incsearch
set lazyredraw
set mouse=a
set ruler
set scrolloff=1
set shiftwidth=4
set showtabline=2
set smartindent
set nostartofline
set tabstop=4
set termencoding=utf-8
set virtualedit=block
set whichwrap=b,s,[,],<,>,h,l
set window=36
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/progs/projects/varsync/trunk
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +58 ./benchmark/compare_sizes.rb
badd +31 ./benchmark/run.rb
badd +98 checksum.c
badd +1 rsync.h
badd +1344 io.c
badd +294 match.c
badd +1 generator.c
badd +942 acls.c
badd +1 byteorder.h
badd +317 sender.c
badd +1 TODO
badd +1 TODO.varsync
badd +387 receiver.c
badd +1 test/checksum_test.c
badd +1 options.c
badd +1 main.c
args ./benchmark/compare_sizes.rb
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
set foldmethod=syntax
setlocal foldmethod=indent
setlocal foldminlines=1
setlocal foldnestmax=0
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
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
setlocal path=.,/usr/lib/ruby/site_ruby/1.8,/usr/lib/ruby/site_ruby/1.8/x86_64-linux,/usr/lib/ruby/site_ruby,/usr/lib/ruby/vendor_ruby/1.8,/usr/lib/ruby/vendor_ruby/1.8/x86_64-linux,/usr/lib/ruby/vendor_ruby,/usr/lib/ruby/1.8,/usr/lib/ruby/1.8/x86_64-linux,,~/.gem/ruby/1.8/gems/gettext-2.0.1/lib,~/.gem/ruby/1.8/gems/locale-2.0.1/lib,~/.gem/ruby/1.8/gems/unicode-0.1/.,/usr/lib/ruby/gems/1.8/gems/gettext-2.0.1/lib,/usr/lib/ruby/gems/1.8/gems/hpricot-0.8/lib,/usr/lib/ruby/gems/1.8/gems/rutils-1.0.2/lib,/usr/lib/ruby/gems/1.8/gems/unicode-0.1/.,/usr/lib/ruby/gems/1.8/gems/ya2yaml-0.26/lib
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
let s:l = 31 - ((16 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
31
normal! 047l
tabedit options.c
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
set foldmethod=syntax
setlocal foldmethod=syntax
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
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
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
let s:l = 930 - ((22 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
930
normal! 04l
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
set foldmethod=syntax
setlocal foldmethod=manual
setlocal foldminlines=0
setlocal foldnestmax=20
setlocal foldtext=v:folddashes.getline(v:foldstart)
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
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
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
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
set foldmethod=syntax
setlocal foldmethod=syntax
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
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
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
46
normal zo
47
normal zo
53
normal zo
58
normal zo
47
normal zo
63
normal zo
75
normal zo
81
normal zo
91
normal zo
92
normal zo
101
normal zo
92
normal zo
107
normal zo
117
normal zo
120
normal zo
107
normal zo
91
normal zo
127
normal zo
132
normal zo
133
normal zo
136
normal zo
133
normal zo
141
normal zo
144
normal zo
146
normal zo
144
normal zo
132
normal zo
154
normal zo
162
normal zo
163
normal zo
166
normal zo
170
normal zo
182
normal zo
192
normal zo
200
normal zo
166
normal zo
163
normal zo
213
normal zo
218
normal zo
224
normal zo
228
normal zo
213
normal zo
162
normal zo
241
normal zo
242
normal zo
249
normal zo
241
normal zo
258
normal zo
259
normal zo
266
normal zo
258
normal zo
273
normal zo
288
normal zo
291
normal zo
304
normal zo
309
normal zo
288
normal zo
273
normal zo
328
normal zo
333
normal zo
328
normal zo
341
normal zo
350
normal zo
351
normal zo
356
normal zo
362
normal zo
370
normal zo
350
normal zo
382
normal zo
383
normal zo
382
normal zo
81
normal zo
63
normal zo
46
normal zo
90
normal zo
91
normal zo
100
normal zo
91
normal zo
106
normal zo
116
normal zo
119
normal zo
106
normal zo
90
normal zo
126
normal zo
131
normal zo
132
normal zo
135
normal zo
132
normal zo
140
normal zo
143
normal zo
145
normal zo
143
normal zo
131
normal zo
153
normal zo
161
normal zo
162
normal zo
165
normal zo
169
normal zo
181
normal zo
191
normal zo
199
normal zo
165
normal zo
162
normal zo
212
normal zo
218
normal zo
229
normal zo
236
normal zo
240
normal zo
218
normal zo
229
normal zo
236
normal zo
240
normal zo
212
normal zo
253
normal zo
254
normal zo
261
normal zo
253
normal zo
270
normal zo
271
normal zo
278
normal zo
270
normal zo
285
normal zo
300
normal zo
303
normal zo
316
normal zo
321
normal zo
300
normal zo
285
normal zo
340
normal zo
345
normal zo
340
normal zo
353
normal zo
362
normal zo
363
normal zo
368
normal zo
374
normal zo
382
normal zo
362
normal zo
394
normal zo
395
normal zo
394
normal zo
161
normal zo
253
normal zo
254
normal zo
261
normal zo
253
normal zo
270
normal zo
271
normal zo
278
normal zo
270
normal zo
285
normal zo
300
normal zo
303
normal zo
316
normal zo
321
normal zo
300
normal zo
285
normal zo
340
normal zo
345
normal zo
340
normal zo
353
normal zo
362
normal zo
363
normal zo
368
normal zo
374
normal zo
382
normal zo
362
normal zo
394
normal zo
395
normal zo
394
normal zo
let s:l = 231 - ((11 * winheight(0) + 16) / 33)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
231
normal! 037l
wincmd w
exe 'vert 1resize ' . ((&columns * 30 + 55) / 111)
exe 'vert 2resize ' . ((&columns * 80 + 55) / 111)
tabedit test/checksum_test.c
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
set foldmethod=syntax
setlocal foldmethod=syntax
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
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
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
3
normal zo
19
normal zo
21
normal zo
31
normal zo
21
normal zo
19
normal zo
41
normal zo
42
normal zo
44
normal zo
54
normal zo
57
normal zo
44
normal zo
41
normal zo
44
normal zo
44
normal zo
56
normal zo
60
normal zo
44
normal zo
44
normal zo
67
normal zo
72
normal zo
76
normal zo
81
normal zo
82
normal zo
85
normal zo
82
normal zo
90
normal zo
93
normal zo
95
normal zo
93
normal zo
81
normal zo
103
normal zo
111
normal zo
112
normal zo
114
normal zo
119
normal zo
125
normal zo
129
normal zo
114
normal zo
111
normal zo
114
normal zo
114
normal zo
119
normal zo
125
normal zo
129
normal zo
114
normal zo
114
normal zo
142
normal zo
143
normal zo
150
normal zo
142
normal zo
159
normal zo
160
normal zo
167
normal zo
159
normal zo
175
normal zo
193
normal zo
197
normal zo
202
normal zo
212
normal zo
216
normal zo
212
normal zo
175
normal zo
let s:l = 185 - ((11 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
185
normal! 026l
tabedit io.c
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
set foldmethod=syntax
setlocal foldmethod=syntax
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
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
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
let s:l = 453 - ((190 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
453
normal! 05l
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
set foldmethod=syntax
setlocal foldmethod=syntax
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
let s:l = 105 - ((26 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
105
normal! 041l
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
set foldmethod=syntax
setlocal foldmethod=syntax
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
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
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
let s:l = 1239 - ((148 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1239
normal! 04l
tabedit main.c
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
set foldmethod=syntax
setlocal foldmethod=syntax
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
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
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
let s:l = 153 - ((50 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
153
normal! 04l
tabedit byteorder.h
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
set foldmethod=syntax
setlocal foldmethod=syntax
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
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
let s:l = 44 - ((43 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
44
normal! 0
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . s:sx
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
