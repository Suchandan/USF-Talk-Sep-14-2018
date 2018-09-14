# Why Awk?

Our goal is to filter lots of CSV files based on simple rules. Let's compare AWK to standard ways of processing the data in Python.

Note, the input file is a CSV with one million rows, and 2 columns. Let's compare speed. Run these benchmarks on your local machine with the script `run_tests.sh`

#### Speed for basic Python IO: python_reorder_columns.py

```bash
time python python_filter_columns.py /tmp/test_data/0.csv /tmp/python.csv

real	0m2.183s
user	0m2.149s
sys	0m0.026s
```

Slightly faster with pandas.

#### Speed for python pandas IO: pandas_reorder_columns.py

```bash
time python pandas_filter_columns.py /tmp/test_data/0.csv /tmp/pandas.csv

real	0m1.995s
user	0m1.819s
sys	0m0.165s
```

#### Speed with AWK: pandas_reorder_columns.py

```
time awk '
BEGIN {FS=","; OFS=","}
$2 >= 400 {print $0 }' /tmp/test_data/0.csv > /tmp/awk.csv

real	0m0.846s
user	0m0.826s
sys	0m0.011s
```
