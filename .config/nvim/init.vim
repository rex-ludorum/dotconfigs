source ~/.config/.vimrc
set runtimepath^=~/.config/.vim runtimepath+=~/.config/.vim/after
let &packpath=&runtimepath

" fix running external commands
set shellcmdflag=-c
" remove the need to add quotes for external commands with ! like vim
set shellquote=\"

let g:python_recommended_style=0
