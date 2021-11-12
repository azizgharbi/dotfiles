" Enable mouse
set mouse=a

" Set number
set number

" Set no wrap
set nowrap

" Plugins
call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdtree'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'dense-analysis/ale'
    Plug 'Mofiqul/vscode.nvim'
" Initialize plugin system
call plug#end()

" Load vscode theme
let g:vscode_style = "dark"
colorscheme vscode

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

" Find files
noremap <C-o> <cmd>Telescope find_files<cr>

" Find in git repo
noremap <C-p> <cmd>Telescope git_files<cr>

" Eslint ale plugin config
let js_fixers = ['prettier', 'eslint']

let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'],'javascript': js_fixers,'typescript': js_fixers,'json': ['prettier']}

autocmd FileType javascript map <buffer> <c-]> :ALEGoToDefinition -vsplit<CR>
autocmd FileType typescript map <buffer> <c-]> :ALEGoToDefinition -vsplit<CR>

let g:ale_fix_on_save = 1
let g:ale_fix_on_enter = 0
let g:ale_completion_autoimport = 1
let g:ale_sign_error = "🐛"
let g:ale_sign_warning = "⚠️"
let g:ale_sign_info = "ℹ"
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = "🔥"
