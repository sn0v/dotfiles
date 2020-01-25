if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'wadackel/vim-dogrun'
call plug#end()

:set shell=/bin/zsh
:set number
:set ruler
:set autoindent
:set smartindent
:set shiftwidth=2
:colo dogrun
