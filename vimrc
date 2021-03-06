" VIMrc do Herberson - hmiranda@0fx66.com
" Criado em 19-01-2017
" Alterado em 19-08-2019

" Ativa o plugin pathogen
execute pathogen#infect()
call pathogen#infect() 
call pathogen#helptags()

" Sintaxe colorida
syntax on

" Configura historico
set history=2000

" filetype
filetype on

" Ativa o suporte a plugins
filetype plugin on

" Ativa o suporte a identacao
filetype indent on

" Nao mantem a compatibilidade com o VI
set nocompatible                

" Recarrega os arquivos modificados 
set autoread                   

" Ativa as regex magicas :)
set magic                       

 " Muda o titulo do terminal
set title                      

" Modo de copiar e colar
set pastetoggle=<F2>            

" Exibe o curso como coluna
"set cursorcolumn

" Exibe a linha
set cursorline

" Mostra linha e coluna
set ruler                       

" Numero de linhas
set number                      

" Desativa a quebra de linhas
set nowrap

" Mostra os comandos incompletos
set showcmd                     

 " Mostra o modo de operacao
set showmode                   

" Marca os ({[
set showmatch                   

" Destaca os resultados
set hlsearch                    

" Pesquisa incremental
set incsearch                   

" Ignore Case
set ignorecase                  

" Ignore case inteligente
set smartcase                   

" Expande os tabs para espacos
set expandtab                   

" Tecla tab de acordo com a identacao anterior
set smarttab

" Configura a identacao
set autoindent smartindent shiftround

"When shifting, indent using four spaces
set shiftwidth=4

" Indent using four spaces
set tabstop=4

" Insere tab e backspace quando tiver 4 espacos
set softtabstop=4                

" Desliga o destaque
noremap <F8> :nohl<CR>           
inoremap <F8> <Esc>:nohl<CR>a

" Configura automatico para scripts em ansible
autocmd FileType yaml setlocal et ts=2 ai sw=2 nu sts=0
au BufRead,BufNewFile *.yaml set filetype=yaml.ansible

" Ativa o nerdtree com ctrl+x
nmap <C-x> :NERDTreeToggle<CR>

" Melhora a interface do nerdtree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Encerra o nerdtree se a ultima aba for fechada
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Movimentacao entre abas
noremap <C-j> :<C-U>tabnext<CR>
noremap <C-l> :<C-U>tabprevious<CR>

" Inicia o nerdtree quando o vim abrir
autocmd vimenter * NERDTree

" Ativa o suporte a tags e ctags com a tecla f7
nmap <F7> :TagbarToggle<CR>

"Teclas de atalho para o git
map <F3> :! git status
map <F4> :! git add .
map <F5> :! git commit -m "This commit was automatically created with Vim"
map <F6> :! git push origin master

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Configura o plugin syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Configure ctrlp plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Cria um cabeçalho para scripts bash
fun! InsertHeadBash()
    normal(1G)
    call append(0, "#!/bin/bash")
    call append(1, "# Criado em:" . strftime("%a %d/%b/%Y hs %H:%M"))
    call append(2, "# ultima modificação:" . strftime("%a %d/%b/%Y hs %H:%M"))
    call append(3, "# Criado por VonNaturAustreVe - hmiranda[at]0fx66[dot]com")
    call append(4, "# ")
    call append(5, "# Objetivo do script: ")
    normal($)
endfun
map ,sh :call InsertHeadBash()<cr>A

" Cria um cabeçalho para scripts perl
fun! InsertHeadPl()
    normal(1G)
    call append(0, "#!/usr/bin/perl")
    call append(1, "# Criado em:" . strftime("%a %d/%b/%Y hs %H:%M"))
    call append(2, "# ultima modificação:" . strftime("%a %d/%b/%Y hs %H:%M"))
    call append(3, "# Criado por VonNaturAustreVe - hmiranda[at]0fx66[dot]com")
    call append(4, "# ")
    call append(5, "# Objetivo do script: ")
    call append(6, "use strict;")
    call append(7, "use warnings;")
    call append(8, "use Data::Dumper;")
    normal($)
endfun
map ,pl :call InsertHeadPl()<cr>A
