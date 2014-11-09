" The comment in vim start with a qoute.

" 开启文件类型插件
filetype plugin on
set nocp
" 语言环境
set encoding=utf-8
"langua message zh_CN.UTF-8
" 设置字符编码列表
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'taglist.vim'
Bundle 'TagHighlight'
Bundle 'winmanager'
Bundle 'scrooloose/syntastic' 
Bundle 'supertab'
Bundle 'minibufexpl.vim'
Bundle 'molokai'
"Bundle 'neocomplcache'
Bundle 'c.vim'
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'autocomplpop'
Bundle 'OmniCppComplete'
Bundle 'AuthorInfo'
Bundle 'echofunc.vim'
"Bundle 'Command-T'
Bundle 'dongwencai/crefvim'
Bundle 'dongwencai/colorscheme'
set guifontwide=新宋体:h14 " 设置中文的字体
" 设置英文的字体 :b加粗 :i斜体
set guifont=Bitstream_Vera_Sans_Mono:h14:cANSI:b

" 窗口切换重映射
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 将工作目录切换到当前文件.
"nnoremap cwd :cd %:p:h<CR>

" 恢复文件关闭之前光标位置
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 杂项设置
" =================================================================================================
syntax on						" 自动语法高亮
syntax enable						" 语法高亮

" 自动补全Ctrl+p时的一些选项：多于一项时显示菜单，最长选择，显示当前选择的额外信息
if v:version >= 700
	set completeopt=menu,longest,preview
endif

set formatoptions=tcqro					" 使得注释换行时自动加上前导的空格和星号
set history=200						" 设置冒号命令和搜索命令历史列表长度为50
set hlsearch						" 搜索时高亮显示被找到的文件
set ignorecase smartcase				" 搜索时忽略大小写，但有一个或以上大写字母仍保持对大小写敏感
filetype plugin indent on
set smartindent
set expandtab
set smarttab
set foldenable
set noswapfile
"set foldmethod=marker
"nnoremap <F2> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
nnoremap <F2> @=((foldclosed(line('.')) < 0) ? 'zf%' : 'zo')<CR>
set autoread
set incsearch						" 输入搜索内容时就显示搜索结果
" set nohlsearch					" 搜索时不高亮显示被找到的文本
set mouse=a						" 设定在任何模式下鼠标都可用
set nobackup						" 覆盖文件时不备份
set nocompatible					" 设定gvim运行在增强模式下(不兼容vi)
" set noignorecase					" 默认区分大小写
" set nolinebreak					" 在单词中间断行
" set scrolloff=5					" 设定光标离窗口上下边界5行时窗口自动滚动
set showcmd						" 在状态栏显示目录所执行的指定，未完成的指令片段也会显示出来
" set wrap						" 自动换行显示
set tabstop=4						" TAB键所表示的空格数(这个值只能管tab，不管缩进)
set shiftwidth=4					" 缩进所表示的空格数(不同于TAB，是利用>>缩进的大小，自动缩进也看这个值)
" set softtabstop=4					" 使得按退格键时可以一次删除4个空格
set autoindent						" 自动缩进
set ruler						" 标尺信息，显示光标在哪
set cindent						" C语言缩进风格
set number						" 显示行号( set nu )
set backspace=indent,eol,start				" 不设定的话在插入模式里无法使用退格键 delete和回车符等

" 突出显示当前行
:set cursorline
" 自动切换目录为当前文件所在的目录
"set autochdir

"设置命令行和状态栏
set cmdheight=1						" 设定命令行的行数为1
set laststatus=2					" 显示状态栏(默认值为1，无法显示状态栏)
" windows:  set statusline=%F%m%r,%Y,%{&fileformat}\\\ASCII=\%b,HEX=\%B\\\ %l,%c%V\ %p%%\\\[\%L\ lines\ in\ all\]
set statusline=%F%m%r\ ASCII=\%b,HEX=\%B,%l,%c%V\ %L-%p%%
        "设置在状态行显示的信息如下：
            "   %F              当前文件名
            "   %m              当前文件修改状态
            "   %r              当前文件是否只读
            "   %Y              当前文件类型
            "   %{&fileformat}  当前文件编码
            "   %b              当前光标处字符的ASCII码值
            "   %B              当前光标处字符的十六进制值
            "   %l              当前光标行号
            "   %c              当前光标列号
            "   %V              当前光标虚拟列号(根据字符所占字节数计算)
            "   %p              当前行占总行数的百分比
            "   %%              百分号
            "   %L              当前文件总行数
" =================================================================================================

" 配色方案
" =================================================================================================
" =================================================================================================
"set t_Co=256
colorscheme 256_jungle_modified             " 设置配色方案

" 设置nt调出窗口
nnoremap nt :NERDTreeToggle<CR>
let g:NERDTree_title="[NERD Tree]" 
let g:WC_min_len=3 " 当输入到第3个字母时才自动补全，自己可以改变之.

