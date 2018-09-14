#!/usr/bin/env bash

# Import constants from the config file
# This script assumes that make_test_data_dir.sh has already been run

. ../config.sh

echo "Filtering columns with Pandas"
time python pandas_filter_columns.py $TEST_FILE $TMP_DIR/pandas.csv
eval "$MD5_UTILITY $TMP_DIR/pandas.csv"

echo "Filtering columns with python"
time python python_filter_columns.py $TEST_FILE $TMP_DIR/python.csv
eval "$MD5_UTILITY $TMP_DIR/python.csv"

echo "Filtering columns with awk"
time awk '
BEGIN {FS=","; OFS=","}
$2 >= 400 {print $0 }' $TEST_FILE > $TMP_DIR/awk.csv
eval "$MD5_UTILITY $TMP_DIR/awk.csv"

echo "Compiling Java class"
javac FilterColumns.java
echo "Running class"
time java -cp .  FilterColumns "FilterColumns" $TEST_FILE $TMP_DIR/java.csv
eval "$MD5_UTILITY $TMP_DIR/java.csv"
