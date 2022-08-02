#!/bin/bash

cd $(dirname $0)

mkdir angr-management-install
pushd angr-management-install

if [[ $(arch) == "i386" ]] then
    python_dist="https://github.com/indygreg/python-build-standalone/releases/download/20220630/cpython-3.10.5+20220630-x86_64-apple-darwin-pgo+lto-full.tar.zst"
else
    python_dist="https://github.com/indygreg/python-build-standalone/releases/download/20220630/cpython-3.10.5+20220630-aarch64-apple-darwin-pgo+lto-full.tar.zst"
fi
wget $python_dist -O python.tar.zst
unzstd python.tar.zst
tar xf python.tar python/install python/licenses
rm python.tar.zst python.tar

mkdir wheels
python/install/bin/pip3 download -d wheels angr-management
rm wheels/pyvex*
cp pyvex* wheels

popd

cp {install.sh,uninstall.sh} angr-management-install/

tar czf angr-management-installer-linux.tar.gz angr-management-install
