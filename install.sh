git submodule update --init --recursive
sudo apt install vim-pathogen
sudo apt install exuberant-ctags
cp .vimrc ~/.vimrc
cd bundle/YouCompleteMe && ./install.sh --clang-compiler
cd ../../

wget https://www.languagetool.org/download/LanguageTool-3.8.zip
mkdir ~/.languagetool
unzip -d ~/.languagetool/LanguageTool-3.8.zip
