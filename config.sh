#!/usr/bin/env bash

############################################################
# Constants
############################################################

TMP_DIR=/tmp
BASE_DIR=$TMP_DIR/test_data
TEST_FILE=$BASE_DIR/0.csv

# The utility to compute md5 sums is named differently under Mac and Linux machines

MD5_UTILITY=""
if [ "$(uname)" == "Darwin" ]; then
    MD5_UTILITY="md5"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    MD5_UTILITY="md5sum"
fi
