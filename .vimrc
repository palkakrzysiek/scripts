let mapleader = ","

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

filetype plugin indent on

" ---------------
" Plug-ins
" ---------------
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
" {{
let NERDTreeMinimalUI = 1
nmap <F3> :NERDTreeToggle<CR>
nmap <Leader>sit :NERDTreeFind<CR>

" }}

Bundle 'nathanaelkane/vim-indent-guides'
"{{
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=238
"  hi IndentGuidesOdd  ctermbg=white
"  hi IndentGuidesEven ctermbg=lightgrey
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

"}}

Bundle 'Tagbar'
" {{
nnoremap <silent> <F4> :TagbarOpenAutoClose<CR>
" }}

Bundle 'Lokaltog/vim-powerline'
" {{
let g:Powerline_symbols = 'fancy'
" }}

Bundle 'scrooloose/syntastic'
" syntax checking plugin

Bundle 'xuhdev/SingleCompile'
" {{
nmap <F5> :SCCompile<cr>
nmap <F6> :SCCompileRun<cr>
" }}

Bundle 'tpope/vim-surround'

Bundle 'flazz/vim-colorschemes'

Bundle 'vim-scripts/closetag.vim'

Bundle 'kien/ctrlp.vim'
" {{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
" }}

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
"Bundle 'vim-snippets'
Bundle "Shougo/neocomplcache.vim"
" {{
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
          return neocomplcache#smart_close_popup() . "\<CR>"
            " For no inserting <CR> key.
              "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
          endfunction
          " <TAB>: completion.
          inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
          " <C-h>, <BS>: close popup and delete backword char.
          inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
          inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
          inoremap <expr><C-y>  neocomplcache#close_popup()
          inoremap <expr><C-e>  neocomplcache#cancel_popup()
          " Close popup by <Space>.
          "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() :
          ""\<Space>"

          " For cursor moving in insert mode(Not recommended)
          "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
          "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
          "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
          "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
          " Or set this.
          "let g:neocomplcache_enable_cursor_hold_i = 1
          " Or set this.
          "let g:neocomplcache_enable_insert_char_pre = 1

          " AutoComplPop like behavior.
          "let g:neocomplcache_enable_auto_select = 1

          " Shell like behavior(not recommended).
          "set completeopt+=longest
          "let g:neocomplcache_enable_auto_select = 1
          "let g:neocomplcache_disable_auto_complete = 1
          "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

          " Enable omni completion.
          "autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
          "autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
          "autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
          "autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
          "autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

          " Enable heavy omni completion.
          if !exists('g:neocomplcache_omni_patterns')
                let g:neocomplcache_omni_patterns = {}
            endif
            let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
            let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
            let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"}}

Bundle 'Shougo/neosnippet'

" {{
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
      set conceallevel=2 concealcursor=i
endif
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
" }}

" ---------------
" Behaviors
" ---------------
set foldmethod=syntax
set autowrite " Automatically save before commands like :next and :make
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set joinspaces			" Put spaces between lines joined
set hlsearch
set textwidth=78
set autoread                    " Automatically reload changes if detected
set history=768                 " Number of things to remember in history.
set showmatch                   " Show matching brackets
set smartcase                   " Case insensitive searches become sensitive with capitals
set splitbelow                  " Split windows at bottom
set ts=4 sts=4 sw=4 expandtab	" Spaces as tabs
set nu                          " show lines number
set ff=unix                     " unix end of line
nmap <leader>l :set list!<CR>   " Shortcut to rapidly toggle `set list
set ignorecase

" ---------------
" folding
" --------------- {{
set foldenable                                   " Turn on folding
set foldmethod=marker                            " Fold on the marker
set foldlevel=100                                " Don't autofold anything (but I can still fold manually)
set foldlevelstart=99                            " Remove folds
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open fold

" ---------------
" mouse
" --------------- {{
set mouse=a                     " enable mouse
set mousehide                   " Hide mouse after chars typed
set mousemodel=popup            " the right mouse button causes a small pop-up menu to appear

" ---------------
" work with windows
" --------------- {{
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" }}

" ---------------
" reopen file on last known position
" --------------- {{
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
" }}

" ---------------
" easy editing .vimrc file
" --------------- {{
nmap <Leader>rc :source ~/.vimrc<CR>
nmap <Leader>rt :tabnew ~/.vimrc<CR>
nmap <Leader>re :e ~/.vimrc<CR>
" }}

" ---------------
" Apperance
"
" ---------------
set background=dark
colorscheme 256-jungle
set ruler                           " show the cursor position all the
set lazyredraw                      " Do not redraw the screen during


" -------------
"  lang
" -------------
set spelllang=pl,en_us
set spell


set backup        " keep a backup file
set backupdir=~/.vimbackup,/tmp
set directory=~/.vimbackup//,/tmp//


" Nerdcommenter ]<leader>ci
" Surround cs{[, ysiw], VS{ 
" Closetag <C-_>
" Indent guides ,ig
