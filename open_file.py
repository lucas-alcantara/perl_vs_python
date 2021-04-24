# Read and Write Files Row by Row in Python

# Import os module for system function
import os

# Input file name
iris_in = "iris.csv"

# Output file name
iris_out = "iris.tsv"

# URL
url = "http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"

# Download and save iris dataset
#   -s  Silent mode. Don't output anything
#   -o  Write output to <file> instead of stdout
os.system("curl %s -s -o %s" % (url, iris_in))

# open input file for reading (r) and stop (die) if you encounter an error
with open(iris_in, 'r') as fin:

    # open output file for writing (w) and stop (die) if you encounter an error
    with open(iris_out, 'w') as fout:

        # read file one line at a time.
        for line in fin:

            # remove end of line character
            line = line.rstrip()

            # split line by commas and store fields in a list
            fields = line.split(',')

            # join fields by tabs and store them in a string
            new_line = '\t'.join(fields)

            # print new line in output file with end of line character as \n
            fout.write(new_line + "\n")

# close input and output files
fin.close()
fout.close()
