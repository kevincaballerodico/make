#!/bin/bash

cd $DIR_BUILD
valgrind --tool=lackey \
--log-file=../$DIR_TESTS/lackey.log \
./$APP 65