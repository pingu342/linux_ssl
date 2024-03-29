TOP_PATH=$(cd ../../ && pwd)
INSTALL_PATH=$TOP_PATH/1_1_1f
echo INSTALL_PATH: $INSTALL_PATH

if [ ! -e openssl-1.1.1f.tar.gz ]; then
	wget https://www.openssl.org/source/openssl-1.1.1f.tar.gz
fi

rm -rf $INSTALL_PATH
rm -rf openssl-1.1.1f
tar xvzf openssl-1.1.1f.tar.gz

pushd openssl-1.1.1f
./config --debug --prefix=$INSTALL_PATH --openssldir=$INSTALL_PATH/openssl shared enable-weak-ssl-ciphers enable-ssl3 enable-ssl3-method enable-rc4
make
make install
popd

