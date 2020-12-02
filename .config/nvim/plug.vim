" === === PLUGINS === === "

call plug#begin('~/.vim/plugged')

" === Style === "
  let g:gruvbox_italic=1
Plug 'norcalli/nvim-colorizer.lua'
Plug 'skammer/vim-css-color'
Plug 'mhinz/vim-startify'                             " nice start when vim is called without file
Plug 'junegunn/goyo.vim'                              " distraction free writing in vim - Leader G or :Goyo
Plug 'junegunn/limelight.vim'                         " focus where you are and darkens the rest - Leader L or :Limelight!!
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/seoul256.vim'
" Plug 'franbach/miramare'

" === Features === "
Plug 'puremourning/vimspector'                          " Quoting parenthesing made simple - ysiw
Plug 'tpope/vim-surround'                          " Quoting parenthesing made simple - ysiw
Plug 'tpope/vim-commentary'                        " Comments - gc/gcc
Plug 'tpope/vim-unimpaired'
Plug 'preservim/nerdcommenter'
Plug 'justinmk/vim-sneak'                          " Jump to any location specified by two characters - s/S followed by 3 characters
  let g:sneak#label = 1
Plug 'christoomey/vim-tmux-navigator'                 " interaction with tmux - C-h/j/k/l
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }   " fuzzy file search
Plug 'junegunn/fzf.vim'                               " fuzzy file search - C-p
Plug 'junegunn/vim-peekaboo'                          " use  and @ in normal mode and C-t in insert mode to see registers
Plug 'mg979/vim-visual-multi', {'branch': 'master'}   " Multiple cursors C-n, C-up/down to create cursors and \\A to select all occurrences
Plug 'terryma/vim-expand-region'                      " Expand selection - +/_ 
Plug 'machakann/vim-highlightedyank'                  " highlight yanked text
Plug 'voldikss/vim-floaterm'                          " popup terminal - <A-t>
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}       " Ranger in vim supports C-T(open to tag) C-X(horizontal) /C-V(vertical) and q to close
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'sheerun/vim-polyglot'
Plug 'easymotion/vim-easymotion'
Plug 'cohama/lexima.vim'                              " auto close parenthesis
Plug 'vimwiki/vimwiki'
Plug 'AndrewRadev/tagalong.vim'                       " Rename closing tag automatically
Plug 'psliwka/vim-smoothie'                           " smooth scrool
Plug 'luochen1990/rainbow'                            " color blocks eg brackets curlies
let g:rainbow_active = 1

" === Git === "
Plug 'tpope/vim-fugitive'     " git wrapper
Plug 'tpope/vim-rhubarb'
Plug 'kdheepak/lazygit.nvim'
Plug 'rhysd/git-messenger.vim'
" Plug 'airblade/vim-gitgutter'  " git diff in the sign column

" === LSP === "

" = nvim = "
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
" Plug 'neovim/nvim-lsp'
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
" Plug 'nvim-lua/diagnostic-nvim'
" Plug 'nvim-lua/lsp-status.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
Plug 'nvim-lua/plenary.nvim'
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'liuchengxu/vista.vim'                        " list of symbols

" === TypeScript === "
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'mlaursen/vim-react-snippets'
" Plug 'SirVer/ultisnips'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main'  }
" Plug 'peitalin/vim-jsx-typescript'

call plug#end()

" === Automatically install === "
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
