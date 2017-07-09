
"##################################################################[Plugin manager]
" http://www.cnblogs.com/songfy/p/5635757.html 
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/winmanager'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'kien/ctrlp.vim'
Plugin 'wincent/command-t'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'jiangmiao/auto-pairs'
Plugin 'minibufexpl.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'taglist.vim' 
Plugin 'scrooloose/nerdcommenter'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'portante/cscope'
Plugin 'tomasr/molokai'
Plugin 'yegappan/mru'
Plugin 'rking/ag.vim'
Plugin 'altercation/vim-colors-solarized'

Plugin 'Lokaltog/vim-distinguished'

"Plugin 'Valloric/YouCompleteMe' "NEED VIM8.0+ & PYTHON3.5+ support.
"Plugin 'vim/vim' "vim8.0+

call vundle#end()

filetype plugin indent on
"##################################################################[default value set]
set modelines=0
set backspace=2 "设置更好的删除
syntax on "语法高亮

autocmd InsertLeave * se nocul "用浅色高亮当前行
autocmd InsertEnter * se cul

set smartindent "智能对齐
"set autoindent "自动对齐
set confirm "在处理未保存或只读文件的时候，弹出确认框
set tabstop=4 "tab键的宽度
set softtabstop=4
set shiftwidth=4 "统一缩进为4
set expandtab "不要用空格替代制表符

set history=50  "历史纪录数
set hlsearch
set incsearch "搜素高亮,搜索逐渐高亮

set gdefault "行内替换
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1 "编码设置

set guifont=Menlo:h16:cANSI "设置字体
set langmenu=zn_CN.UTF-8
set helplang=cn  "语言设置

set ruler "在编辑过程中，在右下角显示光标位置的状态行
set laststatus=1  "总是显示状态行
set showcmd "在状态行显示目前所执行的命令，未完成的指令片段也会显示出来
set scrolloff=3 "光标移动到buffer的顶部和底部时保持3行的距离
set showmatch "高亮显示对应的括号
set matchtime=5 "对应括号高亮时间(单位是十分之一秒)
set autowrite "在切换buffer时自动保存当前文件
set wildmenu  "增强模式中的命令行自动完成操作
set linespace=2 "字符间插入的像素行数目
set whichwrap=b,s,<,>,[,] "开启normal 或visual模式下的backspace键空格键，
                          "左右方向键,insert或replace模式下的左方向键，右方向键的跳行功能

filetype plugin indent on "分为三部分命令:file on,file plugin on,file indent on 
                          "分别是自动识别文件类型, 用用文件类型脚本,使用缩进定义文件

set foldenable  "允许折叠
set cursorline "突出显示当前行
set magic  "设置魔术？神马东东
set ignorecase "搜索忽略大小写
"filetype on "打开文件类型检测功能

set foldmethod=syntax "使用语法高亮定义代码折叠: zc 折叠, zo 展开
set foldlevelstart=99 "打开文件是默认不折叠代码

set mouse= "鼠标默认值
set number "显示行号

behave mswin 


"reopening a file                                                                                                                                         
if has("autocmd")                                                                                                          
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif                             
endif 


"##################################################################[auto exec cmds]
"autocmd VimEnter * TagbarToggle "auto start cmd
"autocmd VimEnter * WMToggle "auto start cmd
"autocmd VimEnter * NERDTree "auto start cmd
"
"default themes
autocmd VimEnter * call UserFunctionSwitch(6)
"##################################################################[ctags]
" Press F5 to update make ctags.
" cd ~/.ctags
" ctags -R ${source_path}
"silent !~/.vim/shell/make-ctags.sh
let g:pwd = getcwd()
let g:Newpwd = getcwd()
"let g:Newpwd = substitute(g:pwd, $HOME, "", "")
let g:Newpwd = "~/.ctags/" . substitute(g:Newpwd, "/", "_", "g")

let settag = "set tags=" . g:Newpwd . "/tags"
"echo settag
exec settag

"set tags=~/.ctags/tags
"##################################################################[key map]
nmap 1 : bp <cr>
nmap 2 : bn <cr>
nmap <Leader>1 : bd <cr>
nmap <Leader>3 : PluginInstall <cr>

