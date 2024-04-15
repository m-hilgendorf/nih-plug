#!/bin/bash -eu
if [[ ! -d target/multiarch-debian ]] ; then
  echo building debian
  mkdir -p target/multiarch-debian
  docker build -t multiarch-debian - < multiarch-debian.dockerfile
  docker export $(docker create multiarch-debian) --output=target/multiarch-debian.tar
  tar -C target/multiarch-debian -xf target/multiarch-debian.tar
fi
export AARCH64_UNKNOWN_LINUX_SYSROOT=$PWD/target/multiarch-debian
export PKG_CONFIG_ALLOW_CROSS=1
export PKG_CONFIG_PATH=$AARCH64_UNKNOWN_LINUX_SYSROOT/usr/lib/aarch64-linux-gnu/pkgconfig:$AARCH64_UNKNOWN_LINUX_SYSROOT/usr/share/pkgconfig
cargo xtask bundle $@ --target aarch64-unknown-linux-gnu
