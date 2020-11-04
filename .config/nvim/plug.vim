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
" Plug 'junegunn/seoul256.vim'
" Plug 'morhetz/gruvbox'
" Plug 'franbach/miramare'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'flrnd/candid.vim'
" Plug 'vim-airline/vim-airline'

" === Features === "
Plug 'puremourning/vimspector'                          " Quoting parenthesing made simple - ysiw
Plug 'tpope/vim-surround'                          " Quoting parenthesing made simple - ysiw
Plug 'tpope/vim-commentary'                        " Comments - gc/gcc
Plug 'tpope/vim-unimpaired'
Plug 'brooth/far.vim'
Plug 'preservim/nerdcommenter'
" Plug 'romgrk/barbar.nvim'
Plug 'justinmk/vim-sneak'                          " Jump to any location specified by two characters - s/S followed by 3 characters
  let g:sneak#label = 1
Plug 'christoomey/vim-tmux-navigator'                 " interaction with tmux - C-h/j/k/l
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }   " fuzzy file search
Plug 'junegunn/fzf.vim'                               " fuzzy file search - C-p
Plug 'junegunn/vim-peekaboo'                          " use  and @ in normal mode and C-t in insert mode to see registers
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}   " Multiple cursors C-n, C-up/down to create cursors and \\A to select all occurrences
Plug 'terryma/vim-expand-region'                      " Expand selection - +/_ 
Plug 'machakann/vim-highlightedyank'                  " highlight yanked text
Plug 'voldikss/vim-floaterm'                          " popup terminal - F4
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}       " Ranger in vim supports C-T(open to tag) C-X(horizontal) /C-V(vertical) and q to close
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'sheerun/vim-polyglot'
Plug 'easymotion/vim-easymotion'
Plug 'cohama/lexima.vim'
Plug 'vimwiki/vimwiki'
Plug 'AndrewRadev/tagalong.vim'
Plug 'psliwka/vim-smoothie'
Plug 'mattn/vim-gist'

" === Git === "
Plug 'tpope/vim-fugitive'     " git wrapper
Plug 'kdheepak/lazygit.nvim'
Plug 'tpope/vim-rhubarb'
Plug 'rhysd/git-messenger.vim'
Plug 'airblade/vim-gitgutter'  " git diff in the sign column
Plug 'junegunn/gv.vim'        " commit window - :GV open commit browser, :GV! commits affected current file
Plug 'jreybert/vimagit'       " git workflow in new buffer - :Magit
Plug 'luochen1990/rainbow'
Plug 'lambdalisue/gina.vim'
let g:rainbow_active = 1

" === LSP === "

" = vim = "
" Plug 'prabirshrestha/vim-lsp'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'mattn/vim-lsp-settings'

" = nvim = "
" Plug 'neovim/nvim-lsp'
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
" Plug 'nvim-lua/diagnostic-nvim'
" Plug 'nvim-lua/lsp-status.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'
Plug 'nvim-lua/plenary.nvim'
Plug 'tjdevries/express_line.nvim'
" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'OmniSharp/omnisharp-vim'                         " coc-omnisharp does not yet have this fixed
" Plug 'w0rp/ale'
Plug 'Shougo/echodoc.vim'
" Plug 'nickspoons/vim-sharpenup'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'liuchengxu/vista.vim'                        " list of symbols

Plug 'HerringtonDarkholme/yats.vim'
Plug 'nickspoons/vim-cs'

" === TypeScript === "
Plug 'jelera/vim-javascript-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

call plug#end()

" === Automatically install === "
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
