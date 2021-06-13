TOP_PATH=$(cd ../../ && pwd)
INSTALL_PATH=$TOP_PATH/1_0_2u
echo INSTALL_PATH: $INSTALL_PATH

if [ ! -e OpenSSL_1_0_2u.tar.gz ]; then
	wget https://github.com/openssl/openssl/archive/OpenSSL_1_0_2u.tar.gz
fi

rm -rf $INSTALL_PATH
rm -rf openssh-OpenSSL_1_0_2u
tar xvzf OpenSSL_1_0_2u.tar.gz

pushd openssl-OpenSSL_1_0_2u
#./config --prefix=$INSTALL_PATH --openssldir=$INSTALL_PATH/openssl shared
./config -g3 -O0 -fno-omit-frame-pointer -fno-inline-functions --prefix=$INSTALL_PATH --openssldir=$INSTALL_PATH/openssl shared
make
make install
popd

