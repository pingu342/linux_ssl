TOP_PATH=$(cd ../../ && pwd)
INSTALL_PATH=$TOP_PATH/v4.3.0
echo INSTALL_PATH: $INSTALL_PATH

if [ ! -e v4.3.0-stable.tar.gz ]; then
	wget https://github.com/wolfSSL/wolfssl/archive/refs/tags/v4.3.0-stable.tar.gz
fi

rm -rf $INSTALL_PATH
rm -rf wolfssl-4.3.0-stable
tar xvzf v4.3.0-stable.tar.gz

pushd wolfssl-4.3.0-stable
./autogen.sh
./configure --prefix=$INSTALL_PATH --enable-keygen --enable-aesccm --enable-tls13 --enable-asm CFLAGS="-march=armv7-a -mthumb"
#./configure --prefix=$INSTALL_PATH --enable-keygen --enable-aesccm --enable-tls13 --enable-asm --enable-sp --enable-sp-asm CFLAGS="-march=armv7-a -mthumb"
#./configure --prefix=$INSTALL_PATH --enable-keygen --enable-aesccm --enable-tls13 --enable-asm --enable-sp --enable-sp-math-all --enable-sp-asm CFLAGS="-march=armv7-a -mthumb"
#./configure --prefix=$INSTALL_PATH --enable-keygen --enable-aesccm --enable-tls13 --enable-asm --enable-sp --enable-sp-math --enable-sp-asm CFLAGS="-march=armv7-a -mthumb"
make
make install
popd

