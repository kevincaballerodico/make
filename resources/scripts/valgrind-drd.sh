#!/bin/bash

cd $DIR_BUILD
valgrind --tool=drd \
--xml=yes \
--xml-file=../$DIR_TESTS/drd.xml \
--log-file=../$DIR_TESTS/drd.log \
./$APP 65