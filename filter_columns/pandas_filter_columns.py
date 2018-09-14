import pandas as pd
import sys

separator = ","
MIN_VALUE=400

if __name__ == "__main__":
    input_filename = sys.argv[1]
    output_filename = sys.argv[2]

    df = pd.read_csv(input_filename, sep=separator)
    column_1 = df.columns[1]
    df[df[column_1] >= MIN_VALUE].to_csv(output_filename, index=False)
