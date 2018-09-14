import pandas as pd
import sys

separator = ","

if __name__ == "__main__":
    input_filename = sys.argv[1]
    output_filename = sys.argv[2]

    df = pd.read_csv(input_filename, sep=separator)
    reversed_columns=[df.columns[1], df.columns[0]]
    df[reversed_columns].to_csv(output_filename, index=False)
