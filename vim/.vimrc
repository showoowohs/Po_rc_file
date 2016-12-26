set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Po add
execute pathogen#infect()
colorscheme ansi_blows

set t_Co=256
set nu
set backspace=2
set ls=2
set statusline=%<%f\ %m%=\ %h%r\ %-19([%p%%]\ %3l,%02c%03V%)%y
highlight StatusLine term=bold,reverse cterm=bold,reverse
syntax on
let g:gitgutter_avoid_cmd_prompt_on_windows = 0
set relativenumber

"Po end

" taglist setting
" Open and close all the three plugins on the same time
nnoremap <silent> <F7> :TrinityToggleAll<CR>
" Open and close the srcexpl.vim separately
nnoremap <silent> <F9> :TrinityToggleSourceExplorer<CR>
" Open and close the taglist.vim separately
nnoremap <silent> <F10> :TrinityToggleTagList<CR>
" Open and close the NERD_tree.vim separately
nnoremap <silent> <F12> :TrinityToggleNERDTree<CR>
" Open NERDTree
nnoremap <silent> <F5> :NERDTree<CR>

"set mouse=nv
" taglist setting end

" cscope setting
if filereadable("cscope.out") 
	cs add cscope.out 
endif 

if has("cscope")
	set cscopetag   " support use Ctrl+] and Ctrl+t jump to function
	" check cscope for definition of a symbol before checking ctags:
	" set to 1 if you want the reverse search order.
	set csto=1

	" add any cscope database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
		" else add the database pointed to by environment variable
	elseif $CSCOPE_DB !=""
		cs add $CSCOPE_DB
	endif
	" show msg when any other cscope db added
	set cscopeverbose

	nmap <C-/>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-/>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-/>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-/>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-/>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-/>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-/>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-/>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif
" cscope setting end
