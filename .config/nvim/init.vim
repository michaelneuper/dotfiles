" =======================
" === UI & Appearance ===
" =======================
colorscheme gruvbox

set encoding=utf-8
set termguicolors

if empty($TMUX) && $TERM_PROGRAM !=# 'Apple_Terminal'
  if has('nvim')
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
endif

set number
set relativenumber
set numberwidth=5
set laststatus=2
set ruler
set showcmd
set colorcolumn=+1
set textwidth=80
set list listchars=tab:»·,trail:·,nbsp:·
set noshowmode

" ==================
" === Mappings ===
" ==================
let mapleader = " "

nnoremap <leader>fs :w<CR>
nnoremap <leader>qq :q<CR>

" ================
" === Settings ===
" ================
set backspace=indent,eol,start
set nobackup
set nowritebackup
set noswapfile
set history=50
set incsearch
set autowrite
set modelines=0
set nomodeline
set wildmode=list:longest,list:full
filetype plugin indent on
syntax on

" ================
" === Tabs ===
" ================
set tabstop=2
set shiftwidth=2
set expandtab
set shiftround

function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<Tab>"
  else
    return "\<C-p>"
  endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

" ================
" === Ag Setup ===
" ================
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let $FZF_DEFAULT_COMMAND = 'ag --literal --files-with-matches --nocolor --hidden -g ""'
  nnoremap \ :Ag<SPACE>
endif

" ===============
" === MatchIt ===
" ===============
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" ===============
" === Autocmds ===
" ===============
augroup vimrcEx
  autocmd!
  autocmd BufReadPost * if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal! g`\"" | endif

  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
  autocmd BufRead,BufNewFile aliases.local,zsh*local,*/zsh/configs/* set filetype=sh
  autocmd BufRead,BufNewFile gitconfig.local set filetype=gitconfig
  autocmd BufRead,BufNewFile tmux.conf.local set filetype=tmux
  autocmd BufRead,BufNewFile vimrc.local set filetype=vim
augroup END

let g:is_posix = 1
