set nocp
set nocompatible
syntax on

"插件安装管理
call pathogen#infect()

"设置行号
set number
set showmatch
set ruler
set incsearch

"设置自动缩进
set autoindent

"设置空格代替tab
set expandtab

"设置制表符宽度为4
set tabstop=4

"设置缩进的空格数为4
set shiftwidth=4
set softtabstop=4

map <C-i> :bp<CR>
map <C-o> :bn<CR>




"设置使用C/C++自动缩进
set cindent                           
set nobackup                       
set clipboard+=unnamed


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"               Filetype setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on

" C和C++文件代码自动折叠









"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"               colorscheme setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
let g:solarized_termcolors=256
set background=dark
"set background=light
colorscheme solarized
"colorscheme desert

"Highlight current line
if has('gui_running')
"GUI Mode
set cursorline
hi CursorLine  gui=bold,standout guibg=NONE guifg=NONE
hi CursorColumn gui=bold,standout guibg=NONE guifg=NONE
else
"Cterm Mode
set cursorline
hi CursorLine  cterm=underline,bold,standout ctermbg=NONE    ctermfg=NONE
hi CursorColumn cterm=underline,bold,standout ctermbg=NONE   ctermfg=NONE
endif
"End Highlight current line

"set fileencodings=utf-8,chinese,latin-1
set fenc=gb2312
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"configure tags - add additional tags here or comment out not-used ones
"set tags+=~/.vim/tags/cpp
"set tags+=./vimtags


"Highlight search result
set hls





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  Marks setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mwAutoLoadMarks = 1
nmap <C-\> :Mark <C-R>=expand("<cword>")<CR><CR>









"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                  NerdCommenter setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nmap <C-/> :cs find s <C-R>=expand("<cword>")<CR><CR>
let mapleader=","  





"automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

"文件打开插件
"map <C-t> :NERDTreeMirror<CR>
"map <C-t> :NERDTreeToggle<CR>

"SrcExpl
"nmap <F8> :SrcExplToggle<CR>    "快捷键映射
"let g:SrcExpl_winHeight = 8     "默认高度
"let g:SrcExpl_refreshTime = 100 "更新时间(ms)
"let g:SrcExpl_isUpdateTags = 0  "每次打开SrcExpl时是否更新tags(0为不更新)
"let g:SrcExpl_updateTagsKey = "<F12>"   "更新tags的快捷键
"let g:SrcExpl_jumpKey = "<ENTER>"
"let g:SrcExpl_gobackKey = "<SPACE>"

"let g:SrcExpl_pluginList = [
"       \ "__Tag_List__",
"       \ "_NERD_tree_",
"       \ "Source_Explorer"
"   \ ]
"映射光标在窗口间移动的快捷键
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Ag setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ackprg = 'ag --nogroup --nocolor --column'








"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   CtrlP setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"the directory with ctags is the mark of root directory
let g:ctrlp_root_markers = ['tags']
let g:ctrlp_working_path_mode = 'raw'

" Enable cache
let g:ctrlp_clear_cache_on_exit = 1
" Cache directory
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

" map key to run CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>pt :CtrlPTag<CR>
nnoremap <leader>pr :CtrlPMRUFiles<CR>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command='ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching=0
endif






""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F9> :TagbarToggle<CR>
" autoclose tagbar
let g:tagbar_autoclose = 1

" autofocus when open tagbar
let g:tagbar_autofocus = 1

let g:tagbar_left = 1







""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   NerdTree-ag setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F10>  :NERDTreeFocus<CR> 

let NERDTreeHighlightCursorline=1
"打开文件时关闭树
let NERDTreeQuitOnOpen=1 
let NERDTreeWinSize=40
let NERDTreeWinPos = "right"







""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   SrcExpl.vim setting 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open and close the srcexpl.vim separately 
nmap <F8>   :SrcExplToggle<CR> 





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Ctags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" build tags of your own project with Ctrl-F12
"map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q.<CR>
"map <C-F12> :!ctags -R --sort=yes --c-kinds=+p --fields=+aS --extra=+q<CR>

"back to tag
"map <C-g> :tag<CR>







""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   showmarks setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable ShowMarks
let showmarks_enable = 1
" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 0
let showmarks_hlline_upper = 0 




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   markbrowser setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>mk :MarksBrowser<cr> 







""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   vim-multiple-cursors setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   YouCompleteMe setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" g:syntastic_warning_symbol 和 g:syntastic_error_symbol 这两个为准  
let g:ycm_error_symbol='>>'  
let g:ycm_warning_symbol='>*'

"设置跳转的快捷键，可以跳转到definition和declaration  
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>  
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>  
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>  
nmap <F4> :YcmDiags<CR> 
"开启基于tag的补全，可以在这之后添加需要的标签路径
"let g:ycm_collect_identifiers_from_tags_files = 1
"开启语义补全  
let g:ycm_seed_identifiers_with_syntax = 1  
"在接受补全后不分裂出一个窗口显示接受的项  
set completeopt-=preview  
"不显示开启vim时检查ycm_extra_conf文件的信息  
let g:ycm_confirm_extra_conf=0  
"每次重新生成匹配项，禁止缓存匹配项  
let g:ycm_cache_omnifunc=0  
"在注释中也可以补全  
let g:ycm_complete_in_comments=1  

" 引入，可以补全系统，以及python的第三方包
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py"
"直接触发自动补全
let g:ycm_key_invoke_completion = ''
    
"不要使用syntastic检查，不然很gcc编译的工程会很慢
let g:ycm_register_as_syntastic_checker = 1





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   Airline setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tmuxline_theme = 'luna'
set laststatus=2






""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   octopress-vim setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.markdown setfiletype octopress



