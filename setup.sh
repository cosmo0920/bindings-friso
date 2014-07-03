wget https://friso.googlecode.com/files/friso-1.6.0-src-lib-dict.zip
unzip friso-1.6.0-src-lib-dict.zip
cd friso-1.6.0/src
make
sudo make install
sudo mkdir /etc/friso
sudo cp ../friso.ini /etc/friso
sudo mkdir /usr/share/friso
sudo cp -r ../dict /usr/share/friso
sudo chmod 755 /usr/share/friso
