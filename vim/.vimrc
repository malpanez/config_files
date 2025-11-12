set nocompatible
syntax enable               " syntax highlighting without full plugin overhead
filetype plugin indent on   " load filetype specific plugins + indent files

" UI --------------------------------------------------------------
set number
set relativenumber
set cursorline
set showcmd
set showmatch
set signcolumn=yes
set termguicolors
set splitbelow
set splitright
set scrolloff=3
set wildmenu
set wildmode=longest:full,full
set title

" Editing ---------------------------------------------------------
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set autoindent
set wrap
set linebreak
set clipboard=unnamedplus
set undofile
set updatetime=300

" Search ----------------------------------------------------------
set incsearch
set hlsearch
set ignorecase
set smartcase

" Diagnostics / whitespace ---------------------------------------
function! s:StripTrailingWhitespaces()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfunction

augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre * call <SID>StripTrailingWhitespaces()
    autocmd FileType java      setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
    autocmd FileType make      setlocal noexpandtab
    autocmd FileType sh,zsh    setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType ruby      setlocal tabstop=2 shiftwidth=2 softtabstop=2 commentstring=#\ %s
    autocmd FileType python    setlocal commentstring=#\ %s
augroup END

" Mapping Section -------------------------------------------------
nnoremap <F7> gg=G``        " format whole file and return to original spot
