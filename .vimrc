""""OFRADES""""

if empty(glob('~/.vim/autoload/plug.vim'))
silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""""PLUGINS""""
source ~/.config/nvim/.plugins.vim

""""LSP""""
source ~/.config/nvim/.nvim-lsp.vim

""""TREESITTER""""
source ~/.config/nvim/.treesitter.vim

""""MAPS""""
source ~/.config/nvim/.maps.vim

""""SETTINGS""""
source ~/.config/nvim/.settings.vim

""""STATUS LINE""""
source ~/.config/nvim/.statusline.vim

""""FZF""""
source ~/.config/nvim/.fzf.vim
