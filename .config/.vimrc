" syntax highlighting
syntax on

" enable file type detection
filetype on

" use tab characters rather than spaces
set noexpandtab

" show line numbers
set number

" highlight the cursor's column and underline its line
set cursorline
set cursorcolumn

" two-space tabs
set tabstop=2

" two-space indents
set shiftwidth=2

" no backup files
set nobackup

" don't wrap lines
set nowrap

" incremental search
set incsearch

" don't ignore case
set noignorecase

" use highlighting
set hlsearch

" 1000-line history
set history=1000

" show current mode of operation (INSERT, VISUAL, etc.)
set showmode

" cursor will briefly jump to matching open paren when typing closing paren
set showmatch

" backspace doesn't work in insert mode without this
set backspace=indent,eol,start

" automatically indent when creating new lines
set smartindent

" use .config folder for vim runtime and packages
set runtimepath=~/.config/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.config/.vim/after
set packpath=~/.config/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.config/.vim/after

" looks best with flux
colorscheme torte

" show line number and character position
set ruler

" torte color scheme causes line to be highlighted rather than underlined
" this changes it back to an underline
hi clear CursorLine
hi CursorLine gui=underline cterm=underline

" use block cursor (for nvim)
set guicursor=n-v-c-i:block

" nvim breaks cursor blink settings from mintty on windows, so set it here
set guicursor=n-v-c-i:blinkwait0-blinkon500-blinkoff500
