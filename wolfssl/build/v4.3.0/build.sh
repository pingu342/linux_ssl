TOP_PATH=$(cd ../../ && pwd)
#INSTALL_PATH=$TOP_PATH/v4.3.0
INSTALL_PATH=$TOP_PATH/v4.3.0_sp-math-all-small
echo INSTALL_PATH: $INSTALL_PATH

if [ ! -e v4.3.0-stable.tar.gz ]; then
	wget https://github.com/wolfSSL/wolfssl/archive/refs/tags/v4.3.0-stable.tar.gz
fi

rm -rf $INSTALL_PATH
rm -rf wolfssl-4.3.0-stable
tar xvzf v4.3.0-stable.tar.gz

pushd wolfssl-4.3.0-stable
./autogen.sh
#./configure --prefix=$INSTALL_PATH --enable-keygen --enable-aesccm --enable-tls13 --enable-asm CFLAGS="-march=armv7-a -mthumb -Os"
#./configure --prefix=$INSTALL_PATH --enable-keygen --enable-aesccm --enable-tls13 --enable-asm --enable-sp --enable-sp-asm CFLAGS="-march=armv7-a -mthumb -Os"
#./configure --prefix=$INSTALL_PATH --enable-keygen --enable-aesccm --enable-tls13 --enable-asm --enable-sp --enable-sp-math-all --enable-sp-asm CFLAGS="-march=armv7-a -mthumb -Os"
./configure --prefix=$INSTALL_PATH --enable-keygen --enable-aesccm --enable-tls13 --enable-asm --enable-sp --enable-sp-math-all=small --enable-sp-asm CFLAGS="-march=armv7-a -mthumb -Os"
#./configure --prefix=$INSTALL_PATH --enable-keygen --enable-aesccm --enable-tls13 --enable-asm --enable-sp --enable-sp-math --enable-sp-asm CFLAGS="-march=armv7-a -mthumb -Os"
make
make install
popd

