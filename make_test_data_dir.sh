#!/usr/bin/env bash

############################################################
# Set Options, for debugging
#
# The option -v prints each command before executing it.
# The option -e will cause the script to fail and exit on the first error.
#
############################################################

set -ev

############################################################
# Constants
############################################################

# Import constants from the config file
. ./config.sh

# Number of lines of data we want in the test file.
NUM_LINES=1000000

# The number of data files we want
NUM_FILES=100

############################################################
# Cleanup
############################################################

# Delete file if it exists
rm -rf $BASE_DIR

echo "Deleting old tmp file"
mkdir $BASE_DIR

############################################################
# Add Header
############################################################

# Add a header
echo "Adding header"
echo "username,total_purchase" > $TEST_FILE

############################################################
# Add lines of data to $TEST_FILE
############################################################

echo "Making data ... "
for i in $(seq 1 $NUM_LINES)
do
    echo "foo,$RANDOM" >> $TEST_FILE
done

############################################################
# Make lots of data
############################################################

for i in $(seq 1 $NUM_FILES)
do
    cp $TEST_FILE $BASE_DIR/$i.csv
done

############################################################
# Done!
############################################################

echo "done!"
