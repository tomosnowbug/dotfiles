

"
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neo Bundle 
set nocompatible
filetype off


if has('vim_starting')
	if has("win32") || has("win64")
		" windows環境でもスクリプトを.vimから読み込む
		set runtimepath+=$HOME/.vim,$HOME/.vim/after
	endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#begin(expand('~/.vim/bundle/'))
endif
let g:neobundle_default_git_protocol='https'

""""""""""""""""""""""""""""""""""""""""""""""""""""
" その他
" vimprocのビルドをWindowsで行うときはMinGW/Msysが必要。PATHを通す
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'gmake',
      \     'linux' : 'make',
      \    },
      \ }
NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'ruby-matchit'
NeoBundle 'vim-scripts/dbext.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'The-NERD-tree'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/vimfiler'
"NeoBundle 'grep.vim'
"NeoBundle 'gtags.vim'
NeoBundle 'https://github.com/LeafCage/foldCC.git'
NeoBundle 'Shougo/unite-outline.git'
NeoBundle 'istepura/vim-toolbar-icons-silk'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'itchyny/landscape.vim'
"  let g:Powerline_theme = 'landscape'
"  let g:Powerline_colorscheme = 'landscape'
"  let g:airline_theme = 'landscape'

"NeoBundle 'bling/vim-airline'
"  let g:airline_enable_branch = 0
"  let g:airline_section_b = "%t %M"
"  let g:airline_section_c = ''
"  let s:sep = " %{get(g:, 'airline_right_alt_sep', '')} "
"  let g:airline_section_x =
"        \ "%{strlen(&fileformat)?&fileformat:''}".s:sep.
"        \ "%{strlen(&fenc)?&fenc:&enc}".s:sep.
"        \ "%{strlen(&filetype)?&filetype:'no ft'}"
"  let g:airline_section_y = '%3p%%'
"  let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
"  let g:airline#extensions#whitespace#enabled = 0

" 補完
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
"NeoBundle 'taichouchou2/vim-rsense'

" コメント
NeoBundle 'tomtom/tcomment_vim'
"NeoBundle 'taichouchou2/surround.vim'

"
"
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'sudo.vim'
NeoBundle 'https://github.com/tpope/vim-markdown.git'
NeoBundle 'anekos/char-counter-vim'
NeoBundle 'kien/ctrlp.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call neobundle#end()

filetype plugin on
filetype indent on
syntax enable
syntax on

NeoBundleCheck

"cygwin環境での色設定用。winxpで必要かも？
if has("win32unix")
	"set term=xterm-256
	set t_Co=256
endif

colorscheme landscape

set encoding=utf-8
set ffs=unix
set fileencodings=utf-8,cp932,euc-jp


if has("win32") || has("win64")

  let $PATH="C:\\cygwin\\bin;".$PATH
"  echomsg $PATH
  "set grepprg=grep\ -nH

"    echomsg "shll is bash"
"    set shell=$COMSPEC " sets shell to correct path for cmd.exe


endif

"mouse
set mouse=a
" ヤンクをクリップボードへ送り込む
set clipboard+=unnamed

" ステータスエリア関係
"ステータスのところにファイル情報表示
"set statusline=%<[%n]%F%=\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ %l,%c\ %P 

"ルーラーを表示
set ruler
set title
set nowrap
set nobackup
set backupcopy=yes
set noswapfile
"set list
set cursorline
set tabstop=4
set shiftwidth=4
set autoindent
set scrolloff=10
set number

"IME起動しない
set iminsert=0
set imsearch=-1

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPPINGS...
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ウィンドウ移動系
nnoremap <space>j <C-W>j
nnoremap <space>k <C-W>k
nnoremap <space>h <C-W>h
nnoremap <space>l <C-W>l
"nnoremap <space>+ <C-W>5+
"nnoremap <space>- <C-W>5-
"nnoremap <space>> <C-W>3>
"nnoremap <space>< <C-W>3<


"バッファ
nnoremap <Space>b :ls<CR>:buffer 
nnoremap <Space>f :edit .<CR>
nnoremap <Space>v :vsplit<CR><C-w><C-w>:ls<CR>:buffer
nnoremap <Space>s :split<CR><C-w><C-w>:ls<CR>:buffer
nnoremap <Space>V :Vexplore!<CR><CR>
nnoremap <C-TAB> <C-w>w
nnoremap <C-w> :clo<CR> 

"other <space> combi keys..
nnoremap <space>r :source ~/_vimrc .<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""
" neocomplcache 
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplcache_enable_at_startup = 1            "NeoComplcacheを自動起動する
let g:neocomplcache_enable_smart_case = 1            "大文字が入力されるまで大小を無視する
let g:neocomplcache_enable_underbar_completion = 1   "_(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_camel_case_completion = 1 "キャメルケース区切りの補完を有効化
let g:neocomplcache_max_list = 20                    "ポップアップメニューの表示候補数
let g:neocomplcache_min_syntax_length = 3            "シンタックスキャッシュの最小文字長
"" Tabで補完候補の選択を行う
inoremap <expr><TAB>   pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>"   : "\<S-TAB>"
"" 改行、削除キーで補完ウィンドウを閉じる

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " For no inserting <CR> key.
  return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
"inoremap <expr><CR>  neocomplcache#close_popup() . "\<Space>"
"inoremap <expr><C-h> neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr><BS>  neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()  " 選択候補を確定する
inoremap <expr><C-e> neocomplcache#cancel_popup() " 選択候補をキャンセルする
" <ctrl-space>: completion.
inoremap <expr><C-SPACE> pumvisible() ? 
			\ "\<Down>" : neocomplcache#start_manual_complete() 
" END NeoComplcache

:

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" for Rsence.
""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rsenseHome = expand('C:/Langs/rsense-0.3')
let g:rsenseUseOmniFunc = 1
"if !exists('g:neocomplcache_omni_functions')
"  let g:neocomplcache_omni_functions = {}
"endif
"let g:neocomplcache_omni_functions.ruby = 'RSenseCompleteFunction'

"if !exists('g:neocomplcache_omni_patterns')
"  let g:neocomplcache_omni_patterns = {}
"endif
"  let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'



"""""""""""""""""""""""""""""""""""""""""""""""""""""
" unite.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" インサート／ノーマルどちらからでも呼び出せるようにキーマップ
nnoremap <silent> <C-u><C-u> :<C-u>UniteWithBufferDir -buffer-name=Anyting... buffer file_mru bookmark file<CR>
inoremap <silent> <C-u><C-u> <ESC>:<C-u>UniteWithBufferDir -buffer-name=Anyting... buffer file_mru bookmark file<CR>
nnoremap <silent> <C-u><C-b> :<C-u>Unite buffer -buffer-name=Buffer...<CR>
nnoremap <silent> <C-u><C-r> :<C-u>Unite register -buffer-name=Register...<CR>

