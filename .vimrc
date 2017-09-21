""""""""""""""""""""""""""""""""
"        yukai's vimrc
""""""""""""""""""""""""""""""""
" 使用非兼容模式
set nocompatible

" Remove ALL autocommands for the current group.
autocmd!

" session
set sessionoptions+=resize

" Do not redraw, when running macros.. lazyredraw
set lz

" Always hide the statusline
set laststatus=2
set cmdheight=2

" Set magic on
set magic

" viminfo
set viminfo+=%

" Leader setting
let g:mapleader=","

" 文字编码模式
set fencs=utf-8,euc-cn,latin1

" about search
set hlsearch
set incsearch
set ignorecase
set smartcase

" show cmd when input
set noshowcmd
set showmode

" histroy
set history=200

" autoload when other sofeware modify the file
set autoread

" allow buffers to be hidden when switch to another buffer
set hidden

" set backspace
set backspace=indent,eol,start
set whichwrap=b,s,>,<,[,]

" 语法高亮
syntax enable
syntax on
set wildmenu
set sm

" set colors and font
set t_Co=256
colorscheme desert
set background=dark
hi MatchParen ctermbg=none ctermfg=Blue
hi Comment ctermfg=Yellow
hi statusline cterm=reverse
hi StatusLine ctermfg=lightgray
hi Normal ctermfg=white
hi Statement ctermfg=LightBlue
hi Type ctermfg=LightBlue
hi Include ctermfg=Magenta
hi Define ctermfg=Magenta
hi Macro ctermfg=Magenta
hi PreCondit ctermfg=Magenta
hi Title term=NONE
hi Search ctermfg=black ctermbg=white

" No sound on errors.
set noerrorbells
set novisualbell
set vb t_vb=

" tab
set smarttab
set tabstop=4
set expandtab

" auto indent
set shiftwidth=4
set autoindent
set cindent
set nowrap

" show line number
set number
set showmatch

" set line
set textwidth=200
set linebreak
set fo+=mB
set iskeyword+=_,$,@,%,#,-  "Don't break the words with following character

" show cur pos
set ruler
set selection=inclusive

" 上下移动时留三行
set so=3

" 备份和缓存
set noswapfile

" file type
set fileformats=unix,dos,mac

" backup
set nobackup
set nowritebackup

" auto complete
set completeopt=longest,menu

" indent set autoindent
set cino=:0g0t0(susj1


"""""""""""""""""""""""""""""""""""""""""
"            for convenient
"""""""""""""""""""""""""""""""""""""""""
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nnoremap <silent>0 o{<esc>o}<esc>ko
inoremap <silent>0 <esc>o{<esc>o}<esc>ko

nnoremap 8 :cp<cr>
nnoremap 9 :cn<cr>

command! -nargs=0 RM exe 'silent make clean | make'
command! -nargs=0 SOurcevimrc exe 'silent so ~/.vimrc'

command! -nargs=1 Grep exe "silent grep! <args>" | bo cw 10 | redr!

""""""""""""""""""""""""""""""
" Vundle
""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Script list
Plugin 'VundleVim/Vundle.vim'
Plugin 'CharTab'
Plugin 'genutils'
Plugin 'majutsushi/tagbar'
Plugin 'vimwiki/vimwiki'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'csliu/a.vim'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'SirVer/ultisnips'
Plugin 'xiaoshuan/syntax.vim'
Plugin 'xiaoshuan/showmarks.vim'
call vundle#end()

" 启动文件类型插件
filetype plugin indent on

""""""""""""""""""""""""""""""
" vimwiki
""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/Documents/vimwiki/',
    \ 'path_html': '~/Documents/vimwiki/html/',
    \ 'template_path': '~/Documents/vimwiki/template/',
    \ 'template_default': 'template',
    \ 'template_ext': '.html'}]


""""""""""""""""""""""""""""""
" ycm
""""""""""""""""""""""""""""""
let g:ycm_show_diagnostics_ui = 0
let g:ycm_auto_start_csharp_server = 0
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_open_loclist_on_ycm_diags = 1
let g:ycm_key_list_select_completion = ['<c-n>']
let g:ycm_key_list_previous_completion = ['<c-p>']
let g:ycm_key_invoke_completion = '<c-x><c-m>'
let g:ycm_use_ultisnips_completer = 0
let g:ycm_global_ycm_extra_conf = '~/Libraries/utilities/ycm/.ycm_extra_conf.py'
let g:ycm_filetype_blacklist = {
      \ 'tex' : 1,
      \ 'text' : 1,
      \ 'html' : 1,
      \ 'xhtml' : 1
      \ }
nnoremap <c-c><c-l> :YcmDiags<CR>
nnoremap <leader>jd :YcmCompleter GoTo<CR>

""""""""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""""""""
let g:ctrlp_map = '<leader>cp'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:10'
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")':   ['<c-n>', '<down>'],
  \ 'PrtSelectMove("k")':   ['<c-p>', '<up>'],
  \ 'PrtHistory(-1)':       [''],
  \ 'PrtHistory(1)':        [''],
  \ }
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(a|so|o|d)$',
  \ }

