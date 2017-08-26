""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""                            SET OPTIONS                                 """"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible        " don't require compatibility with vi
set autoindent          " automatically indent C code
set gdefault            " searches use /g by default
set hlsearch            " highlight matching search arguments
set ignorecase          " ignores case in searching
set incsearch           " shows matches as you search with "/"
set makeprg=make        " what program to use to make c files
set mouse=a             " enables the mouse
set nu                  " show line numbers
set ruler               " show cursor position in status line
set shiftwidth=4        " indentation will insert this many spaces
set showcmd             " show partial command in status line
set showmatch           " show matching bracket
set foldmethod=indent   " fold on indent
set smarttab            " **
set softtabstop=4       " backspace treats spaces as tab
set textwidth=81        " set linebreak at 81
set cc=80               " Shows a line marker at 80 characters
set wrap                " wrap lines onto screen, rather than cutting off
set expandtab           " use spaces instead of tabs
set backspace=indent,eol,start  " backspace works for softtabs in insert mode
set whichwrap=b,s,<,>,[,]
set tags=~/tags,tags,./tags
set autowrite           " Saves automatically on exit
set diffopt+=iwhite     " Ignores whitespace in vimdiff
set iskeyword=a-z,A-Z,48-57,_,~ " add ~ as a keyword character for c++
set completeopt=longest,menuone "Autocomplete menu
set smartindent         " Indent all sorts of files
set splitbelow          " For vs, sv split options
set splitright
set cino=N-s            "Don't indent for open namespaces
set laststatus=2        "Always display the status line
set spell spelllang=en_gb   "Set spell check to British English
set encoding=utf-8
set t_Co=256            " Force 256 colours
set background=dark

set title titleold=%<%F%=%l/%L-%P titlelen=70

syntax on           " enables syntax highlighting

set wildignore+=*/00deps/*,*/llcalc*/*,*.o,*.dd,*.d,00*,*.gcno,*.gcda
set wildignore+=*.log*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""                            KEY MAPPINGS                                """"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "

" Reformat paragraph: gq
nnoremap Q       q
nnoremap <F1> :!banner HELP <CR>
nnoremap <F2> 
nnoremap <F3> I/* <Esc>A */<Esc>
nnoremap <F4> :SyntasticCheck<CR>
nnoremap <F5> :call VimuxRunCommand("make build")<CR>
nnoremap <F6> :call VimuxRunCommand("make test")<CR>
nnoremap <F7> :call VimuxRunCommand("make itest")<CR>
nnoremap <F8> 
nnoremap <F9> :NERDTreeToggle<CR> :TagbarToggle<CR>
nnoremap <F10> 
nnoremap <F11> 
nnoremap <F11> 
nnoremap <F12> :set ignorecase! <CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-Z> :VimwikiAll2HTML<CR>
nnoremap <C-P> :<C-u>Unite -start-insert file_rec<CR>
nnoremap <Leader>w :bp\|bd #<CR>

nmap <Leader>1 <Plug>AirlineSelectTab1
nmap <Leader>2 <Plug>AirlineSelectTab2
nmap <Leader>3 <Plug>AirlineSelectTab3
nmap <Leader>4 <Plug>AirlineSelectTab4
nmap <Leader>5 <Plug>AirlineSelectTab5
nmap <Leader>6 <Plug>AirlineSelectTab6
nmap <Leader>7 <Plug>AirlineSelectTab7
nmap <Leader>8 <Plug>AirlineSelectTab8
nmap <Leader>9 <Plug>AirlineSelectTab9
nmap <Leader>- <Plug>AirlineSelectPrevTab
nmap <Leader>+ <Plug>AirlineSelectNextTab

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

filetype off

