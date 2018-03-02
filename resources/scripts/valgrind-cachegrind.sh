#!/bin/bash

cd $DIR_BUILD
valgrind --tool=cachegrind \
--cachegrind-out-file=../$DIR_TESTS/cachegrind.txt \
--log-file=../$DIR_TESTS/cachegrind.log \
./$APP 65