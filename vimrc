"
""""""""""""""""""""""""""""""""""""""""" Generic VIM settings
set ts=2
set tm=500
set t_vb=
set autoindent
set autoread
set lbr
set showcmd
set nocompatible
set backspace=indent,eol,start
set history=100
set showtabline=2
set ruler                " show cursor
set nohidden
set nowrap
set number
set shiftwidth=2         " number of spaces to use for autoindenting
set softtabstop=2
set shiftround           " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch            " set show matching parenthesis
set ignorecase           " ignore case when searching
set smartcase            " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab             " insert tabs on the start of a line according to shiftwidth, not tabstop
set expandtab            " spaces instead tabs
set title                " change the terminal's title
set titlestring=VIM:\ %-25.55F\ %a%r%m titlelen=70
set visualbell           " don't beep
set noerrorbells         " don't beep
set showcmd              " show incomplete cmds down the bottom
set showmode             " show current mode down the bottom
set incsearch            " find the next match as we type the search
set hlsearch             " hilight searches by default
set ttyfast              " more characters will be sent to the screen for redrawing
set scrolloff=3          " keep this number of lines below and above cursor
set clipboard=unnamed    " all operations work with the OS clipboard
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:. " highlight problematic whitespace
set viminfo='20,<50,s10,h,%                   " remember some stuff after quiting vim: marks, registers, searches, buffer list
set sessionoptions=tabpages,sesdir,folds,options,globals,help,localoptions,resize,winsize,winpos
set wildignore=*.swp,*.bak,*.pyc,*.class,.git,.DS_Store
set cindent
set modeline
set lazyredraw
set magic
set cul
if exists("+undofile")
  set undolevels=256
  set undoreload=10000
  set undodir=~/.vim/spool
  set undofile
endif
set autochdir
"set mouse=a   " NOTE: disabled, otherwise it is imposible to copy text using mouse

syntax on

autocmd FileType make set noexpandtab

let g:tex_flavor = "latex"

augroup filetypedetect
  " Ignore filetypes for *.module files
  autocmd! BufNewFile,BufRead *.module  setfiletype ignored
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Vundle
filetype on                    " required on MacOSX only
filetype plugin off            " required by Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vcscommand.vim'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'Shougo/neocomplcache'
Bundle 'OmniCppComplete'
Bundle 'majutsushi/tagbar'
Bundle 'a.vim'
Bundle 'SearchComplete'
Bundle 'nathanaelkane/vim-indent-guides.git'
Bundle 'jimenezrick/vimerl'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-repeat'
Bundle 'marcinbiegun/vim-escript'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'kshenoy/vim-signature'
Bundle 'hdima/python-syntax'
Bundle 'mhinz/vim-signify'
Bundle 'mhinz/vim-startify'
Bundle 'chrisbra/Recover.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'skywind3000/vim-quickui'
Bundle 'ryanoasis/vim-devicons'
Bundle 'psliwka/vim-smoothie'
Bundle 'airblade/vim-rooter'
Bundle 'bkad/CamelCaseMotion'
Bundle 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Bundle 'junegunn/fzf.vim'
Bundle 'ryvnf/readline.vim'
Bundle 'nkantar/SPI.vim'
Bundle 'pechorin/any-jump.vim'
Bundle 'junegunn/vim-peekaboo'
Bundle 'markonm/traces.vim'
Bundle 'ludovicchabant/vim-gutentags'

filetype plugin indent on      " required by Vundle


""""""""""""""""""""""""""""""""""""""""""""""" EasyMotion
let g:camelcasemotion_key = ','

""""""""""""""""""""""""""""""""""""""""""""""" Peehaboo
let g:peekaboo_compact = 1

""""""""""""""""""""""""""""""""""""""""""""""" rooter
set noautochdir " Don't change dirs automatically, using rooter for that
let g:rooter_silent_chdir = 1

""""""""""""""""""""""""""""""""""""""""""""""" vim-devicons
set encoding=UTF-8
set guifont=DroidSansMono\ Nerd\ Font\ 11

""""""""""""""""""""""""""""""""""""""""""""""" spell
setlocal spell spelllang=en
set spell!

""""""""""""""""""""""""""""""""""""""""""""""" QuickUI

" clear all the menus
call quickui#menu#reset()

" install a 'File' menu, use [text, command] to represent an item.
call quickui#menu#install('&File', [
            \ [ "&Open file tree     Ctrl+t ", 'NERDTreeToggle', 'toggle nerdtree' ],
            \ [ "&Close current", 'close' ],
            \ [ "--", '' ],
            \ [ "&Save current", ':w'],
            \ [ "Save &as", 'call feedkeys(":saveas ")' ],
            \ [ "Save all", 'Wall' ],
            \ [ "Save with Sudo", 'SudoWrite' ],
            \ [ "--", '' ],
            \ [ "Chmod", 'call feedkeys(":Chmod ")' ],
            \ [ "Rename", 'call feedkeys(":Rename ")' ],
            \ [ "--", '' ],
            \ [ "E&xit\tAlt+x", 'q' ],
            \ ])

call quickui#menu#install("&Search", [
            \ ["&Jump to    <leader>+j",  'AnyJump'],
            \ ["&Previous   <leader>+ab", 'AnyJumpBack'],
            \ ["&Last       <leader>+al", 'AnyJumpLastResults'],
            \ ])

" script inside %{...} will be evaluated and expanded in the string
call quickui#menu#install("&Option", [
            \ ['Check Syntax', 'SyntasticCheck'],
            \ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!', 'Toggle spell check %{&spell? "off" : "on"}'],
            \ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!', 'Toggle cursor line %{&cursorline? "off" : "on"}'],
            \ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!', 'Toggle paste mode %{&paste? "off" : "on"}'],
            \ ['Rebuild Project Tags', 'GutentagsUpdate'],
            \ ])

call quickui#menu#install("&Plugin", [
            \ ['&List', 'BundleList'],
            \ ['&Search', 'BundleSearch'],
            \ ['&Update', 'BundleUpdate'],
            \ ['&Install', 'BundleInstall'],
            \ ['&Clean', 'BundleClean'],
            \ ])

call quickui#menu#install("&Python", [
            \ ['Sort headers', 'SPI'],
            \ ])


" register HELP menu with weight 1000
call quickui#menu#install('H&elp', [
            \ ["&Cheatsheet", 'help index', ''],
            \ ['T&ips', 'help tips', ''],
            \ ['--',''],
            \ ["&Tutorial", 'help tutor', ''],
            \ ['&Quick Reference', 'help quickref', ''],
            \ ['&Summary', 'help summary', ''],
            \ ['--',''],
            \ ['&Vim Script', 'help eval', ''],
            \ ['&Function List', 'help function-list', ''],
            \ ], 10000)

let g:quickui_show_tip = 1
let g:quickui_border_style = 2
let g:quickui_color_scheme = 'papercol dark'


""""""""""""""""""""""""""""""""""""""""""""""" AnyJump
" Show line numbers in search rusults
let g:any_jump_list_numbers = 0

" Auto search references
let g:any_jump_references_enabled = 1

" Auto group results by filename
let g:any_jump_grouping_enabled = 0

" Amount of preview lines for each search result
let g:any_jump_preview_lines_count = 5

" Max search results, other results can be opened via [a]
let g:any_jump_max_search_results = 7

" Prefered search engine: rg or ag
let g:any_jump_search_prefered_engine = 'rg'

" Search results list styles:
" - 'filename_first'
" - 'filename_last'
let g:any_jump_results_ui_style = 'filename_first'

" Any-jump window size & position options
let g:any_jump_window_width_ratio  = 0.6
let g:any_jump_window_height_ratio = 0.6
let g:any_jump_window_top_offset   = 4

" Disable default any-jump keybindings (default: 0)
let g:any_jump_disable_default_keybindings = 1

" Remove comments line from search results (default: 1)
let g:any_jump_remove_comments_from_results = 1

let g:any_jump_disable_default_keybindings = 1

""""""""""""""""""""""""""""""""""""""""""""""" vimerl
set runtimepath+=$HOME/.vim/bundle/Vimerl
let g:erlang_skel_header = {"author": "Taras Shapovalov"}
let g:erlang_keywordprg = "erl -man"

""""""""""""""""""""""""""""""""""""""""""""""" Erlang file type
autocmd FileType erlang set shiftwidth=2
autocmd FileType erlang set ts=2
autocmd FileType erlang set softtabstop=2
autocmd FileType erlang set colorcolumn=100
autocmd Filetype erlang set omnifunc=erlang_complete#Complete
autocmd FileType erlang hi ColorColumn cterm=none ctermbg=7
autocmd Filetype erlang execute "set colorcolumn=" . join(range(101,355), ',')

