# Install Vundle
echo ">> Installing Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Copy .vmrc
echo ">> Copying .vimrc"
cp .vimrc ~/

# Install pluings
vim -c :VundleInstall

# Installing YCM
sudo apt install cmake g++
cd ~/.vim/bundles/YouCompleteMe
python install.py
