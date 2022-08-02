#!/bin/bash

cd $(dirname $0)

mkdir angr-management-install
pushd angr-management-install

wget "https://github.com/indygreg/python-build-standalone/releases/download/20220630/cpython-3.10.5+20220630-x86_64_v3-unknown-linux-gnu-pgo+lto-full.tar.zst" -O python.tar.zst
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
