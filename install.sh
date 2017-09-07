git submodule update --init --recursive
sudo apt install vim-pathogen
sudo apt install exuberant-ctags
cp .vimrc ~/.vimrc
cd bundle/YouCompleteMe && ./install.sh --clang-compiler
cd ../../
