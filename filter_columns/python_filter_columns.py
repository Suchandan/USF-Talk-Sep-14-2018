import sys

separator = ","
MIN_VALUE=400

if __name__ == "__main__":

    input_filename = sys.argv[1]
    output_filename = sys.argv[2]

    with open(input_filename, "r") as input_handle:
        with open (output_filename, "w") as output_handle:

            is_header = True
            for line in input_handle:
                _1, _2 = line.strip().split(separator)

                if is_header:
                    output_handle.write("{}{}{}\n".format(_1, separator, _2))
                    is_header=False
                    continue

                if int(_2) >= MIN_VALUE:
                    output_handle.write("{}{}{}\n".format(_1, separator, _2))