"行号切换
map <silent> <Leader><F2> : call UserFunctionSwitch(0) <CR>
"鼠标切换
nmap <silent> <F2> : call UserFunctionSwitch(1) <CR>

"neadtree
nmap <silent> <Leader><F3> : call UserFunctionSwitch(2) <CR>

"tagbarlist
nmap <silent> <F3> : call UserFunctionSwitch(3) <CR>

"mru, file open history record
nmap <silent> <Leader><F4> : call UserFunctionSwitch(4) <CR>

"file search
nmap <silent> <F4> : CtrlP <CR>

"make source tags
nmap <silent> <F5> : call UserFunctionSwitch(5) <CR>

"themes switch
nmap <silent> <Leader><F6> : call UserFunctionSwitch(6) <CR>

"buf exploler
nmap <silent> <F6> : call UserFunctionSwitch(7) <CR>

"ack search file & symbols
nmap <Leader>s : Ack <Space>
nmap <Leader>f : AckFile <Space>
nmap <Leader>q : q <CR>
nmap <Leader>qa : qall <CR>
nmap <Leader>wq : wq <CR>
nmap <Leader>w : w <CR>

nmap <Leader>rs : call LeaveHandler() <Space> 
"##################################################################[function]
let g:userFuncSwitch = 1
let g:line_number_show = 1
let g:mouse_enable = 1
let g:window_flag = 1
let g:MRU_flag = 0
let g:themes_flag = 1
let g:ctags = ""

function! UserFunctionSwitch(cmd)
let g:userFuncSwitch = a:cmd
exec ":syntax on"

if a:cmd == 0
    if g:line_number_show == 0
        set nu
        let g:line_number_show = 1
        echo 'Show line number!'
    else
        set nonu
        let g:line_number_show = 0
    endif
    return
endif

if a:cmd == 1
    if g:mouse_enable == 0
        let g:mouse_enable = 1
        set mouse=a
        echo 'enable mouse'
    else
        let g:mouse_enable = 0 
        set mouse=
        echo 'disable mouse'
    endif
    return
endif

if a:cmd == 2
    exec 'WMToggle'
    return
endif

if a:cmd == 3
    exec 'TagbarToggle'
    return
endif

if a:cmd == 4
    if g:MRU_flag == 0
        let g:MRU_flag = 1
        exec 'MRU'
    else
        let g:MRU_flag = 0
        exec 'MRU'
        exec 'q'
    endif
    return
endif

if a:cmd == 5
    let g:ctags = system("~/.vim/shell/make-ctags.sh " . shellescape(expand('%:h')))
    let execcmd = "set tags=" . g:ctags
    echo execcmd
    exec execcmd
    return
endif

if a:cmd == 6

    exec 'syntax enable'
    if g:themes_flag == 0
        let g:themes_flag = 1
        exec "colorscheme solarized"
        let g:molokai_original = 0
        let g:rehash256 = 0
        exec "set background=dark" 
        exec "set t_Co=32"
        return
    endif
    if g:themes_flag == 1
        let g:themes_flag = 2
        exec "colorscheme molokai"
        let g:molokai_original = 1
        let g:rehash256 = 1
        exec "set background=dark" 
        exec "set t_Co=256"
        return
    endif

    if g:themes_flag == 2
        let g:themes_flag = 3 
        let g:molokai_original = 0
        let g:rehash256 = 0
        exec "colorscheme default"
        exec "set background=light"
        exec "set t_Co=128"
        return
    endif

    if g:themes_flag == 3
        let g:themes_flag = 1 

        exec "set background=dark"
        exec "set t_Co=256"
        return
    endif
    return
endif

if a:cmd == 7
    exec 'ToggleBufExplorer'
    return
endif

endfunction

