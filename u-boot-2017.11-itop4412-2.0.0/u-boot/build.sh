#!/bin/bash

cd ../u-boot-2017.11/

if [ ! -f .config ]
then
	make itop4412_defconfig
fi

make -j4

cp u-boot.bin ../u-boot/
echo "copy u-boot.bin done."

cd spl/
if [ ! -f itop4412-spl.bin ] ; then
	echo "notice: not found itop4412-spl.bin !"
	exit 0
else
	echo "copying itop4412-spl.bin..."
fi

cp itop4412-spl.bin ../../u-boot/
echo "copy u-boot-spl.bin done."

echo "build success !!!"
