sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common
 
sudo apt-get install liblua5.1-dev luajit libluajit-5.1 python-dev ruby-dev libperl-dev libncurses5-dev libatk1.0-dev libx11-dev libxpm-dev libxt-dev

sudo rm -rf /usr/local/share/vim

sudo rm /usr/bin/vim

# WARNING: notes the specific structure of lua folders. 
sudo mkdir /usr/include/lua5.1/include
sudo cp /usr/include/lua5.1/*.h /usr/include/lua5.1/include/
sudo ln -s /usr/lib/x86_64-linux-gnu/liblua5.1.so /usr/local/lib/liblua.so

cd /opt/
git clone https://github.com/vim/vim
git pull && git fetch
cd vim/src
make distclean # if vim was prev installed
# --prefix 用来设置将相关文件放置于installer_dir下
./configure --prefix=/usr/local/ \
            --with-features=huge \
            --enable-largefile \
            --disable-netbeans \
	    --enable-perlinterp \
            --enable-luainterp \
            --with-luajit \
	    --with-lua-prefix=/usr/include/lua5.1 \
            --enable-rubyinterp \
	    --enable-pythoninterp \
	    # this path may be different depending on the installing history. 
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-fail-if-missing \
            --enable-cscope
	    
make
# DESTDIR用来设置，将相关安装文件放置于DESTDIR/usr/local下
make install DESTDIR=installer_dir

# setup the alias, PATH, and Vim environment $VIM/$VIMRUNTIMEPATH
# alias vi="vim" in .zshrc / .bashrc
# export PATH=$PATH:vim_path
# export VIM=$installer_dir/local/share/...
