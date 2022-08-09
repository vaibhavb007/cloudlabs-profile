#!/bin/bash

echo "This is a silly script" > /tmp/silly.txt

sudo apt update
sudo apt -y install mongodb
sudo systemctl start mongodb
sudo systemctl enable mongodb

sudo ip tuntap add name ogstun mode tun
sudo ip addr add 10.45.0.1/16 dev ogstun
sudo ip addr add 2001:db8:cafe::1/48 dev ogstun
sudo ip link set ogstun up

sudo apt install -y python3-pip python3-setuptools python3-wheel ninja-build build-essential flex bison git libsctp-dev libgnutls28-dev libgcrypt-dev libssl-dev libidn11-dev libmongoc-dev libbson-dev libyaml-dev libnghttp2-dev libmicrohttpd-dev libcurl4-gnutls-dev libnghttp2-dev libtins-dev libtalloc-dev meson

git clone https://github.com/open5gs/open5gs
cd open5gs
meson build --prefix=`pwd`/install
ninja -C build

cd build
ninja install
cd ..