""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
let g:airline#extensions#tagbar#enabled = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''

""""""""""""""""""""""""""""""
" yank stack
""""""""""""""""""""""""""""""
nmap p     <Plug>yankstack_substitute_older_paste
nmap <s-p> <Plug>yankstack_substitute_newer_paste

""""""""""""""""""""""""""""""
" Tabular
""""""""""""""""""""""""""""""
let g:no_default_tabular_maps = 0
command! -nargs=0 -range Tc exe '<line1>,<line2>Tab /\/\*'
command! -nargs=0 -range TC exe '<line1>,<line2>Tab /\/\/'
command! -nargs=0 -range TD exe '<line1>,<line2>Tab /='

"""""""""""""""""""""""""""""""""""""""""
" NERDCommenter
"""""""""""""""""""""""""""""""""""""""""
nmap <leader>ca <plug>NERDCommenterAppend
nmap <leader>cA <plug>NERDCommenterAltDelims
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"""""""""""""""""""""""""""""""""""""""""
" ctags
"""""""""""""""""""""""""""""""""""""""""
map <silent><F12> :!ctags -R --c++-kinds=+p --fields=+iaSl --extra=+q<cr>

" add ./tags
if filereadable('tags')
    execute 'set tags=' . getcwd() . '/tags'
endif

""""""""""""""""""""""""""""""
" Tagbar
""""""""""""""""""""""""""""""
let g:tagbar_sort = 0
let g:tagbar_width = 30
let g:tagbar_zoomwidth = 0
let g:tagbar_autofocus = 1
let g:tagbar_left = 1

inoremap <silent><c-w><c-t> <esc>:TagbarToggle<cr>
nnoremap <silent><c-w><c-t> :TagbarToggle<cr>
inoremap <silent><c-w><c-a> <esc>:TagbarOpen<cr>:NERDTree<cr>
nnoremap <silent><c-w><c-a> :TagbarOpen<cr>:NERDTree<cr>

""""""""""""""""""""""""""""""
" NERD Tree
""""""""""""""""""""""""""""""
let NERDTreeIgnore = ['\.[oda]$', 'cscope', 'tags', '\.so$', '\.pdf$']
let NERDTreeShowBookmarks = 1
let NERDTreeWinPos = "right"
let NERDTreeHighlightCursorline = 0
let NERDTreeDirArrows = 1
noremap  <silent><c-w><c-n> :NERDTreeToggle<cr>
inoremap <silent><c-w><c-n> <esc>:NERDTreeToggle<cr>

""""""""""""""""""""""""""""""
" netrw setting
""""""""""""""""""""""""""""""
let g:netrw_list_hide = '\.[oda]$,^cscope,tags$,\.so$,\.pdf$'

""""""""""""""""""""""""""""""
" showmarks setting
""""""""""""""""""""""""""""""
" Enable ShowMarks
let showmarks_enable = 1

" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"

" Color setting
hi ShowMarksHLl ctermbg=Green   ctermfg=Black
hi ShowMarksHLu ctermbg=Magenta ctermfg=Black

""""""""""""""""""""""""""""""
" ultisnips
""""""""""""""""""""""""""""""
command! -nargs=0 UE exe 'UltiSnipsEdit'
set runtimepath+=~/Libraries/Ultisnips
let g:UltiSnipsSnippetsDir = "~/Libraries/Ultisnips/ysnips"
let g:UltiSnipsSnippetDirectories = ["ysnips"]
let g:UltiSnipsEditSplit = "context"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

""""""""""""""""""""""""""""""
" large file
""""""""""""""""""""""""""""""
let g:LargFile=2

""""""""""""""""""""""""""""""
" cscope
""""""""""""""""""""""""""""""
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=1
    set cst
    set nocsverb
    " add ./cscope.out
    if filereadable("./cscope.out")
        exe "cscope add ./cscope.out " . getcwd()
    endif

    set csverb
endif

command! -nargs=0 CA exe 'cscope add cscope.out ' . getcwd()
nnoremap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nnoremap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

""""""""""""""""""""""""""""""
" NERD Comment
""""""""""""""""""""""""""""""
let NERDCommentWholeLinesInVMode = 1
let NERDSpaceDelims = 1

""""""""""""""""""""""""""""""
" unmap
""""""""""""""""""""""""""""""
function! UnmapMappings()
    " You know what? If you don't have any map in insert mode
    " which is begin with <leader>, when you type <leader> in
    " insert mode, the delay will go away!!!!
    if hasmapto("IHN")
        iunmap <leader>is
        iunmap <leader>ih
        iunmap <leader>ihn
        nunmap <leader>is
        nunmap <leader>ih
        nunmap <leader>ihn
    endif

endfunction

function! SourceWorkConfig()
    " Add work config for current directory
    " normally source .workconfig
    if filereadable("./.workconfig")
        exe 'source ' . getcwd() . '/.workconfig'
    endif
endfunction

au VimEnter * call UnmapMappings()
au VimEnter * call SourceWorkConfig()
