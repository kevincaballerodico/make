#!/bin/bash

cd $DIR_BUILD
valgrind --tool=massif \
--massif-out-file=../$DIR_TESTS/massif.txt \
--log-file=../$DIR_TESTS/massif.log \
./$APP 65