#!/bin/bash

cd $DIR_BUILD
valgrind --tool=memcheck \
--xml=yes \
--xml-file=../$DIR_TESTS/memcheck.xml \
--log-file=../$DIR_TESTS/memcheck.log \
./$APP 65