" unite.vim上でのキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " 横分割で開く
  nmap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  imap <silent> <buffer> <expr> <C-j> unite#do_action('split')
  " 縦分割で開く
  nmap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  imap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
  " 単語単位からパス単位で削除するように変更
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  " c-jはescとする
  nnoremap <silent> <buffer> <c-j> <esc><CR>
  " ESCキーを2回押すと終了する
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction

" unite-outline
nnoremap <space>o :<C-u>Unite -no-quit -vertical -winwidth=30 outline<CR>
let g:unite_split_rule = "rightbelow"


"""""""""""""""""""""""""""""""""""""""""""""""""""""
" t-comment
""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-/> <C--><C-->
imap <C-/> <C--><C-->



"""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree "
""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <space>t :NERDTreeToggle<CR>
nmap <space>tc :NERDTree c:/<CR>
nmap <space>td :NERDTree c:/Documents\ and\ Settings/zztsasaki3/デスクトップ/<CR>
nmap <space>tw :NERDTree d:/Working/<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""
" refe
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ref_refe_cmd = 'c:/Langs/ruby-refm-1.9.3-dynamic-20120829/refe-1_9_3'


"""""""""""""""""""""""""""""""""""""""""""""""""""""
" quickrun
"""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:quickrun_config = {}
let g:quickrun_config._ = {'runner' : 'vimproc'}

