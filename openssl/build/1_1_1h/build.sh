TOP_PATH=$(cd ../../ && pwd)
INSTALL_PATH=$TOP_PATH/1_1_1h
echo INSTALL_PATH: $INSTALL_PATH

if [ ! -e openssl-1.1.1h.tar.gz ]; then
	wget https://www.openssl.org/source/openssl-1.1.1h.tar.gz
fi

rm -rf $INSTALL_PATH
rm -rf openssl-1.1.1h
tar xvzf openssl-1.1.1h.tar.gz

pushd openssl-1.1.1h
./config --prefix=$INSTALL_PATH --openssldir=$INSTALL_PATH/openssl shared enable-weak-ssl-ciphers enable-ssl3 enable-ssl3-method
make
make install
popd
