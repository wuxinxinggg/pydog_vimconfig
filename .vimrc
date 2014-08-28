set nocp
set nocompatible
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

"设置使用C/C++自动缩进
set cindent                           
set nobackup                       
set clipboard+=unnamed
" set fdm=syntax "代码折叠
set t_Co=256
colorscheme desert
filetype plugin indent on
syntax on
"set fileencodings=utf-8,chinese,latin-1
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"configure tags - add additional tags here or comment out not-used ones
"set tags+=~/.vim/tags/cpp
"set tags+=./vimtags

"Map key of switching between buffer
map <tab> :bn<cr>
map <s-tab> :bp<cr>

"Highlight current line
"GUI Mode
"
set cursorline
hi CursorLine  gui=underline,bold,standout guibg=NONE guifg=NONE
hi CursorColumn gui=underline,bold,standout guibg=NONE guifg=NONE

"Cterm Mode
"set cursorline
"hi CursorLine  cterm=underline,bold ctermbg=darkred ctermfg=white
"hi CursorColumn cterm=underline,bold ctermbg=darkred ctermfg=white
"
"End Highlight current line

"Highlight search result
set hls

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"               cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
    set csprg=/usr/bin/cscope

    "search cscope file first,then tags file ,if csto=1, reversed
    set csto=0

    "search in both  tags files and cscope 
    set cst 

    "no verbose if add cscope database failed!
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    "no verbose if add cscope database failed!
    set csverb
endif

nmap <C-e>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-e>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-e>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-e>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-e>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-e>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-e>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-e>d :cs find d <C-R>=expand("<cword>")<CR><CR>


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


" taglist
"let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
"let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Inc_Winwidth=0			   "如果在文本界面下运行vim,则将窗口长度设为0
"let Tlist_Auto_Open=1				   "自动打开Tlist
"let Tlist_Use_Right_Window=1
" 设置Tlist快捷键
"map <C-l> :TlistToggle<CR>
"map <C-l> :Tlist<CR>



"automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

"插入模式下方框变成光标
if has("autocmd")
	au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
	au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
endif

"插件安装管理
call pathogen#infect()

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
"               CtrlP setting
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! QFSwitch()
	redir => ls_output
	execute ':silent! ls'
	redir END

	let exists = match(ls_output, "[Quickfix List")
	if exists == -1
		execute ':copen'
	else
		execute ':cclose'
		execute ':TrinityToggleAll'
		execute ':TrinityToggleAll'
	endif
endfunction

map <C-o> <ESC>:call QFSwitch()<CR>

" Open and close all the three plugins on the same time 
nmap <F7>   :TrinityToggleAll<CR> 

" Open and close the srcexpl.vim separately 
nmap <F8>   :TrinityToggleSourceExplorer<CR> 

" Open and close the taglist.vim separately 
nmap <F9>  :TrinityToggleTagList<CR> 

" Open and close the NERD_tree.vim separately 
nmap <F10>  :TrinityToggleNERDTree<CR> 










""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"               OmniCppComplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]







""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"               Ctags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" build tags of your own project with Ctrl-F12
"map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q.<CR>
map <C-F12> :!ctags -R --sort=yes --c-kinds=+p --fields=+aS --extra=+q<CR>

"back to tag
map <C-g> :tag<CR>







""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       Double tab show Doc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview









