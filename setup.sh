#!/usr/bin/env bash

cp gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global

cd ~

cat << 'EOF' >> .bash_profile
export PS1="-> \w $ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
EOF

mkdir -p .vim/syntax
curl "https://raw.githubusercontent.com/albertgoncalves/haskell.vim/master/syntax/haskell.vim" > \
    .vim/syntax/haskell.vim
curl "https://raw.githubusercontent.com/albertgoncalves/typescript-vim/master/syntax/typescript.vim" > \
    .vim/syntax/typescript.vim
curl "https://raw.githubusercontent.com/albertgoncalves/stan.vim/master/syntax/stan.vim" > \
    .vim/syntax/stan.vim

mkdir .vim/colors
curl "https://raw.githubusercontent.com/albertgoncalves/gruvbox/master/colors/gruvbox.vim" > \
    .vim/colors/gruvbox.vim

cat << 'EOF' >> .vimrc
syntax on
set colorcolumn=80
set number
set background=dark
colorscheme gruvbox
xnoremap <leader>b xi()<Esc>P
xnoremap <leader>c xi{}<Esc>P
xnoremap <leader>s xi[]<Esc>P
xnoremap <leader>q xi""<Esc>P
autocmd BufWritePre * %s/\s\+$//e
set tabstop=4 shiftwidth=4 expandtab
vmap <leader>y :w! /tmp/vitmp<CR>
nmap <leader>p :r! cat /tmp/vitmp<CR>
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd BufNewFile,BufRead *.stan setlocal filetype=stan
set cursorline
EOF