""""""""""""""""""""""""""""""""""""""""""""""" Startify
let g:startify_enable_special = 0
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_show_sessions = 1
let g:startify_show_files = 0
let g:startify_show_files_number = 0
let g:startify_bookmarks = []
let g:startify_skiplist = [
                        \ 'COMMIT_EDITMSG',
                        \ $VIMRUNTIME .'/doc',
                        \ 'bundle/.*/doc'
                        \ ]
let g:startify_skiplist_server = [ 'GVIM' ]
let g:startify_custom_indices = ['1','2','3','4','5','6','7','8','9']
let g:startify_enable_special = 0

function! SaveSessionWithName()
  let sname = "default"
  if strlen(v:this_session)
    let sname = fnamemodify(substitute(v:this_session, ".vim$", "x.vim", ""), ":t")
  endif
  call startify#session_save(sname)
endfunction

"autocmd VimLeavePre * call SaveSessionWithName()

""""""""""""""""""""""""""""""""""""""""""""""" Signify
let g:signify_mapping_next_hunk = '<leader>gj'
let g:signify_mapping_prev_hunk = '<leader>gk'
let g:signify_mapping_toggle = '<leader>gt'
let g:signify_mapping_toggle_highlight = '<leader>gh'
let g:signify_skip_filetype = { 'vim': 1, 'c': 1 }
let g:signify_skip_filename = { '/home/taras/.vimrc': 1 }
let g:signify_vcs_list = ['git']
let g:signify_difftool = 'diff'
let g:signify_sign_overwrite = 1
let g:signify_update_on_bufenter = 1
let g:signify_line_highlight = 0
let g:signify_sign_weight = 'bold'

let g:signify_sign_add               = ''
let g:signify_sign_delete            = '-'
let g:signify_sign_change            = '%'
let g:signify_sign_change_delete     = '-'
let g:signify_sign_delete_first_line = '-'

let g:signify_sign_color_ctermfg_add    = 2
let g:signify_sign_color_ctermfg_delete = 1
let g:signify_sign_color_ctermfg_change = 3
let g:signify_sign_color_ctermbg        = 0

let g:signify_sign_color_group_add    = 'MyAdd'
let g:signify_sign_color_group_delete = 'MyDelete'
let g:signify_sign_color_group_change = 'MyChange'

let g:signify_line_color_add    = 'DiffAdd'
let g:signify_line_color_delete = 'DiffDelete'
let g:signify_line_color_change = 'DiffChange'
let g:signify_line_color_change_delete = 'DiffChange'

let g:signify_cursorhold_normal = 1
let g:signify_cursorhold_insert = 1

""""""""""""""""""""""""""""""""""""""""""""""" Syntastic
let g:syntastic_auto_jump = 0
let g:syntastic_enable_highlighting = 1
let g:syntastic_enable_signs = 1
let g:syntastic_echo_current_error = 0
let g:syntastic_check_on_open = 0
let g:syntastic_enable_balloons = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_cpp_no_include_search = 0
let g:syntastic_c_no_include_search = 0
let g:syntastic_cpp_check_header = 1
let g:syntastic_c_check_header = 1
let g:syntastic_cpp_remove_include_errors = 0
let g:syntastic_c_remove_include_errors = 0
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_c_auto_refresh_includes = 1
"let g:syntastic_stl_format = '%E{ line: %fe | col: %e }'
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['py'],
                           \ 'passive_filetypes': ['cpp', 'c'] }
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_cpp_config_file = '/home/taras/.syntastic_cpp_config'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""" Statusline
let g:gitinfo = ''
function! GitInfo()
  let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
  if branch != ''
    let g:gitinfo = ' ' . substitute(branch, '\n', '', 'g')
  endif
endfun
au BufRead * call GitInfo()

function! FileSize()
 let bytes = getfsize(expand("%:p"))
 if bytes <= 0
   return ""
 endif
 if bytes < 1024
   return bytes . " B"
 else
   return (bytes / 1024) . " K"
 endif
endfunction

set statusline= " clear the statusline for when vimrc is reloaded
set statusline+=\ \ %<%F\ 

set statusline+=%#VisualDelimeterWhite#
set statusline+=%*
"set statusline+=%{getfsize(expand('%:p'))>0?'┃\ ':''}
"set statusline+=%{FileSize()}
"set statusline+=%#VisualDelimeterWhite#\ ┃%*

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'\['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%1*
set statusline+=%h      "help file flag
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag
set statusline+=%w

set statusline+=%#warningmsg#
set statusline+=%*

set statusline+=\ %#error#
set statusline+=%{&paste?'paste':''}
set statusline+=%*

set statusline+=\ %#error#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*


set statusline+=%=                  "left/right separator ⤦

