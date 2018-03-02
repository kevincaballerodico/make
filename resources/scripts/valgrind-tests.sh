#!/bin/bash

valgrind --tool=cachegrind --cachegrind-out-file=$1/cachegrind.txt --log-file=$1/cachegrind.log ./$2 $3
valgrind --tool=callgrind --callgrind-out-file=$1/callgrind.txt --log-file=$1/callgrind.log ./$2 $3
valgrind --tool=drd --xml=yes --xml-file=$1/drd.xml --log-file=$1/drd.log ./$2 $3
valgrind --tool=helgrind --xml=yes --xml-file=$1/helgrind.xml --log-file=$1/helgrind.log ./$2 $3
valgrind --tool=lackey --log-file=$1/lackey.log ./$2 $3
valgrind --tool=massif --massif-out-file=$1/massif.txt --log-file=$1/massif.log ./$2 $3
valgrind --tool=memcheck --xml=yes --xml-file=$1/memcheck.xml --log-file=$1/memcheck.log ./$2 $3