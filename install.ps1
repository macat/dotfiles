
git submodule update --init --recursive

New-Item -Force -ItemType SymbolicLink -Path "$env:userprofile\.gitconfig" -Target "$env:userprofile\.dotfiles\git\gitconfig"
New-Item -Force -ItemType SymbolicLink -Path "$env:userprofile\.vim" -Target "$env:userprofile\.dotfiles\vim"
New-Item -Force -ItemType SymbolicLink -Path "$env:userprofile\AppData\Local\nvim" -Target "$env:userprofile\.dotfiles\vim"
New-Item -Force -ItemType SymbolicLink -Path "$env:userprofile\.vimrc" -Target "$env:userprofile\.dotfiles\vimrc"

iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$env:LOCALAPPDATA/nvim-data/site/autoload/plug.vim" -Force
