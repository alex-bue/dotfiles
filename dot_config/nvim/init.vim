" Map leader to space
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

""" PLUGIN LOAD AND SETUP
" auto-install vim-plug
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jreybert/vimagit'
" Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
" Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
"     let g:ycm_filetype_blacklist = { 'tex': 1 }
" Plug 'sirver/ultisnips'
call plug#end()

" PLUGIN CUSTOM SETTINGS
" UltiSnips
    " let g:UltiSnipsExpandTrigger = '<tab>'
    " let g:UltiSnipsJumpForwardTrigger = '<tab>'
    " let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

""" PLUGIN SETUP FINISHED

" Set colourscheme
autocmd vimenter * ++nested colorscheme nord

" Basic settings
set title " displays path of file and its name
set mouse=a
set hlsearch
set clipboard+=unnamedplus
set noshowmode " not needed because of vim-airline plug-in
set noruler
set laststatus=0
set noshowcmd
set tabstop=4
set shiftwidth=4
set expandtab
set nohls
set nowrap

filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber

" Autocompletion for commands
set wildmode=longest,list,full

" Disable automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Keymaps
vnoremap . :normal .<CR>
noremap <silent> <leader>w :update<CR>
vnoremap <silent> <leader>w <C-C>:update<CR>
" inoremap <silent> <leader>w <C-O>:update<CR>
nnoremap <leader>o :only<CR>
nnoremap <leader>q :quit<CR>
nnoremap <leader>vim :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Yank to system clipboard
vnoremap <silent> <leader>y "+y

" Split Windows open at the bottom and right
set splitbelow splitright

" Plugin Autoexpanding
inoremap (; (<CR>);<C-c>O
inoremap (, (<CR>),<C-c>O
inoremap {; {<CR>};<C-c>O
inoremap {, {<CR>},<C-c>O
inoremap [; [<CR>];<C-c>O
inoremap [, [<CR>],<C-c>O

" Plugin FZF
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
  
