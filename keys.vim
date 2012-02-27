" Ctrl+u: fix aoutoindent insertion 
inoremap <silent> <C-u> <ESC>u:set paste<CR>.:set nopaste<CR>gi

"noremap! <Right> <Esc>

" Use * just to highlight the next found pattern - not jump
nnoremap * *N
vnoremap * y :execute ":let @/=@\""<CR> :execute "set hlsearch"<CR>

" Switch off highlight
nnoremap <S-F8> :nohlsearch<CR>

" Fix cursor
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

nnoremap ; :

" F11:    switch over lines numeration
" F2:     save current buffer
" F10:    close current buffer
" F4:     show list of buffers
" Ctrl+o: open new file
imap <silent> <F11> <Esc>:set<Space>nu!<CR>a
nmap <silent> <F11> :set<Space>nu!<CR>
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i
imap <C-Space> :<C-x> <C-o><cr>
map  <silent> <C-o>       :NERDTree<CR>
imap <silent> <C-o> <Esc>:NERDTree<CR>
imap <F10> <Esc>:bd<CR>a
nmap <F10> :bd<CR>
imap <F4> <Esc>:buffers<CR>
nmap <F4> :buffers<CR>

" Smart Home
nmap <Home> ^
imap <Home> <Esc>I

" Switch to directory of current file
command! CD cd %:p:h

" Switch to alternative source file
map <silent> <C-a> :A<cr>

"""""""""""""""""""""""""""" Tabs 
" Ctrl+l: next tab
" Ctrl+h: prev tab
" Ctrl+t: open new tab
map <C-h> :tabprevious<cr>
nmap <C-h> :tabprevious<cr>
imap <C-h> <ESC>:tabprevious<cr>i
map <C-l> :tabnext<cr>
nmap <C-l> :tabnext<cr>
imap <C-l> <ESC>:tabnext<cr>i
nmap <C-t> :tabnew<cr>:e .<cr>
imap <C-t> <ESC>:tabnew<cr>:e .<cr>

fu! TabMoveLeft()
  let current_tab = tabpagenr()
  if current_tab > 1
     let current_tab = current_tab - 2
     execute 'tabmove' current_tab
  endif
endf
fu! TabMoveRight()
  let current_tab = tabpagenr()
  execute 'tabmove' current_tab
endf

" Move tab left
nmap <silent>th :call TabMoveLeft()<CR>
vmap <silent>th <ESC>:call TabMoveLeft()<CR>

" Move tab right
nmap <silent>tl :call TabMoveRight()<CR>
vmap <silent>tl <ESC>:call TabMoveRight()<CR>

" F3: switch insert mode
" Ctrl+u: make inserted text better
set pastetoggle=<F3>
inoremap <silent> <C-u> <ESC>u:set paste<CR>.:set nopaste<CR>gi

" Ctrl+space: show autoindent window
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" F8: switch encoding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set wildmenu
set wcm=<Tab>
menu Encoding.CP1251   :e ++enc=cp1251<CR>
menu Encoding.CP866    :e ++enc=cp866<CR>
menu Encoding.KOI8-U   :e ++enc=koi8-u<CR>
menu Encoding.UTF-8    :e ++enc=utf-8<CR>
map <F8> :emenu Encoding.<TAB>

" Build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
imap <C-F12> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
vmap <C-F12> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>

" Change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Autoindentation with tab
function InsertTabWrapper()
     let col = col('.') - 1
     if !col || getline('.')[col - 1] !~ '\k'
         return "\<tab>"
     else
         return "\<c-p>"
     endif
endfunction
imap <tab> <c-r>=InsertTabWrapper()<cr>

" Wordsfor autoindentation
set complete=""
" From current buffer
set complete+=.
" From dictionary
set complete+=k
" From another buffers
set complete+=b
" From tags
set complete+=t

" Execute make and show the errors
if filereadable("Makefile")
    set makeprg=make\ -j4
    map <C-b> :make<CR>:cw<CR>
else
    map <C-b> :make %:r<CR>:cw<CR>
endif

" Buffer naviation
map <M-Left>  :bprevious<CR>
map <M-Right> :bnext<CR>

" Keys to opn tools-windows
nmap <silent> <F12>      :Tlist<CR> <esc>:NERDTreeToggle<CR>
vmap <silent> <F12> <esc>:Tlist<CR> <esc>:NERDTreeToggle<CR> 
imap <silent> <F12> <esc>:Tlist<CR> <esc>:NERDTreeToggle<CR> 