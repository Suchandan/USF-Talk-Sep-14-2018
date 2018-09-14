import sys

separator = ","

if __name__ == "__main__":
    input_filename = sys.argv[1]
    output_filename = sys.argv[2]

    with open(input_filename, "r") as input_handle:
        with open (output_filename, "w") as output_handle:
            for line in input_handle:
                _1, _2 = line.strip().split(separator)
                output_handle.write("{}{}{}\n".format(_2, separator, _1))
