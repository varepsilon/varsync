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
nnoremap Q @q
vmap Q gq
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
badd +30 ./benchmark/compare_sizes.rb
badd +54 ./benchmark/run.rb
badd +0 checksum.c
badd +0 rsync.h
badd +1210 io.c
badd +0 match.c
badd +0 generator.c
badd +942 acls.c
badd +0 byteorder.h
badd +77 sender.c
badd +1 TODO
badd +3 TODO.varsync
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
let s:l = 40 - ((20 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
40
normal! 056l
tabedit ./benchmark/compare_sizes.rb
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
setlocal foldmethod=syntax
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
let s:l = 18 - ((1 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
18
normal! 048l
tabedit checksum.c
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
1
normal zo
39
normal zo
46
normal zo
47
normal zo
53
normal zo
56
normal zo
61
normal zo
47
normal zo
66
normal zo
72
normal zo
66
normal zo
46
normal zo
82
normal zo
83
normal zo
92
normal zo
83
normal zo
98
normal zo
109
normal zo
98
normal zo
82
normal zo
116
normal zo
121
normal zo
122
normal zo
125
normal zo
122
normal zo
130
normal zo
133
normal zo
135
normal zo
133
normal zo
121
normal zo
143
normal zo
151
normal zo
152
normal zo
155
normal zo
159
normal zo
171
normal zo
181
normal zo
189
normal zo
155
normal zo
152
normal zo
202
normal zo
207
normal zo
213
normal zo
202
normal zo
151
normal zo
227
normal zo
228
normal zo
235
normal zo
227
normal zo
244
normal zo
245
normal zo
252
normal zo
244
normal zo
259
normal zo
274
normal zo
277
normal zo
290
normal zo
295
normal zo
274
normal zo
259
normal zo
314
normal zo
319
normal zo
314
normal zo
327
normal zo
336
normal zo
337
normal zo
342
normal zo
348
normal zo
356
normal zo
336
normal zo
368
normal zo
369
normal zo
368
normal zo
let s:l = 187 - ((2 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
187
normal! 064l
tabedit match.c
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
143
normal zo
177
normal zo
198
normal zo
219
normal zo
224
normal zo
230
normal zo
231
normal zo
230
normal zo
198
normal zo
177
normal zo
143
normal zo
let s:l = 225 - ((18 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
225
normal! 0
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
1178
normal zo
1192
normal zo
1194
normal zo
1192
normal zo
1201
normal zo
1203
normal zo
1201
normal zo
1211
normal zo
1212
normal zo
1222
normal zo
1224
normal zo
1222
normal zo
1211
normal zc
1243
normal zo
1244
normal zo
1259
normal zo
1261
normal zo
1268
normal zo
1259
normal zo
1243
normal zc
1342
normal zo
1351
normal zo
1342
normal zo
1626
normal zo
let s:l = 1343 - ((31 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1343
normal! 07l
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
let s:l = 130 - ((31 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
130
normal! 08l
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
743
normal zo
761
normal zo
771
normal zo
778
normal zo
780
normal zo
778
normal zo
771
normal zo
789
normal zo
817
normal zo
761
normal zo
827
normal zo
833
normal zo
857
normal zo
883
normal zo
857
normal zo
833
normal zo
2095
normal zo
2101
normal zo
2113
normal zo
2101
normal zo
2095
normal zo
let s:l = 767 - ((14 * winheight(0) + 17) / 34)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
767
normal! 037l
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
1
normal zc
23
normal zo
44
normal zo
46
normal zo
let s:l = 44 - ((22 * winheight(0) + 17) / 34)
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
