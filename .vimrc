
"-----------------------------------------------------------------------------
" Vundle
"-----------------------------------------------------------------------------
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

"------------------------------------------------------------------------------
" My bundles
"------------------------------------------------------------------------------
Bundle 'Lokaltog/vim-easymotion'

Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'kana/vim-textobj-user'

Bundle 'scrooloose/nerdtree'
Bundle 'tomtom/tcomment_vim'

Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-repeat'
" Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'

Bundle 'tomasr/molokai'

Bundle 'Valloric/YouCompleteMe'

Bundle 'kien/ctrlp.vim'
Bundle 'kien/rainbow_parentheses.vim'

Bundle 'rking/ag.vim'

Bundle 'Yggdroot/indentLine'

Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'leshill/vim-json'
Bundle 'itspriddle/vim-jquery'
Bundle 'vim-ruby/vim-ruby'

Bundle 'sjl/gundo.vim'

Bundle 'tpope/vim-unimpaired'
Bundle 'wojtekmach/vim-rename'

Bundle 'vim-scripts/ZoomWin'

Bundle 'skalnik/vim-vroom'

Bundle 'maksimr/vim-jsbeautify'

Bundle 'terryma/vim-multiple-cursors'

Bundle 'majutsushi/tagbar'

Bundle 'Raimondi/delimitMate'

Bundle 'hail2u/vim-css3-syntax'

Bundle 'michalliu/jsruntime.vim'
Bundle 'michalliu/jsoncodecs.vim'
Bundle 'michalliu/sourcebeautify.vim'

" Bundle 'marijnh/tern_for_vim'

syntax on
filetype plugin indent on

"-----------------------------------------------------------------------------
" General
"-----------------------------------------------------------------------------
" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


set cf                                " enable error files and error jumping
filetype plugin indent on
set isk+=_,$,@,%,#,-
set modeline
set tabpagemax=50                     " open 50 tabs max
set splitbelow
set splitright
set undodir=~/.vim/.tmp,~/tmp,~/.tmp,/tmp
set undofile
set undolevels=1000
set nofoldenable    " disable folding
set antialias
set guifont=Monaco:h12

 "-----------------------------------------------------------------------------
" Search
"-----------------------------------------------------------------------------
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=5

"-----------------------------------------------------------------------------
" Visual cues
"-----------------------------------------------------------------------------
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

highlight ExtraWhitespace ctermbg=yellow guibg=yellow
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

autocmd BufWritePre * :%s/\s\+$//e

autocmd Filetype gitcommit setlocal spell textwidth=72

" remove trailing whitespace on save.
" http://stackoverflow.com/questions/356126/how-can-you-automatically-remove-trailing-whitespace-in-vim/1618401#1618401
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,js,scss,css autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
" command to strip white space from any file
nnoremap <leader>s :call <SID>StripTrailingWhitespaces()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


"-----------------------------------------------------------------------------
" Text formatting
"-----------------------------------------------------------------------------
set autoindent
set smartindent
set nowrap
set formatoptions+=n
set shiftwidth=2
set virtualedit=all
set list
" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\`\             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
" off and the line continues beyond the right of the
set listchars+=precedes:<         " The character to show in the last column when wrap is
" off and the line continues beyond the right of the
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set cindent
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}', '|':'|' }
let g:AutoCloseProtectedRegions = ["Character"]
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['php', 'rb', 'css', 'scss', 'js', 'coffeescript', 'haml'] }

"-----------------------------------------------------------------------------
" Backup
"-----------------------------------------------------------------------------
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"-----------------------------------------------------------------------------
" Colors/ Theme
"-----------------------------------------------------------------------------
colorscheme molokai

"-----------------------------------------------------------------------------
" Mapping keys
"-----------------------------------------------------------------------------
map <F2> :NERDTreeToggle<CR>
nnoremap <F4> :GundoToggle<CR>

" tomtom/tcomment_vim
map <D-/> gccj
vmap <D-/> gc
imap <D-/> <Esc>gccj

"Move between vim splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Search
nnoremap gG :OpenURL http://www.google.com/search?q=<cword><CR>
nnoremap gA :Ag! <cword><CR>

