" =============================================================================
" NO COMPATIBILITY
" =============================================================================
set nocompatible

" =============================================================================
" LANGUAGE UI
" =============================================================================
language messages C
set langmenu=en_US.UTF-8

" =============================================================================
" VIM-PLUG
" =============================================================================
call plug#begin(expand('~/.config/nvim/plugged'))
Plug 'preservim/nerdtree'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'yggdroot/indentline'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mg979/vim-visual-multi'
Plug 'ryanoasis/vim-devicons'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'benmills/vimux'
Plug 'sheerun/vim-polyglot'
Plug 'christoomey/vim-tmux-navigator'
Plug 'AndrewRadev/tagalong.vim'
Plug 'voldikss/vim-floaterm'
Plug 'psliwka/vim-smoothie'
Plug 'liuchengxu/vista.vim'
call plug#end()

" =============================================================================
" SET THE GUI COLOR SCHEME
" =============================================================================
set t_Co=256
set termguicolors
set guifont=FiraCode\ Nerd\ Font\:h12
color nord
" ============================================================================
" HIGHLIGHT
" =============================================================================
" Make background transparent for many things
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
hi! LineNr ctermfg=NONE guibg=NONE
hi! SignColumn ctermfg=NONE guibg=NONE
hi! StatusLine guifg=NONE guibg=NONE
hi! StatusLineNC guifg=NONE guibg=NONE
" Try to hide vertical spit and end of buffer symbol
hi! VertSplit gui=NONE guifg=NONE guibg=NONE
hi! EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
" Make background color transparent for git changes
hi! SignifySignAdd guibg=NONE
hi! SignifySignDelete guibg=NONE
hi! SignifySignChange guibg=NONE
hi CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
" For list
hi NonText ctermfg=16 guifg=#EBCB8B
hi SpecialKey ctermfg=16 guifg=#EBCB8B
"Nord color for sneak
hi Sneak gui=bold guifg=#D8Dee9 guibg=#5E81AC
hi SneakScope  guifg=#2E3440 guibg=#EBCB8B
hi SneakLabelMask guifg=#5E81AC guibg=#5E81AC
"Nord floaterm
hi FloatermBorder guifg=#EBCB8B
" =============================================================================
" SETTINGS
" =============================================================================
highlight Comment cterm=italic gui=italic

map <silent> - :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=45
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeQuitOnOpen=1
let g:WebDevIconsOS = 'Darwin'
let NERDTreeMinimalUI=1
let NERDTreeCascadeSingleChildDir=1

" ============================================================================
" VISTA
" =============================================================================
let g:vista#renderer#enable_icon = 1
let g:vista#finders = ['fzf']
let g:vista_executive_for = {
      \ 'ruby': 'coc',
      \ }
let g:vista_fzf_preview = []

" =============================================================================
" FZF
" =============================================================================
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Todo', 'rounded': v:false } }


" ============================================================================
" FLOATERM
" =============================================================================
let g:floaterm_autoclose = 2
let g:floaterm_title = 'λ -> $1..$2'

" =============================================================================
"<F1> open help
nmap                       <Leader>p :call fzf#vim#files('', fzf#vim#with_preview({'options': '--prompt ""'}, 'right:70%'))<CR>
