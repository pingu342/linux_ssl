TOP_PATH=$(cd ../../ && pwd)
INSTALL_PATH=$TOP_PATH/v4.7.0
echo INSTALL_PATH: $INSTALL_PATH

if [ ! -e v4.7.0-stable.tar.gz ]; then
	wget https://github.com/wolfSSL/wolfssl/archive/refs/tags/v4.7.0-stable.tar.gz
fi

rm -rf $INSTALL_PATH
rm -rf wolfssl-4.7.0-stable
tar xvzf v4.7.0-stable.tar.gz

pushd wolfssl-4.7.0-stable
./autogen.sh
./configure --prefix=$INSTALL_PATH --enable-asm --enable-aesccm
make
make install
popd