nnoremap <silent> <F5> <Esc>:ClearCtrlPCache<CR>

" Map command-[ and command-] to indenting or outdenting
" while keeping the original selection in visual mode
vmap <D-]> >gv
vmap <D-[> <gv

nmap <D-]> >>
nmap <D-[> <<

omap <D-]> >>
omap <D-[> <<

imap <D-]> <Esc>>>i
imap <D-[> <Esc><<i

" Bubble single lines
nmap <D-k> [e
nmap <D-j> ]e

" Bubble multiple lines
vmap <D-k> [egv
vmap <D-j> ]egv

" Tagbar display
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
nnoremap <silent> <leader>sb :call <SID>beautify()<cr>

" Close diff
nnoremap <Leader>gD <c-w>h<c-w>c
map <C-a> ggVG

" copy and paste
vmap <D-c> "+yi
vmap <D-x> "+c
vmap <D-v> c<ESC>"+p
imap <D-v> <ESC>"+pa

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

"-----------------------------------------------------------------------------
" TidyHTML
"-----------------------------------------------------------------------------
function! s:HTMLBeautifier ()
  let oldLine = line('.')
  :%!htmlbeautifier
  exe ':' . oldLine
endfunction
nnoremap <silent> <leader>br :call <SID>HTMLBeautifier()<cr>
"-----------------------------------------------------------------------------
" YouCompleteMe
"-----------------------------------------------------------------------------
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1

"-----------------------------------------------------------------------------
" Misclaneous
"-----------------------------------------------------------------------------
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=*/vendor/rails/**
set wildignore+=*/vendor/cache/**
set wildignore+=*.gem
set wildignore+=*/log/*
set wildignore+=*/tmp/*
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*node_modules*
set wildignore+=*/*.log

"-----------------------------------------------------------------------------
" Auto commands
"-----------------------------------------------------------------------------
"
au! BufRead,BufNewFile *.haml setfiletype haml
au! BufRead,BufNewFile *.hamlc setfiletype haml
au! BufRead,BufNewFile *.rabl setfiletype ruby
autocmd VimEnter * wincmd p

"  ---------------------------------------------------------------------------
"  Easymotion
"  ---------------------------------------------------------------------------
let g:EasyMotion_leader_key = '\'
let g:EasyMotion_mapping_f  = '//'
let g:EasyMotion_mapping_F  = '<Leader>F'
let g:EasyMotion_keys       = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890'
let g:EasyMotion_do_shade   = 1

"-----------------------------------------------------------------------------
" UI
"-----------------------------------------------------------------------------
" Don't redraw while executing macros (good performance config)
set lazyredraw

"Always show current position
set ruler

set ruler                             " show cursor position all the time
set scrolloff=5                 " keep at least 5 lines around the cursor
set number                            " set line number on
set wildmenu
set ch=1                              " command line height
set backspace=indent,eol,start        " backspace through everything in insert mode
set report=0                          " tell us about changes
set guioptions=egitcm
set mousehide                         " hide mouse after chars typed
set mouse=a                           " mouse in all modes
set ttymouse=xterm

"-----------------------------------------------------------------------------
" Fix slowliness with syntax highlighting
"-----------------------------------------------------------------------------
set nocursorcolumn
set nocursorline
syntax sync minlines=256

"-----------------------------------------------------------------------------
" Tube.vim
"-----------------------------------------------------------------------------
" let g:tube_always_clear_screen = 1
" let g:tube_terminal = 'iterm'
" let g:tube_enable_shortcuts = 1
"
" function! s:executeRspec ()
"   let bn = bufname('%')
"   execute ':TubeCd'
"   execute ':Tube zeus rspec '.bn.' -f d -c'
" endfunction
"
" function! s:executeRspecLine ()
"   execute ':TubeCd'
"   execute ':Tube zeus rspec %:'.line('.').' -f d -c'
" endfunction
"
" nnoremap <silent> <leader>ra :call <SID>executeRspec()<cr>
" nnoremap <silent> <leader>rl :call <SID>executeRspecLine()<cr>

