set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

call plug#begin('~/.vim/plugged')

Plug 'maralla/completor.vim'

Plug 'davidhalter/jedi-vim'

let g:completor_python_binary = '/usr/local/opt/python/libexec/bin/python'
let g:jedi#use_tabs_not_buffers = 1

let g:completor_python_binary = '/usr/bin/clang'

call plug#end()