"##################################################################[TlistToggle,NERDTree]
:set hlsearch " 搜索默认高亮显示
let NERDTreeQuitOnOpen=1 "打开文件时关闭树
let NERDTreeShowBookmarks=1 "显示书签
let Tlist_Show_One_File = 1 " 不同时显示多个文件的 tag ，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1 " 如果 taglist 窗口是最后一个窗口，则退出 vim
let Tlist_Use_Right_Window = 1
let Tlist_Auto_Open = 0

"##################################################################[Ctrlp]
set rtp+=~/.vim/bundle/ctrlp.vim
:helptags ~/.vim/bundle/ctrlp.vim/doc
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'cra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.exe,*.tar,*.deb,*~,*.bak,*.ko,*.bin,*.img,*.apk

let g:ctrlp_regexp = 1
let g:ctrlp_use_caching = 1
let g:ctrlp_cache_dir = '/.cache/ctrlp'
let g:ctrlp_show_hidden = 0
"##################################################################[winManager]
let g:NERDTree_title="[NERDTree]"  
let g:winManagerWindowLayout='NERDTree'

function! NERDTree_Start()  
    exec 'NERDTree'  
endfunction  
  
function! NERDTree_IsValid()  
    return 1  
endfunction  

" NOTIC!!! modefiy WinManager.vim to fixed open empty file bug:
"function! <SID>ToggleWindowsManager()  
"   if IsWinManagerVisible()  
"      call s:CloseWindowsManager()  
"   else  
"      call s:StartWindowsManager()  
"      exe 'q'  " ADD THIS LINE!
"   end  
"endfunction  

"##################################################################[MiniBufExplorer]
let g:miniBufExplMapWindowNavVim = 1   
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=0 

"BufExplorer
set rtp+=~/.vim/bundle/bufexplorer
 
let g:bufExplorerShowRelativePath=0  " Show absolute paths.
let g:bufExplorerSortBy='extension'
let g:bufExplorerSortBy='fullpath'
let g:bufExplorerSortBy='mru'
let g:bufExplorerSortBy='name'
let g:bufExplorerSortBy='number' 

"nmap <silent> <s-F7> :BufExplorer<CR> 
"nmap <silent> <m-F7> :BufExplorerHorizontalSplit<CR>
"nmap <silent> <c-F7> :BufExplorerVerticalSplit<CR>
"##################################################################[SuperTab]
let g:SuperTabDefaultCompletionType="context" 

"##################################################################[TagbarToggle]
let g:tagbar_ctags_bin = 'ctags'  
let g:tagbar_width = 30 

"##################################################################[mru]
set rtp+=~/.vim/bundle/mru
let MRU_Max_Entries = 1000
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'  " For Unix
let MRU_Include_Files = '\.c$\|\.h$'
let MRU_Window_Height = 8
"let MRU_Use_Current_Window = 1
let MRU_Auto_Close = 0
let MRU_Max_Menu_Entries = 20

"##################################################################[auto-pairs]
set runtimepath^=~/.vim/bundle/auto-pairs
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'
set laststatus=2

"##################################################################[nerdcommenter]
"\cc 注释当前行和选中行  
"\cu 取消注释 
set rtp+=~/.vim/bundle/nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCompactSexyComs = 1

"##################################################################[ack]
set rtp+=~/.vim/bundle/ack.vim
let g:ackprg = '~/.vim/shell/xgrep' "find symbols and files.
let g:ack_autoclose = 1
let g:ackpreview = 1
let g:ackhighlight = 1
let g:ack_autofold_results = 0
let g:ack_lhandler = "botright lopen 8"
let g:ack_qhandler = "botright copen 8"

"##################################################################[resume history]


let g:AutoSessionFile = g:Newpwd . "/session.vim"
if(expand(g:AutoSessionFile) == findfile(expand(g:AutoSessionFile)))
    silent :!~/.vim/shell/copy.sh
    au VimEnter * source ~/.ctags/session.vim
    "echo 'seession:' g:AutoSessionFile
    exec ":syntax on"
endif

au VimLeave * call LeaveHandler()
function! LeaveHandler()
    let g:path = system("~/.vim/shell/get_path.sh " . shellescape(expand('%:h')))
    let execcmd = "mks! ". g:path
    echo execcmd
    exec execcmd
endfunction