" Make md files recognized as Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""                               PLUGINS                                  """"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !empty(glob("~/.vim/bundle/Vundle.vim"))
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'               "Let Vundle manage Vundle
    Plugin 'vim-airline/vim-airline'            "Status Bar
    Plugin 'MattesGroeger/vim-bookmarks'        "Bookmarks
    Plugin 'altercation/vim-colors-solarized'   "Solarized color scheme
    Plugin 'nvie/vim-flake8'                    "PEP8 checking
    Plugin 'tpope/vim-fugitive'                 "Git integration
    Plugin 'tpope/vim-markdown'                 "Markdown support
    Plugin 'JamshedVesuna/vim-markdown-preview' "Makrdown preview
    Plugin 'xolox/vim-misc'                     "Misc stuff needed by vim-session
    Plugin 'scrooloose/nerdtree'                "File Tree
    Plugin 'vimoutliner/vimoutliner'            "Outliner
    Plugin 'reedes/vim-pencil'                  "For writers
    Plugin 'xolox/vim-session'                  "Window session management
    Plugin 'scrooloose/syntastic'               "Syntax check on save
    Plugin 'majutsushi/tagbar'                  "Tag Manager
    Plugin 'Shougo/unite.vim'                   "Fuzzy file finder
    Plugin 'benmills/vimux'                     "Vim/tmux integration
    Plugin 'vimwiki/vimwiki'                    "Personal wiki
    Plugin 'jnurmine/Zenburn'                   "Syntax highlighting
    " Add plugins above
    call vundle#end()
endif

if &runtimepath =~ 'vimwiki'
    let mainwiki = {}
    let mainwiki.path = '$HOME/.vim/wiki'
    let mainwiki.path_html = '$HOME/public_html/wiki/'
    let mainwiki.auto_toc = 1

    let storywiki = {}
    let mainwiki.path = '$HOME/private/wiki'
    let mainwiki.path_html = '$HOME/public_html/nowiki/'
    let mainwiki.auto_toc = 1
    let g:vimwiki_list = [ mainwiki, storywiki ]
endif

if &runtimepath =~ 'syntastic'
    let g:syntastic_cpp_include_dirs=['./src/']
    let g:syntastic_mode_map = {
            \ "mode": "active",
            \ "passive_filetypes": ["cpp", "python", "bash"] }
endif

if &runtimepath =~ 'tagbar'
    let g:tagbar_ctags_bin='/opt/swt/bin/ctags'
    let g:tagbar_left = 1
    let g:tagbar_vertical = 30
endif

if &runtimepath =~ 'session'
    let g:session_autosave = 'yes'
    let g:session_autosave_to = 'autosave'
    let g:session_autoload = 'yes'
    let g:session_default_to_last = 1
endif

if &runtimepath =~ 'nerdtree'
    let NERDTreeIgnore = ['\.pyc$', '\.o$', '\.d$']
    let NERDTreeWinPos = 'left'
    let g:NERDTreeDirArrowExpandable = '+'
    let g:NERDTreeDirArrowCollapsible = '-'
endif

if &runtimepath =~ 'airline'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#buffers_label = 'Files'
    let g:airline#extensions#tabline#buffer_idx_mode = 1
endif

if &runtimepath =~ 'unite'
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern',
                \ '\(\.d$\|\.o$\|\.dd\)')
endif

if &runtimepath =~ 'solarized'
    let g:solarized_termcolors=256
    colorscheme solarized
endif

if &runtimepath =~ 'glaive'
    call glaive#Install()
endif

if &runtimepath =~ 'pencil'
    "
    let g:pencil#wrapModeDefault = 'hard' "Soft wrap
    augroup pencil
        autocmd!
        autocmd FileType md, txt    call pencil#init()
                                \ | call lexical#init()
                                \ | call litecorrect#init()
                                \ | call textobj#quote#init()
                                \ | call textobj#sentence#init()
    augroup END
endif

" Vimwiki settings
if &runtimepath =~ 'vimwiki'
    let g:vimwiki_list = [
        \ {'path': '$HOME/Documents/wiki/', 'path_html': '$HOME/public_html/'},
        \ {'path': '$HOME/Writings/test/wiki/', 'path_html': '$HOME/Writings/test/wiki/export'}
        \ ]
endif

filetype plugin indent on
