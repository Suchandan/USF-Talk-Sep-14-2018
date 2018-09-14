#!/usr/bin/env bash

# Import constants from the config file
# This script assumes that make_test_data_dir.sh has already been run

. ../config.sh

echo "Reordering columns with Pandas"
time python pandas_reorder_columns.py $TEST_FILE $TMP_DIR/pandas.csv
eval "$MD5_UTILITY $TMP_DIR/pandas.csv"

echo "Reordering columns with python"
time python python_reorder_columns.py $TEST_FILE $TMP_DIR/python.csv
eval "$MD5_UTILITY $TMP_DIR/python.csv"

echo "Reordering columns with awk"
time awk -F, \
'
BEGIN {OFS=","}

{ print $2,$1 }' \
$TEST_FILE > $TMP_DIR/awk.csv
eval "$MD5_UTILITY $TMP_DIR/awk.csv"

echo "Compiling Java class"
javac ReorderColumns.java
echo "Running class"
time java -cp .  ReorderColumns "ReorderColumns" $TEST_FILE $TMP_DIR/java.csv
eval "$MD5_UTILITY $TMP_DIR/java.csv"
