set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

augroup ReactFiletypes
    autocmd!
      autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
        autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
      augroup END
    augroup END