"set statusline+=%#VisualDelimeterWhite#\ ┃%*\ 
set statusline+=%{g:gitinfo}

set statusline+=%#VisualDelimeterWhite#\ ┃%*

set statusline+=\ line:\ %l/%L   "cursor line/total lines

set statusline+=%#VisualDelimeterWhite#\ ┃%*

set statusline+=\ col:\ %c       "cursor column

set statusline+=%#VisualDelimeterWhite#\ ┃%*

set statusline+=\ %P\             "percent through file

set statusline+=%#VisualDelimeterBlock#┃%*

set laststatus=2

" Recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"""""""""""""""""""""""""""""""""""""""""""""""""""""""" tags, swp and backup
set tags=./.tags
set tags+=.~/.vim/tags/

set directory=~/.vim/spool/
set directory+=.

set backupdir=~/.vim/spool/
set backup

""""""""""""""""""""""""""""""""""""""""""""""""""""""" OmniCppComplete
set nocp
"filetype plugin on
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1      " autocomplete after .
let OmniCpp_MayCompleteArrow = 1    " autocomplete after ->
let OmniCpp_MayCompleteScope = 1    " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main

"""""""""""""""""""""""""""""""""""""""""""""""NeoComplCache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

""""""""""""""""""""""""""""""""""""""""" Cursor
function SetVisibleCursorLine()
  hi CursorLine cterm=none ctermbg=7
endfunction

function SetInvisibleCursorLine()
  hi CursorLine cterm=none ctermbg=15
endfunction

" Change a cursor shape (Gnome terminal only):
if has("autocmd")
  au BufEnter __Tagbar__ silent call SetVisibleCursorLine()
  au BufLeave __Tagbar__ silent call SetInvisibleCursorLine()
  au BufEnter NERD_tree* silent call SetVisibleCursorLine()
  au BufLeave NERD_tree* silent call SetInvisibleCursorLine()
  au WinLeave * setlocal nocursorline
  au WinEnter * setlocal cursorline
endif

""""""""""""""""""""""""""""""""""""""""" Tabs
function MyTabLine()
  let tabline = '%#TabLine#'
  let tabline .= repeat(' ', &numberwidth)
  for i in range(tabpagenr('$'))
    let buflist = tabpagebuflist(i + 1)
    if i + 1 == tabpagenr()
      let tabline .= '%#TabLineSel#'
      for b in range(len(buflist))
        if getbufvar(buflist[b], "&modified")
          let tabline .= '%#TabLineModifiedSel#'
          break
        endif
      endfor
    else
      let tabline .= '%#TabLine#'
      for b in range(len(buflist))
        if getbufvar(buflist[b], "&modified")
          let tabline .= '%#TabLineModified#'
          break
        endif
      endfor
    endif
    let tabline .= '%' . (i + 1) . 'T'
    if i + 1 == tabpagenr()
      let tabline .= ' %{MyTabLabel(' . (i + 1) . ')} '
      let tabline .= '%#TabLineSel#'
    else
      let tabline .= ' %{MyTabLabel(' . (i + 1) . ')} ' . '%{MyTabNum(' . (i + 1) . ')}'
      let tabline .= '%#TabLine#'
    endif
    if i + 1 != tabpagenr() && i+2 != tabpagenr()
      let tabline .= '%#VisualDelimeter#'
      let tabline .= '│'
    endif
  endfor
  let tabline .= '%#TabLineFill#%T'
  return tabline
endfunction

function MyTabNum(n)
  if a:n == 0
    return '₀'
  elseif a:n == 1
    return '₁'
  elseif a:n == 2
    return '₂'
  elseif a:n == 3
    return '₃'
  elseif a:n == 4
    return '₄'
  elseif a:n == 5
    return '₅'
  elseif a:n == 6
    return '₆'
  elseif a:n == 7
    return '₇'
  elseif a:n == 8
    return '₈'
  elseif a:n == 9
    return '₉'
  elseif a:n == 10
    return '₁₀'
  elseif a:n == 11
    return '₁₁'
  elseif a:n == 12
    return '₁₂'
  elseif a:n == 13
    return '₁₃'
  elseif a:n == 14
    return '₁₄'
  elseif a:n == 15
    return '₁₅'
  elseif a:n == 16
    return '₁₆'
  elseif a:n == 17
    return '₁₇'
  elseif a:n == 18
    return '₁₈'
  elseif a:n == 19
    return '₁₉'
  elseif a:n == 20
    return '₂₀'
  elseif a:n == 21
    return '₂₁'
  elseif a:n == 22
    return '₂₂'
  elseif a:n == 23
    return '₂₃'
  elseif a:n == 24
    return '₂₄'
  elseif a:n == 25
    return '₂₅'
  elseif a:n == 26
    return '₂₆'
  elseif a:n == 27
    return '₂₇'
  elseif a:n == 28
    return '₂₈'
  elseif a:n == 29
    return '₂₉'
  elseif a:n == 30
    return '₃₀'
  elseif a:n == 31
    return '₃₁'
  elseif a:n == 32
    return '₃₂'
  else
    return ''
endfunction

function MyTabLabel(n)
  let label = ''
  let buflist = tabpagebuflist(a:n)
  let label = substitute(bufname(buflist[tabpagewinnr(a:n) - 1]), '.*/', '', '')
  if label == ''
    let label = '[No Name]'
  endif
  return label
endfunction

function MyGuiTabLabel()
  return '%{MyTabLabel(' . tabpagenr() . ')}'
endfunction

set tabline=%!MyTabLine()
set guitablabel=%!MyGuiTabLabel()

""""""""""""""""""""""""""""""""""""""""" EasyMotion
let g:EasyMotion_leader_key = ','

