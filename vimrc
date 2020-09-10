" plugins

call plug#begin('~/.vim/plugged')
" Theme
Plug 'jacoborus/tender.vim'
Plug 'skielbasa/vim-material-monokai'
Plug 'cocopon/iceberg.vim'
Plug 'lifepillar/vim-solarized8'

" Vim helpers
Plug 'tpope/vim-eunuch'
Plug 'farmergreg/vim-lastplace'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Asheq/close-buffers.vim'
" Plug 'maxbrunsfeld/vim-yankstack'

" TMUX integration.
Plug 'christoomey/vim-tmux-navigator'

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" Snippets
Plug 'honza/vim-snippets'
Plug 'epilande/vim-react-snippets'
" Plug 'sirver/UltiSnips'

Plug 'https://git.drupalcode.org/project/vimrc.git', { 'branch': '7.x-1.x', 'rtp': 'bundle/vim-plugin-for-drupal'  }

" Linters
Plug 'w0rp/ale'

" UI
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'

" File
Plug 'justinmk/vim-dirvish'
Plug 'pbrisbin/vim-mkdir'
" Plug 'kristijanhusak/vim-dirvish-git'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Language
Plug 'sheerun/vim-polyglot'

" Language server protocol
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" Autocomplete
Plug 'Shougo/deoplete.nvim'
Plug 'lighttiger2505/deoplete-vim-lsp'
" Support plugins for Deoplete on Vim8
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'


" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

" Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}

" Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'}
" Plug 'elythyr/phpactor-mappings'

Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()

" VIM SETTINGS
if match($TERM, "screen")!=-1
  set term=xterm
endif

set background=dark
set t_Co=256

set mouse=a
set noswapfile
set nobackup

" Key mapping
" w!! will sudo save.
cmap w!! w !SUDO_ASKPASS=/usr/local/bin/ssh-askpass sudo -A tee % > /dev/null

" ENCODING
set encoding=utf-8
scriptencoding utf-8
set nocompatible

" Theme
colorscheme solarized8_high
highlight clear SignColumn

let g:solarized_extra_hi_groups=1
let g:solarized_visibility="high"

" PYTHON3
set pyxversion=3
set pythonthreehome=

" TOGGLE INVISIBLE CHARACTERS
set invlist
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮,nbsp:·
highlight SpecialKey ctermbg=none " make the highlighting of tabs less annoying
set showbreak=↪
nmap <leader>I :set list!<cr>

" Copy & paste to system clipboard with <Space>p and <Space>y:

set nopaste
vmap <Leader>y "+y
vmap <Leader>D "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Replace selected text with register on 'r' without copying into register.
vmap r "_dP"

" SPLITS AND WINDOWS
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright
" Use CTRL + MV to switch splits.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" SEARCH
set hlsearch
set incsearch
set ignorecase
set smartcase

" // Will copy selected text and search for it.
vnoremap // y/<C-R>"<CR>"

" :C clears search highlighting
:command! C let @/=""


" Don't loose visual selection after indenting with arrow keys.
vnoremap > >gv
vnoremap < <gv

" Indent guide
let g:indentLine_char = '│'

" WIDTH
set textwidth=80
set colorcolumn=+1

" Words Wrap settings
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0

" LINE NUMBERS
set number
set numberwidth=5

" VARIOUS.
set backspace=2   " Backspace, this is the same as :set
set ruler         " Show the cursor position.
set scrolloff=5   " Show 5 lines above/below the cursor when
set showcmd       " Shows the command in the last line of the screen.
set autoread      " Read files when they've been changed outside of Vim.
set showtabline=2 " Always show tabline.
set hidden        " Hide buffers rather than prompt to save them.

" Bells and whistles.
set novisualbell

set history=300 " Number of command lines stored in the history

set title " Set the title in the console.
" augroup Rc
"   autocmd!
" augroup END

" set autoread
set nobackup
" set nolazyredraw
" set nowritebackup
" set tildeop
" set ttyfast
" set wildmenu
" set wildmode=full
" filetype plugin indent on
" autocmd Rc BufWinEnter * set mouse=a

" Space setting

" set autoindent
" set list
" set shiftround
set shiftwidth=2
" set smartindent
" set smarttab
" set tabstop=2

" Custom stuff

set hlsearch
set incsearch

let g:mapleader = "\<space>"

" Set file type for Drupal module files.
" Drupal *.module and *.install files.
augroup module
  autocmd BufNewFile,BufRead *.{module,install,drush,theme,view,profile} set filetype=php.drupal
  autocmd BufNewFile,BufRead *.info.yml setlocal filetype=yaml.drupal
  autocmd BufRead,BufNewFile *.{test,inc} set filetype=php.drupal
augroup END

" Plugin settings

" ----- auto-pairs -----
let g:AutoPairsMapCh = 0
let g:AutoPairsMapCR = 0


" ----- fzf -----
nnoremap ; :Buffers<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>g :GFiles<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>l :Lines<cr>
nnoremap <leader>m :Maps<cr>
nnoremap <leader>r :Ag<cr>

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

set shortmess-=F


" ----- COC ------
" https://github.com/neoclide/coc.nvim
" Use <C-l> for trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)
"
" Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)"
" let g:coc_force_debug = 1

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Required for operations modifying multiple buffers like rename.
set hidden

" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"     \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
"     \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
"     \ 'python': ['/usr/local/bin/pyls'],
"     \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
"     \ }
" let g:LanguageClient_serverCommands = {
"     \ 'php.drupal': ['/home/asullivan/.composer/vendor/felixfbecker/language-server/bin/php-language-server.php', 'php'],
"     \ 'php': ['/home/asullivan/.composer/vendor/felixfbecker/language-server/bin/php-language-server.php', 'php'],
"     \ }

" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


" ----- Ultisnips -----
let g:UltiSnipsUsePythonVersion = 3

" ----- FZF -----
let g:fzf_layout = { 'down': '~40%' }
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" Customize fzf colors to match your color scheme
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


" Use ripgrep instead of ag:
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('up:60%', '?'),
      \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Global line completion (not just open buffers. ripgrep required.)
inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
      \ 'prefix': '^.*$',
      \ 'source': 'rg -n ^ --color always',
      \ 'options': '--ansi --delimiter : --nth 3..',
      \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'


" ----- w0rp/ale linter settings ------
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_sign_error = '●'
let g:ale_sign_warning = 'w'

" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
" let g:ale_sign_error = '❌'
" let g:ale_sign_warning = '⚠️'

let g:ale_sign_column_always = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1
" let g:ale_lint_delay = 750
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '✅ ok']
let g:ale_php_phpcs_standard = 'Drupal'

let g:ale_linters = {
    \  'jsx': ['eslint'],
    \  'javascript': ['eslint', 'flow'],
    \  'php': ['phpcs'],
    \  'html': ['htmlhint', 'prettier']
\}
let g:ale_linter_aliases = {'jsx': 'css'}
highlight clear SignColumn

" Bind F8 to fixing problems with ALE
nmap <F8> <Plug>(ale_fix)
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'scss': ['prettier', 'stylelint'],
\   'php': ['phpcbf']
\}

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" ------ lightline ------
set laststatus=2
set noshowmode
set cmdheight=2

let g:lightline = {
      \ 'colorscheme': 'tender',
      \ 'mode_map': { 'c': 'n' },
      \ 'active': {
      \  'left': [
      \    ['mode','paste'],
      \    ['cocstatus', 'currentfunction', 'fugitive', 'readonly', 'filename', 'modified'],
      \  ]
      \ },
      \ 'component_function': {
      \   'mode': 'LightLineMode',
      \   'modified': 'LightLineModified',
      \   'readonly': 'LightLineReadonly',
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \   'fileencoding': 'LightLineFileencoding',
      \   'relativepath': 'MyRelativePath',
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ 'separator': { 'left': '▶', 'right': '◀' },
      \ 'subseparator': { 'left': '▷', 'right': '◁' }
      \ }


let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \  'buffers': 'lightline#bufferline#buffers',
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \     'buffers': 'tabsel',
      \ }

" Bufferline settings.
" https://github.com/mengelbrecht/lightline-bufferline
let g:lightline.tabline = {'left': [['tabs']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#min_buffer_count = 2
let g:lightline#bufferline#read_only = ''

function! LightLineModified()
  return &filetype =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &filetype !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! LightLineFilename()
  "return (fnamemodify(expand("%"), ":~:."))
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&filetype == 'vimfiler' ? vimfiler#get_status_string() :
        \  &filetype == 'unite' ? unite#get_status_string() :
        \  &filetype == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%') ? expand('%') : '[No Name]')
endfunction

function! LightLineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 90 ? lightline#mode() : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyRelativePath()
  return &filetype ==# 'fzf' ? 'fzf' :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! CocCurrentFunction()
  return get(b:, 'coc_current_function', '')
endfunction

let g:lightline#ale#indicator_warnings = "\uf071\u00A0"
let g:lightline#ale#indicator_errors = "\uf05e\u00A0"
let g:lightline#ale#indicator_ok = "\uf00c"

" ---- Dirvish ----
" File explorer: https://github.com/justinmk/vim-dirvish
let g:loaded_netrwPlugin = 1
nmap - <Plug>(dirvish_up)
command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
" Put directories at top.
let g:dirvish_mode = ':sort ,^.*[\/],'

augroup dirvish_config
  autocmd!

  " Map `t` to open in new tab.
  autocmd FileType dirvish
        \  nnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
        \ |xnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>

  " Map `gr` to reload.
  autocmd FileType dirvish nnoremap <silent><buffer>
        \ gr :<C-U>Dirvish %<CR>

  " Map `gh` to hide dot-prefixed files.  Press `R` to "toggle" (reload).
  autocmd FileType dirvish nnoremap <silent><buffer>
        \ gh :silent keeppatterns g@\v/\.[^\/]+/?$@d _<cr>
augroup END

" ---- Signify ---
let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 1
let g:signify_cursorhold_normal = 0
let g:signify_cursorhold_insert = 0

" ---- NEOFORMAT ----
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" ---- PRETTIER ----
nmap <Leader>pf <Plug>(Prettier)

" ------- File type specific

" Use xmllint to indent.
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" UltiSnips Drupal snippets breaks without the following:
"
" this is well known Filename found in snipmate (and the other engines), but
" rewritten and documented :)
"
" optional arg1: string in which to replace '$1' by filename with extension
"   and path dropped. Defaults to $1
" optional arg2: return this value if buffer has no filename
"  But why not use the template in this case, too?
"  Doesn't make sense to me
fun! Filename(...)
  let template = get(a:000, 0, "$1")
  let arg2 = get(a:000, 1, "")

  let basename = expand('%:t:r')

  if basename == ''
    return arg2
  else
    return substitute(template, '$1', basename, 'g')
  endif
endf

" Required for operations modifying multiple buffers like rename.
" set hidden

" let g:LanguageClient_serverCommands = {
"     \ 'php.drupal': ['/home/asullivan/.vim/plugged/LanguageServer-php-neovim/vendor/bin/php-language-server.php'] ,
"     \ }

" let g:LanguageClient_serverCommands = {
"     \ 'php.drupal': ['intelephense', '--stdio'],
"     \ }
" let g:LanguageClient_loggingFile = '/tmp/lc.log'
" " let g:LanguageClient_serverCommands = {}
" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" " Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

