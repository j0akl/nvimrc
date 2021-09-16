syntax on
filetype off                  " required
let python_highlight_all=1
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

set path+=**

set number relativenumber
set nu rnu

set clipboard=unnamedplus
set mouse=a
set nu
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'evanleck/vim-svelte', {'branch': 'main'}
Plugin 'jparise/vim-graphql'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'gmarik/Vundle.vim'
" Plugin 'vim-scripts/indentpython.vim'
" Plugin 'SirVer/ultisnips' | Plugin 'honza/vim-snippets'
" Plugin 'Shougo/deoplete.nvim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'luochen1990/rainbow'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'Chiel92/vim-autoformat'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'maxmellon/vim-jsx-pretty'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
" All of your Plugins must be added before the following line


"let java_highlight_functions = 1
let java_highlight_all = 1
" If you are trying this at runtime, you need to reload the syntax file
set filetype=java

" Some more highlights, in addition to those suggested by cmcginty
highlight link javaScopeDecl Statement
highlight link javaType Type
highlight link javaDocTags PreProc

call vundle#end()            " required
filetype plugin indent on    " required
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
set ruler               " Show the line and column numbers of the cursor.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set modeline            " Enable modeline.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.
set noerrorbells                " No beeps
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show m what I'm typing
set showmode                    " Show current mode.
set noswapfile                  " Don't use swapfile
set nobackup            	" Don't create annoying backup files
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set autoindent
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css,*.svelte,*.txt,*.java,*.ts,*.tsx,*.jsx,*.json,*.md
    \ set tabstop=2
    \ expandtab
    \ softtabstop=2
    \ shiftwidth=2


au BufNewFile,BufRead *.c,*.hpp,*.cpp,*.cs
    \ set tabstop=2
    \ softtabstop=2
    \ shiftwidth=4
    \ textwidth=80
    \ expandtab
    \ autoindent
    \ fileformat=unix

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>

" Leader key is like a command prefix. 
let mapleader='z'
let maplocalleader='\'

" bracket pair colorizer config
let g:rainbow_active = 1

let g:python_host_prog="/usr/local/bin/python2.7"

" coc-prettier binding
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_default_to_last = 1

" set cursorcolumn
nmap <Space> <PageDown>
vmap <BS> x

" cd ~/.config/nvim/spell
" wget http://ftp.vim.org/vim/runtime/spell/pt.utf-8.spl
" set spell spelllang=pt_pt
" zg to add word to word list
" zw to reverse
" zug to remove word from word list
" z= to get list of possibilities
" set spellfile=~/.config/nvim/spellfile.add
set nospell


" deoplete config
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1
if has("gui_running")
    inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()
else
    inoremap <silent><expr><C-@> deoplete#mappings#manual_complete()
endif

" for coc
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  " set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  set listchars=tab:>\ ,extends:>,precedes:<,nbsp:+
endif

" nerdtree config
map <C-n> :NERDTreeToggle<CR>

" airline settings
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_powerline_fonts=1
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_powerline_fonts=1
let g:airline_theme='molokai'

" Multicursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-e>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_quit_key='<Esc>'

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1

" Other
set list

" Theme
colorscheme dracula

" Buffer handling
nmap L :let &number=1-&number<CR>
nmap <leader>l :bnext<CR>
nmap <c-h> :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
nmap <leader>0 :set invnumber<CR>
" map :q to byffer delete
" http://stackoverflow.com/questions/7513380/vim-change-x-function-to-delete-buffer-instead-of-save-quit
cnoreabbrev <expr> q getcmdtype() == ":" && (getcmdline() == 'q' && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) > 1) ? 'bd' : 'q'
