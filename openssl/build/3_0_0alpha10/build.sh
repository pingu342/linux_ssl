TOP_PATH=$(cd ../../ && pwd)
INSTALL_PATH=$TOP_PATH/3_0_0alpha10
echo INSTALL_PATH: $INSTALL_PATH

if [ ! -e openssl-3.0.0-alpha10.tar.gz ]; then
	wget https://github.com/openssl/openssl/archive/openssl-3.0.0-alpha10.tar.gz
fi

rm -rf $INSTALL_PATH
rm -rf openssl-openssl-3.0.0-alpha10
tar xvzf openssl-3.0.0-alpha10.tar.gz

pushd openssl-openssl-3.0.0-alpha10
./Configure --debug --prefix=$INSTALL_PATH --openssldir=$INSTALL_PATH/openssl shared enable-weak-ssl-ciphers enable-ssl3 enable-ssl3-method enable-rc4 --api=1.1.0
make
make install
popd