""""""""""""""""""""""""""""""""""""""""" NERD tree
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeChDirMode=1
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeShowHidden=1
let g:NERDTreeKeepTreeInNewTab=1

"""""""""""""""""""""""""""""""""""""""" TagBar
let g:tagbar_width = 60
let g:tagbar_compact = 1
let g:tagbar_iconchars = ['➱', '➢']

if has("autocmd")
  "au FileType c,cpp nested :TagbarOpen

  au FileType qf
    \ if &buftype == "quickfix" |
    \     setlocal statusline=%2*%-3.3n%0* |
    \     setlocal statusline+=\ \[Compiler\ Messages\] |
    \     setlocal statusline+=%=%2*\ %<%P |
    \ endif

  fun! <SID>FixMiniBufExplorerTitle()
    if "-MiniBufExplorer-" == bufname("%")
      setlocal statusline=%2*%-3.3n\ %0*\[MiniBufExplorer\]
    elseif "__Tagbar__" == bufname("%")
      setlocal statusline=%0*
      setlocal statusline+=Tagbar
      setlocal statusline+=%=\ %<%P
      setlocal cursorline
    endif
  endfun

  au BufWinEnter *
    \ let oldwinnr=winnr() |
    \ windo call <SID>FixMiniBufExplorerTitle() |
    \ exec oldwinnr . " wincmd w" 

endif

""""""""""""""""""""""""""""""""""""""""" Colors
set t_Co=256
colo taras256

" Color test: Save this file, then enter ':so %'
" Then enter one of following commands:
"   :VimColorTest    "(for console/terminal Vim)
"   :GvimColorTest   "(for GUI gvim)
function! VimColorTest(outfile, fgend, bgend)
  let result = []
  for fg in range(a:fgend)
    for bg in range(a:bgend)
      let kw = printf('%-7s', printf('c_%d_%d', fg, bg))
      let h = printf('hi %s ctermfg=%d ctermbg=%d', kw, fg, bg)
      let s = printf('syn keyword %s %s', kw, kw)
      call add(result, printf('%-32s | %s', h, s))
    endfor
  endfor
  call writefile(result, a:outfile)
  execute 'edit '.a:outfile
  source %
endfunction
command! VimColorTest call VimColorTest('vim-color-test.tmp', 12, 16)

function! GvimColorTest(outfile)
  let result = []
  for red in range(0, 255, 16)
    for green in range(0, 255, 16)
      for blue in range(0, 255, 16)
        let kw = printf('%-13s', printf('c_%d_%d_%d', red, green, blue))
        let fg = printf('#%02x%02x%02x', red, green, blue)
        let bg = '#fafafa'
        let h = printf('hi %s guifg=%s guibg=%s', kw, fg, bg)
        let s = printf('syn keyword %s %s', kw, kw)
        call add(result, printf('%s | %s', h, s))
      endfor
    endfor
  endfor
  call writefile(result, a:outfile)
  execute 'edit '.a:outfile
  source %
endfunction
command! GvimColorTest call GvimColorTest('gvim-color-test.tmp')

""""""""""""""""""""""""""""""""""""""""" Include keys map
source ~/.vim/keys.vim

" Use local vimrc if available 
if filereadable(expand("./.vim/vimrc-custom"))
  source ./.vim/vimrc-custom
endif

