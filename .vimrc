" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

"==================
"| TAB SETTINGS:  |
"==================
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" Sets the softtabsize to 2 for HTML Files
" This should make tabs expand to 2 spaces 
autocmd Filetype html setlocal tabstop=2
autocmd Filetype html setlocal shiftwidth=2
autocmd Filetype html setlocal softtabstop=2

"====================
"| THEME SETTINGS:  |
"====================
" Enable true color support
set termguicolors
"--------------------
"| 1. Gruvbox:      |
"--------------------
" Gruvbox theme settings:
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_contrast_light = 'hard' 
" use a better vertsplit char
set fillchars+=vert:│

"====================
"| PLUGIN SETTINGS: |
"====================
"-------------------
"| 1. CtrlP:       |
"-------------------
" Changes default mapping and command to invoke CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" CtrlP will set its local working directory according to this:
" 'a' - the directory of the current file, unless it is a subdirectory of the cwd 
" 'r' - the nearest ancestor of the current file that contains one of these directories or files: .git .hg .svn .bzr _darcs
" let g:ctrlp_working_path_mode = 'ra' 
" Open new files in a new pane
let g:ctrlp_switch_buffer = 'et'

"------------------
"| 2. NERDTree:   |
"------------------
" Open NERDTree automatically when vim starts up if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Closes vim if only NERDTree is open:
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Maps Ctrl+n to open NERDTree:
map <C-n> :NERDTreeToggle<CR>

" --------------------
" | 3. VIMCommentary |
" --------------------
" In case of any incompatible files: Simply add below [autocmd Filetype <that file> setlocal commentstring=#\ %s]
" Vimscript comments:
autocmd Filetype vimscript setlocal commentstring=\"\ %s
" Python comments:
autocmd Filetype python setlocal commentstring=#\ %s

" -------------------
" | 4. GitGutter:   |
" ------------------
" To set the delay in tracking changes to 100ms
set updatetime=100

" --------------------
" | 5. Lightline:    |
" --------------------
" Removes the redundant vim label of current mode
set noshowmode
" My Lightline config:
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
      \             [ 'cocstatus', 'readonly' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'component_func': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" -------------------
" | 6. CoC.NVIM:    |
" -------------------
" Better display for messages
set cmdheight=2
" Use Tab and S-Tab to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" To make <cr> select the first completion item and confirm the completion when no item has been selected:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" Close the preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" I have Indent Lines but it has no settings to tinker with as I'm okay with its defaults.

"--------------------------------
" Theme Switching based on time:
"--------------------------------
if strftime("%H") < 18 
    let ayucolor="light"
    let g:lightline.colorscheme='ayu_light'
    colorscheme ayu
else
    set background=dark
    " I have equinusocio_material in pack/*/opt solely for the lightline theme so I add it on demand
    packadd! equinusocio-material.vim
    let g:lightline.colorscheme='equinusocio_material'
    colorscheme gruvbox
endif


