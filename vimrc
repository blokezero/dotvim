" Pathogen plugin manager
execute pathogen#infect('~/.vim/bundle/drupalvim/bundle/{}')
execute pathogen#infect()

" BASICS

" Use vim defaults.
set nocompatible
set timeout timeoutlen=1500
set t_Co=256
"colorscheme PaperColor
set background=dark
"set background=light
"colorscheme scheakur
colorscheme base16-solarized


" Tabs, Spaces and Indentation.
set expandtab     " Use spaces for tabs.
set tabstop=2     " Number of spaces to use for tabs.
set shiftwidth=2  " Number of spaces to autoindent.
set softtabstop=2 " Number of spaces for a tab.
set autoindent    " Set autoindenting on.

" WIDTH
"set textwidth=80
"set colorcolumn=+1
" Words Wrap settings
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0

" NUMBERS
set number
set numberwidth=5

" VARIOUS.
set backspace=2   " Backspace, this is the same as :set
set ruler         " Show the cursor position.
set scrolloff=5   " Show 5 lines above/below the cursor when
set number        " Line numbers on.
set showcmd       " Shows the command in the last line of the screen.
set autoread      " Read files when they've been changed outside of Vim.
set autowrite     " Automatically :write before running commands

" WHITESPACE
" Strip trailing whitespace on save,
autocmd BufWritePre * :%s/\s\+$//e
" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Bells and whistles.
set novisualbell
"set noerrorbells
"set t_vb=

set history=300 " Number of command lines stored in the history

set title " Set the title in the console.

" ----- KEYS AND MOUSE -----

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Prevent help popping up catch <F1> instead of
:nmap <F1> <ESC>
:map <F1> <ESC>
:imap <F1> <ESC>


" What? We can use a mouse in the terminal?
if has('mouse')
    set mouse=a
    set ttymouse=xterm2
endif

" FASTER REDRAWING
set ttyfast

" Spacebar as leader key.
let mapleader = "\<Space>"

" BUFFERS
set hidden                      " Allow buffer to be hidden if modified.

nmap <leader>B :enew<cr>            " To open a new empty buffer
nmap <leader>l :bnext<CR>           " Move to the next buffer
nmap <leader>h :bprevious<CR>       " Move to the previous buffer
nnoremap <leader><leader> <c-^>     " Switch between the last two files
nnoremap <leader>q :bp<cr>:bd #<cr> " \q to close buffer without closing window.


" CODE FOLDING SETTINGS
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

" TOGGLE INVISIBLE CHARACTERS
set invlist
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
highlight SpecialKey ctermbg=none " make the highlighting of tabs less annoying
set showbreak=↪
nmap <leader>l :set list!<cr>

" TEXTMATE STYLE INDENTATION
vmap <leader>[ <gv
vmap <leader>] >gv
nmap <leader>[ <<
nmap <leader>] >>

" TRY TO FIX DISSAPEARING ARROWKEYS
if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
  inoremap <silent> <C-[>OC <RIGHT>
endif

" COPY AND PASTE
" Paste mode toggle on F2
set pastetoggle=<F2>
"
" Copy & paste to system clipboard with <Space>p and <Space>y:
vmap <Leader>y "+y
vmap <Leader>D "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Replace selected text with register on 'r' without copying into register.
vmap r "_dP"

" Use matchtime and showmatch together.
set matchtime=2 " Time to show matching parent in 10ths of a sec.
set showmatch " Show matching parents.

" BACKUP.
set nobackup " Don't backup files.
set writebackup
set noswapfile

" SPLITS AND WINDOWS
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" SEARCH
set hlsearch
set incsearch
set ignorecase
set smartcase
" // Will copy selected text and search for it.
vnoremap // y/<C-R>"<CR>"
" :C clears search highlighting
:command C let @/=""

set wildmode=longest:full,list:full

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" FILE TYPE
filetype plugin indent on
syntax enable

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.scss set ft=scss
  autocmd BufNewFile,BufRead *.{module,install} set filetype=php.drupal

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass,js setlocal iskeyword+=-
augroup END

" Always use vertical diffs
set diffopt+=vertical

" w!! will sudo save.
cmap w!! w !sudo tee % >/dev/null

" Omni complete on.
set omnifunc=syntaxcomplete#Complete
" Map autocomplete to [ALT]+[SPACE]
inoremap <M-Space> <C-x><C-o>

" ----- BUNDLE SPECIFIC SETTINGS -----

" ----- NERDTree -----

"autocmd VimEnter * NERDTree    "Autostart NERDTree on VIM start.
let NERDTreeShowHidden=1        " Show hidden files in NERDTree.
" Hide a few folders
let NERDTreeIgnore=['.DS_Store', '.codekit-cache', '.sass-cache']
map <C-n> :NERDTreeToggle<CR>   " Ctrl-n opens nerdtree.

" ----- CTRL-P -----
map <C-t> :CtrlPBuffer<CR>

" ----- tpope/SYNTASTIC settings -----
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['html'] }

" ----- tpope/fugitive settings -----
set statusline+=%{fugitive#statusline()}

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
"nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To not have NERDTree tabs always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
"set tags=./tags;,~/.vimtags

" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
"let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
"let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with [SPACE] b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" alternative to <C-]>
" place your cursor on an id or class and hit <leader>]
" to jump to the definition
nnoremap <leader>] :tag /<c-r>=expand('<cword>')<cr><cr>

" alternative to <C-w>}
" place your cursor on an id or class and hit <leader>}
" to show a preview of the definition. This doesn't seem to be
" very useful for CSS but it rocks for JavaScript
nnoremap <leader>} :ptag /<c-r>=expand('<cword>')<cr><cr>

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- HTML tidy -----
vmap ,x :!tidy -q -i --show-errors 0<CR>


" ----- Neocomplete -----
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"


" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

" END Neocomplete


" ----- Neosnippet -----
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"

xmap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\>"

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/drupal-snippets'

let g:minBufExplForceSyntaxEnable = 1

" javascript libraries syntax
let g:used_javascript_libs = 'jquery'

" ------ Dash ------
:nmap <silent> <leader>d <Plug>DashSearch

" ----- Powerline -----
set rtp+=/Users/alex/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim

let g:minBufExplForceSyntaxEnable = 1
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

set laststatus=2 " Always display the statusline in all windows
set guifont=Inconsolata\ for\ Powerline:h14
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

