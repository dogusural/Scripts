#!/usr/bin/env bash

DIRECTORY=build
result=${PWD##*/}

if [ $# -eq "0" ]; then
	echo "Running Cmake with $# arguments"
fi

if [ $result = $DIRECTORY ]; then
	cd ..
fi

if [ -d "$DIRECTORY" ]; then
	echo "removing $DIRECTORY directory ..."
	rm -rf $DIRECTORY
fi
mkdir $DIRECTORY
cd $DIRECTORY

if [ $? -eq "0" ]; then
	cmake $@ ..
else
	echo "Failed to change directory into $DIRECTORY"
	exit
fi

if [ $? -eq "0" ]; then
	make
else
	echo "Cmake failed, exiting .."
	exit
fi

echo "Built files have been written into $PWD"
exit
