TOP_PATH=$(cd ../../ && pwd)

if [ ! -e 2.0.10.tar.gz ]; then
	wget https://github.com/rbsec/sslscan/archive/refs/tags/2.0.10.tar.gz
fi

rm -rf sslscan-2.0.10
tar xvzf 2.0.10.tar.gz

pushd sslscan-2.0.10
make static
./sslscan --version
popd

