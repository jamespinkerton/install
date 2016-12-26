syntax on
" Set the config folder dependent on whether we're using neovim or regular vim
let current_path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
if has('nvim')
    let vim_folder = "~/.config/nvim/"
else
    let vim_folder = "~/.vim/"
endif
if empty(glob(vim_folder . "/autoload/plug.vim"))
    execute "! curl -fLo " . vim_folder . "/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
endif
set tabstop=4 shiftwidth=4 expandtab
autocmd Filetype c setlocal ts=2 sw=2 expandtab
set mouse=
set noshowmode
" set number relativenumber
" tnoremap <Esc> <C-\><C-n><H>
nnoremap <C-m> :terminal<CR>
inoremap <C-z> <esc><C-z>
map <F8> :! make; bin/push-to-sim home.jamesp.cdft1:~<CR>
nmap <C-s> :w<CR>
nmap <C-w> :q<CR>
imap <C-s> <esc>:w<CR>
imap <C-w> <esc>:q<CR>

exec "source " . current_path . "/nim.vim"

call plug#begin(vim_folder . "/plugged")
    Plug 'flazz/vim-colorschemes'
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
        map <C-n> :NERDTreeToggle<CR>
    Plug 'vim-airline/vim-airline'
        set t_Co=256
        set encoding=utf-8
        set laststatus=2
        set ttimeoutlen=50
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#show_buffers = 0
        let g:airline#extensions#tabline#show_tab_type = 0
        let g:airline#extensions#tabline#tab_min_count = 2
    Plug 'vim-airline/vim-airline-themes'
        let g:airline_theme='murmur'
    Plug 'ervandew/supertab'
        let g:SuperTabDefaultCompletionType = "<C-n>"
    " Plug 'ctrlpvim/ctrlp.vim'
    "     let g:ctrlp_custom_ignore = { 'dir' : 'c/obj/*\|/home/jamesp/lustre\|/home/jamesp/libraries/neovim' }
    Plug 'davidhalter/jedi-vim'
    Plug 'majutsushi/tagbar'
        nmap <F9> :TagbarToggle<CR>
        " let g:tagbar_ctags_bin='~/jongman_config/bin/run-ctags'
    Plug 'tomtom/tcomment_vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        map <C-p> :FZF<CR>
    " Plug 'ryanoasis/vim-devicons'
    " Plug 'easymotion/vim-easymotion'
    " Plug 'myusuf3/numbers.vim'
    " Plug 'tpope/vim-surround'
    " Plug 'terryma/vim-multiple-cursors'
    "    let g:multi_cursor_start_key='<C-b>'
    " function! BuildYCM(info)
    " if a:info.status == 'installed' || a:info.force
    "     execute "export PATH=/usr/bin/:$PATH"
    "     !./install.py
    "     execute "export PATH=/home/jamesp/.conda/envs/modeling/bin/:$PATH"
    " endif
    " endfunction
    " Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
    if has('nvim')
        Plug 'Shougo/deoplete.nvim'
            let g:deoplete#enable_at_startup = 1
            let g:python3_host_prog = '/home/jamesp/.conda/envs/modeling/bin/python3'
        Plug 'zchee/deoplete-jedi'
        " Plug 'zchee/deoplete-clang'
        Plug 'benekastah/neomake'
            let g:neomake_python_enabled_makers = ['pyflakes']
            let g:neomake_yaml_enabled_makers = ['yamllint']
    endif
call plug#end()
