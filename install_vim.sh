# Install vim
echo ">> Installing vim..."
sudo apt install libncurses-dev
git clone https://github.com/vim/vim.git
cd vim
git pull
cd src
./configure --with-python3interp=yes
make
sudo make install