map ,tg :!ctags -R -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__ -I __wur --file-scope=yes --langmap=c:+.h --languages=c --links=yes --c-kinds=+p --fields=+iaS --extra=+q <CR>

highlight Pmenu    guibg=darkgrey  guifg=black
highlight PmenuSel guibg=lightgrey guifg=black
" 自动关闭补全窗口
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

" for TagList
" =================================================================================================
let Tlist_Ctags_Cmd='/usr/bin/ctags'  		" 设定ctags程序路径
let Tlist_Show_One_File=1             			" 不同时显示多个文件的tag，只显示当前文件的  
let Tlist_Exit_OnlyWindow=1           			" 如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window=1          			" 在右侧窗口显示taglist窗口
let Tlist_Use_SingleClick=1         			" 单击tag就跳转
" let Tlist_Auto_Open=1               			" 启动VIM自动打开taglist
" let Tlist_Close_On_Select=1         			" 选择tag后自动关闭taglist
let Tlist_File_Fold_Auto_Close=1    			" 多文件时只显示当前文件的tag，其它的tag折叠
let Tlist_WinHeight=200						" taglist窗口高度
let Tlist_WinWidth=30							" taglist窗口宽度
" let Tlist_Use_Horiz_Window=1					" 设置taglist窗口横向显示
" 设置tl调出taglist
nnoremap tl :Tlist<CR>

"映射F8打开关闭taglist窗口
map <expr> <F8> bufloaded("__Tag_List__")?"q":":TlistOpen\<cr>"   
" =================================================================================================
"nmap <silent> ,tg :!ctags -R --fields=+lS<cr><cr>
"vmap <silent> ,tg :!ctags -R --fields=+lS<cr><cr>
"nmap ,ts :!ctags -Rn --c++-kinds=+p --fields=+ialS --extra=+q -o ~/.vim/systags /usr/include /usr/local/include<cr><cr>
set tags+=$HOME/.vim/systags
nmap ,ts :!ctags -I __THROWNL -I -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__ -I __wur --file-scope=yes --langmap=c:+.h --languages=c --links=yes --c-kinds=+p --fields=+iaS --extra=+q  -o ~/.vim/systags /usr/include/* /usr/include/sys/* /usr/include/bits/*  /usr/include/netinet/* /usr/local/include<cr><cr>

if has("cscope")
    set csprg=/usr/bin/cscope " 指定用来执行cscope的命令
    set csto=0 " 设置cstag命令查找次序：0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库
    set cst " 同时搜索cscope数据库和标签文件
    "set cscopequickfix=s-,c-,d-,i-,t-,e- " 使用QuickFix窗口来显示cscope查找结果
    set nocsverb
    if filereadable("cscope.out") " 若当前目录下存在cscope数据库，添加该数据库到vim
        cs add cscope.out
    elseif $CSCOPE_DB != "" " 否则只要环境变量CSCOPE_DB不为空，则添加其指定的数据库到vim
        cs add $CSCOPE_DB
    endif
    set csverb
endif
cs add /usr/include/cscope.out /usr/include    
" 0 / s 查找本符号(symbols)
map <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
" 1 / g 查找本定义
" 2 / d 查找本函数调用的函数
map <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
" 3 / c 查找调用本函数的函数(call)
map <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
" 4 / t 查找本字符串(text)
map <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
" 6 / e 查找egrep模式
map <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
" 7 / f 查找本文件
map <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
" 8 / i 查找包含本文件的文件(include)
map <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
" =================================================================================================
nmap co :copen<CR>
nmap cc :close<CR>

set pastetoggle=<F>

let g:indent_guides_guide_size=1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 
let g:miniBufExplorerMoreThanOne=0
let g:SrcExpl_isUpdateTags = 0
autocmd FileType c,cpp,h set shiftwidth=4 | set expandtab
let g:winManagerWindowLayout='FileExplorer|TagList'
let g:persistentBehaviour=0
nmap wm :WMToggle<CR>
let  mapleader=','
nmap <C-z> :FufCoverageFile<CR>
let g:neocomplcache_enable_at_startup = 1 
let g:vimrc_author='dongwencai'
let g:vimrc_email='mrdong0826@gmail.com'
let g:vimrc_homepage='null' 
nmap <F7> :AuthorInfoDetect<cr> 
"YCM
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'  
"let g:ycm_collect_identifiers_from_tags_files = 1  
"let g:ycm_seed_identifiers_with_syntax = 1  
"let g:ycm_confirm_extra_conf = 0 
"
let g:syntastic_check_on_open = 1  
let g:syntastic_cpp_include_dirs = ['/usr/include/']  
let g:syntastic_cpp_remove_include_errors = 1  
let g:syntastic_cpp_check_header = 1  
let g:syntastic_cpp_compiler = 'clang++'  
"set error or warning signs  
let g:syntastic_error_symbol = 'x'  
let g:syntastic_warning_symbol = '!'  
"whether to show balloons  
let g:syntastic_enable_balloons = 1  
