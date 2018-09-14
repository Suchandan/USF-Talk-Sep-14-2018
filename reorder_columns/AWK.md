# Why Awk?

Our goal is to do basic maniuplation on lots of CSV files. Let's compare AWK to standard ways of processing the data in Python.

Note, the input file is a CSV with one million rows, and 2 columns. Let's compare speed. Run these benchmarks on your local machine with the script `run_tests.sh`

#### Speed for python pandas IO: pandas_reorder_columns.py

```bash
time python pandas_reorder_columns.py /tmp/test_data/0.csv /tmp/delete_me.csv

real	0m1.949s
user	0m1.767s
sys	0m0.163s
```

#### Speed for basic Python IO: python_reorder_columns.py

```bash
time python python_reorder_columns.py /tmp/test_data/0.csv /tmp/delete_me.csv

real	0m1.533s
user	0m1.497s
sys	0m0.026s
```

#### Speed with AWK

```bash
time awk -F, 'BEGIN{OFS=","} {print $2,$1 }' /tmp/test_data/0.csv > /tmp/delete_me.csv

real	0m0.958s
user	0m0.940s
sys	0m0.011s
```