"""""""""""""""""""""""""""""""""""""""""""""""""""""
":Grep
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"command! -complete=file -nargs=+ Grep call s:grep([<f-args>])
"function! s:grep(args)
"    let target = len(a:args) > 1 ? join(a:args[1:]) : '**/*'
"    execute 'vimgrep' '/' . a:args[0] . '/j ' . target
"    if len(getqflist()) != 0 | copen | endif
"endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldtext=FoldCCtext()
set foldmethod=syntax
set fillchars=vert:\|
set foldcolumn=5
set foldlevel=5
"hi Folded gui=bold term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=Grey30 guifg=Grey80
"hi FoldColumn gui=bold term=standout ctermbg=LightGrey ctermfg=DarkBlue guibg=Grey guifg=DarkBlue

"TODO: zR/zM

"inoremap F <C-O>za
nnoremap F za
onoremap F <C-C>za
vnoremap F zf


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline.vim {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
if ! empty(neobundle#get("lightline.vim"))
  let g:lightline = {
    \"colorscheme": "jellybeans",
    \"active": {
      \"left": [["mode", "filename"], ["fugitive"]],
      \"right": [["charcounter"], ["lineinfo"], ["fileinfo"] ]},
    \"component_visible_condition": {
      \"fugitive": '(exists("*fugitive#head") && ""!=fugitive#head())'},
    \'component_function': {
      \'mode': 'MyMode',
      \'filename': 'MyFileName',
      \'fugitive': 'MyFugitive',
      \'fileinfo': 'MyFileInfo',
      \'lineinfo': 'MyLineInfo',
      \'charcounter': 'MyCharCount'
      \},
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \}

  let g:lightline.inactive = g:lightline.active

  function! MyCharCount()
	  return  AnekoS_CharCounter_CharCount() . " char"
	  "return b:charCounterCount
  endfunction

  function! MyMode()
    let l:ps = ''
    if &paste
      let l:ps = " P"
    endif
    return lightline#mode() . l:ps
  endfunction

  function! MyFileName()
    let l:fn = expand("%:t")
    let l:ro = &ft !~? 'help' && &readonly ? " RO" : ""
    let l:mo = &modifiable && &modified ? " +" : ""
    return l:fn . l:ro . l:mo
  endfunction

  function! MyFugitive()
    let l:fu = exists('*fugitive#head') ? fugitive#head() : ''
    return winwidth('.') >=
          \  strlen(MyMode()) + 2
          \+ strlen(MyFileName()) + 2
          \+ strlen(l:fu) + 2
          \+ strlen(MyLineInfo()) + 2
          \? l:fu : ''
  endfunction

  function! MyFileInfo()
    let l:ff = &fileformat
    let l:fe = (strlen(&fenc) ? &fenc : &enc)
    let l:ft = (strlen(&filetype) ? &filetype : 'no')
    let l:fi = l:ff . " " . l:fe . " " . l:ft
    return winwidth('.') >=
          \  strlen(MyMode()) + 2
          \+ strlen(MyFileName()) + 2
          \+ strlen(MyFugitive())
          \+ ((exists("*fugitive#head") && ""!=fugitive#head()) ? 2 : 0)
          \+ strlen(l:fi) + 2
          \+ strlen(MyLineInfo()) + 2
          \? l:fi : ''
  endfunction

  function! MyLineInfo()
    let l:cl = line(".")
    let l:ll = line("$")
    let l:cc = col(".")
    let l:li = printf("%4d/%d:%3d", l:cl, l:ll, l:cc)
    return winwidth('.') >=
          \  strlen(MyFileName()) + 2
          \+ strlen(l:li) + 2
          \? l:li : ''
  endfunction
endif
"}}} lightline.vim


""""""
" vim-quickrun
"RSpec対応
let g:quickrun_config = {}
let g:quickrun_config._ = {'runner' : 'vimproc'}
let g:quickrun_config['ruby.rspec'] = { 'command': 'rspec', 'cmdopt': 'bundle exec', 'exec': '%o %c %s' }
augroup RSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END



""""
" vim indent 
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=236
hi IndentGuidesEven ctermbg=234
"
"

""" ruby,html for tab=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab





