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
