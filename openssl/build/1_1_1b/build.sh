TOP_PATH=$(cd ../../ && pwd)
INSTALL_PATH=$TOP_PATH/1_1_1b
echo INSTALL_PATH: $INSTALL_PATH

if [ ! -e OpenSSL_1_1_1b.tar.gz ]; then
	wget https://github.com/openssl/openssl/archive/OpenSSL_1_1_1b.tar.gz
fi

rm -rf $INSTALL_PATH
rm -rf openssl-OpenSSL_1_1_1b
tar xvzf OpenSSL_1_1_1b.tar.gz

pushd openssl-OpenSSL_1_1_1b
./config --debug --prefix=$INSTALL_PATH --openssldir=$INSTALL_PATH/openssl shared enable-weak-ssl-ciphers enable-ssl3 enable-ssl3-method enable-rc4
make
make install
popd

