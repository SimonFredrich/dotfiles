if &shell =~# 'fish$'
  set shell=sh
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

let g:Tex_FoldedSections     = ""
let g:Tex_FoldedEnvironments = ""
let g:Tex_FoldedMisc         = ""
let g:Tex_flavor             = "latex"
let g:Tex_FormatDependency   = "pdf"
let g:tex_CompileRule_pdf    = "latexmk -pdf - f $*"

call plug#begin("~/.vim/plugins/")

Plug 'vim-latex/vim-latex'

Plug 'lervag/vimtex'

Plug 'sirver/ultisnips'

Plug 'dylanaraps/wal'

call plug#end()

"Vimtex settings
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

" Ultisnips settings
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" vim-latex settings
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" OPTIONAL: This enables automatic indentation as you type.
"filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':

syntax on
colorscheme default
" set background=dark
hi Normal guibg=NONE ctermbg=NONE

set scrolloff=5
set nofoldenable
set nornu
set number
set hlsearch
set incsearch
set ignorecase
" setting up tabspaceing
set expandtab
set tabstop=4
set shiftwidth=4
"set paste
highlight Search ctermbg=yellow
hi Search ctermfg=black

" Spelling
"setlocal spell
"set spelllang=en_us
"inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" create and edit figures
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

" build and view pdf file
:map ,c :w<Enter>:!./build.sh<Enter>
:map ,v :w<Enter>:!xdg-open main.pdf<Enter>
