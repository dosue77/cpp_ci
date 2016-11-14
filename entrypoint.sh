#!/usr/bin/env bash                                                                                

proj=$1
target=$2          
echo ${proj}
echo ${target}
cd ${proj}/${target}
make

if [ -x ${proj} ]
then
   ./${proj}
fi


