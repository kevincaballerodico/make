#!/bin/bash

cd $DIR_BUILD
valgrind --tool=helgrind \
--xml=yes \
--xml-file=../$DIR_TESTS/helgrind.xml \
--log-file=../$DIR_TESTS/helgrind.log \
./$APP 65