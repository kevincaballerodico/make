#!/bin/bash

cd $DIR_BUILD
valgrind --tool=callgrind \
--callgrind-out-file=../$DIR_TESTS/callgrind.txt \
--log-file=../$DIR_TESTS/callgrind.log \
./$APP 65