#!/bin/bash
set -eu

git clone https://github.com/PizzaFactory/hrp2ev3.git
(cd hrp2ev3/cfg &&
./configure --with-headers=/usr/include --with-libraries=/usr/lib &&
make clean && make)

for i in helloev3 gyroboy linetrace trike; do
  (cd hrp2ev3/workspace && make clean && make app=$i)
done

