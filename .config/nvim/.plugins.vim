""""PLUGINS""""

call plug#begin('~/.vim/plugged')

" Style
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
  let g:gruvbox_italic=1
Plug 'ap/vim-css-color'                               " show color preview
Plug 'mhinz/vim-startify'                             " nice start when vim is called without file
Plug 'junegunn/goyo.vim'                              " distraction free writing in vim - Leader G or :Goyo
Plug 'junegunn/limelight.vim'                         " focus where you are and darkens the rest - Leader L or :Limelight!!

" Features
Plug 'tpope/vim-surround'                          " Quoting parenthesing made simple - ysiw
Plug 'tpope/vim-commentary'                        " Comments - gc/gcc
Plug 'justinmk/vim-sneak'                          " Jump to any location specified by two characters - s/S followed by 3 characters
  let g:sneak#label = 1
Plug 'christoomey/vim-tmux-navigator'                 " interaction with tmux - C-h/j/k/l
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }   " fuzzy file search
Plug 'junegunn/fzf.vim'                               " fuzzy file search - C-p
Plug 'junegunn/vim-peekaboo'                          " use  and @ in normal mode and C-t in insert mode to see registers
Plug 'mg979/vim-visual-multi', {'branch': 'master'}   " Multiple cursors C-n, C-up/down to create cursors and \\A to select all occurrences
Plug 'terryma/vim-expand-region'                      " Expand selection - +/_ 
Plug 'machakann/vim-highlightedyank'                  " highlight yanked text
Plug 'voldikss/vim-floaterm'                          " popup terminal - F4
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}       " Ranger in vim supports C-T(open to tag) C-X(horizontal) /C-V(vertical) and q to close
Plug 'SirVer/ultisnips'
" Git 
Plug 'tpope/vim-fugitive'     " git wrapper
Plug 'airblade/vim-gitgutter'  " git diff in the sign column
Plug 'junegunn/gv.vim'        " commit window - :GV open commit browser, :GV! commits affected current file
Plug 'jreybert/vimagit'       " git workflow in new buffer - :Magit

" Languages
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'

Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
" source ~/.config/nvim/.omnisharp.vim     " OmniSharp
" source ~/.config/nvim/.coc.vim             " options for coc.nvim
Plug 'liuchengxu/vista.vim'                        " list of symbols

" Keymaps
Plug 'liuchengxu/vim-which-key'       " menu

call plug#end()
