"==========================
" Gloable ENV
"==========================
if has("win32")
let $VIM_DIARY='E:\ZhaoYD_Rational_IBM\Diary'
else
let $VIM_DIARY='$HOME/.vim/Diaries'
endif

"==========================
" Vim UI Setting
"==========================
set number " line number
set textwidth=80 " text width
set linespace=-1 " space it out a little more (easier to read) 
set ruler " always show current position along the bottom 
set wildmenu " type :h and press <Tab> to look what happens 
set cmdheight=2 " use 2 screen lines for command-line 
set lazyredraw " do not redraw while executing macros (much faster) 
set backspace=2 " make backspace work normal
set tabstop=4 " 
set expandtab
"set nonumber " don't print line number
"set hid " allow to change buffer without saving
"set backspace=2 " make backspace work normal
"set whichwrap+=<,>,h,l " allow backspace and cursor keys to wrap
"set mouse=a " use mouse in all modes
"set shortmess=atI " shorten messages to avoid 'press a key' prompt
"set report=0 " tell us when anything is changed via :...
"set fillchars=vert:\ ,stl:\ ,stlnc:\ 

"==========================
" Visual cues Setting
"==========================
set showmatch " show matching paren 
set linebreak
set statusline=\ [File]\ %F%m%r%h\ %w\ \ [PWD]\ %r%{CurrectDir()}%h\ \ %=[Line]\ %l,%c\ %=\ %P

"==========================
" Folding
"==========================
set foldmethod=marker
set foldenable " turn on folding
"set foldmethod=indent " make folding indent sensitive
"set foldlevel=100 " don't autofold anything (but I can still fold manually)
"set foldopen -=search " don't open folds when you search into them
"set foldopen -=undo " don't open folds when you undo stuff 

set nocompatible
set history=400

set hlsearch
set noincsearch
set expandtab
set noerrorbells
set novisualbell
set t_vb= "close visual bell
set tabstop=4
set shiftwidth=4
set nobackup
set nowritebackup
"set noswapfile
set smarttab
set smartindent
set autoindent " Auto align
set cindent
set wrap
set autoread
set showtabline=2 
set clipboard+=unnamed " share clipboard with windows
set tabpagemax=20
set laststatus=2
"add by Ethan
"set helplang=en
syntax enable
syntax on

"==========================
" Utilities
"==========================
function! CurrectDir()
    let curdir = substitute(getcwd(), "", "", "g")
    return curdir
endfunction

if has("multi_byte")
    set encoding=utf-8
    set termencoding=utf-8
    set formatoptions+=mM
    set fencs=utf-8

    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif

    if has("win32")
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        "language messages zh_CN.utf-8
        language messages en_US.utf-8
    endif 
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

if has("gui_running")
    set guioptions=
    colorscheme desert
    set cursorline
    if has("win32")
        set gfn=Consolas
        au GUIEnter * simalt ~x
		set guifont=Consolas:h12:w6
		"set guifont=Lucida_Console:h10:CANSI
    else
        set guifont=Raize\ 13
"        set guifontwide=WenQuanYi\ Bitmap\ Song\ 12
    endif
else
    colorscheme desert
endif

if has("autocmd")
    filetype plugin indent on
    augroup vimrcEx
        au!
        autocmd FileType text setlocal textwidth=78
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal g`\"" |
                    \ endif
    augroup END
endif

"==========================
" key stock
"==========================
map tn :tabnext<cr>
map tp :tabprevious<cr>
map td :tabnew .<cr>
map te :tabedit
map tc :tabclose<cr>
map cs :!php -l %<cr>

map <C-s> :w<cr>
map <C-z> :u<cr>
map <F10> :VSTreeExplore<cr>
map <F11> :x<cr>
map <F12> :q!<cr>
" vim: set et sw=4 ts=4 sts=4 fdm=marker ff=unix fenc=utf8
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

"==========================
" a.vim Setting
"==========================
"alternate files quickly (.c --> .h etc) 
	
"==========================
" BufExplorer
"==========================
let g:bufExplorerDefaultHelp=0 " Do not show default help.
let g:bufExplorerDetailedHelp=0 " Do not show detailed help.
let g:bufExplorerShowRelativePath=0 " Show absolute paths.
let g:bufExplorerShowDirectories=1 " Show directories.
let g:bufExplorerSortBy='mru' " Sort by most recently used.
let g:bufExplorerSplitRight=0 " Split left.
let g:bufExplorerSplitVertical=1 " Split vertically.
let g:bufExplorerSplitVertSize = 30 " Split width
let g:bufExplorerUseCurrentWindow=1 " Open in new window.

"===========================
" winManager setting
"===========================
"let g:winManagerWindowLayout = 'BufExplorer,FileExplorer|TagList'
let g:winManagerWindowLayout = 'FileExplorer,TagsExplorer|BufExplorer|TagList' " What windows should it
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<CR>
nmap <C-W><C-B> :BottomExplorerWindow<CR>
"nmap <silent> <leader>wm :WMToggle<CR>
nnoremap wt :WMToggle<CR>

"==========================
"ctags setting
"==========================
source $HOME/.vim/plugin/taglist.vim
"set tags='D:\Temp\CQCode\bugbert_701\src\tags,D:\Temp\CQCode\dotnet\tags'
set tags='$HOME/.vim/tags'
let Tlist_Auto_Open = 1
"let Tlist_Exit_OnlyWindow=1
"let Tlist_Sort_Type = "name" " order by
"let Tlist_Compart_Format = 1 " show small meny
"let Tlist_File_Fold_Auto_Close = 1 " Do not close tags for other files
"let Tlist_Enable_Fold_Column = 0 " Do not show folding tree
"let Tlist_WinHeight = 40
"nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Show_One_File = 1            "??ͬʱ??ʾ?????ļ???tag??ֻ??ʾ??ǰ?ļ???
let Tlist_Exit_OnlyWindow = 1          "????taglist??????????һ?����ڣ????˳?vim
let Tlist_Use_Right_Window = 1         "???Ҳര??????ʾtaglist????

"=========================
"list the files in the current directory
"=========================
map <F3> :edit .<CR>

"==========================
"auto complete the words
"==========================
inoremap <F2> <C-x><C-o>

"===========================
" Mouse setting
"===========================
set mouse=a
set selectmode+=mouse
:behave mswin
source $VIMRUNTIME/mswin.vim

"===========================
" Scroll setting
"===========================
set guioptions=mlrb

"===========================
" Trinity setting
"===========================
" Open and close all the three plugins on the same time
"nmap <F8>   :TrinityToggleAll<CR>
" Open and close the srcexpl.vim separately
"nmap <F9>   :TrinityToggleSourceExplorer<CR>
" Open and close the taglist.vim separately
"nmap <F10>  :TrinityToggleTagList<CR>
" Open and close the NERD_tree.vim separately
"nmap <F11>  :TrinityToggleNERDTree<CR> 

"===========================
" Calendar setting
"===========================
let g:calendar_diary=$VIM_DIARY
map ca :Calendar<cr>

"===========================
" SuperTab setting
"===========================
" <Tab> has been mapped to SuperTab() func in that plugin 

"===========================
" ColorScheme Setting
"===========================
let psc_style='warm' 
":colorscheme  desert "color schema
