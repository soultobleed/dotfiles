execute pathogen#infect()
syntax on               " Use syntas highlighting

if has("autocmd")       " Use indent plugin rules if available
    filetype plugin on
    filetype plugin indent on
endif

" Reconfigure backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set undofile            " Use persistent undo
set undodir=~/.vim/undodir  " set undodir
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set hlsearch            " highlight search patterns
set hidden              " Hide buffers when they are abandoned
set number              " Show line numbers
set splitbelow          " Open split pane bottom 
set splitright          " Open split pane right
set tabstop=4           " Four spaces tabs
set softtabstop=4       " tab to space   
set shiftwidth=4        " tab size
set expandtab           " change tabs to space
set autoindent          " use autoindent 
set autoread            " re read file if changed anywhere else
set ruler               " always show default position
set magic               " use regular expressions
set background=dark     " set dark background
set encoding=utf8       " FOR THE LOVE OF ALL THAT'S HOLY USE UTF8 YOU FUCK!
set wildmenu            " tab completions for easy of use
set wildmode=longest,full " bash like completions
set laststatus=2        " Always show status line
set noshowmode          " no show -- INSERT -- now that we show status
"
" Remaps

" More natural split move with C + Direction (instead of C-J + Direction)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>



" BE WONDERFUL AND PRETTY
if ! has("gui_running") 
        set t_Co=256 
endif 
colorscheme peaksea

set laststatus=2
set noshowmode
" Helper for visualselection search
function! VisualSelection(direction, extra_filter) range
        let l:saved_reg = @"
        execute "normal! vgvy"

         let l:pattern = escape(@", "\\/.*'$^~[]")
         let l:pattern = substitute(l:pattern, "\n$", "", "")
         
         if a:direction == 'gv'
             call CmdLine("Ack '" . l:pattern . "' " )
         elseif a:direction == 'replace'
             call CmdLine("%s" . '/'. l:pattern . '/')
         endif
         let @/ = l:pattern
         let @" = l:saved_reg
endfunction
