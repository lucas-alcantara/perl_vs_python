# Read and Write Files Row by Row in Perl

# Input file name
my $iris_in = "iris.csv";

# Output file name
my $iris_out = "iris.tsv";

# URL
my $url = "http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data";

# Download and save iris dataset
#   -s  Silent mode. Don't output anything
#   -o  Write output to <file> instead of stdout
system("curl $url -s -o $iris_in");

# open input file for reading (<) and stop (die) if you encounter an error
open (my $fin, "<$iris_in") || die ("Can't open file $iris_in!\n");

# open output file for writing (>) and stop (die) if you encounter an error
open (my $fout, ">$iris_out") || die ("Can't open file $iris_out!\n");

# read file one line at a time.
while (my $line = <$fin>) {

    # remove end of line character
    chomp($line);

    # split line by commas and store fields in an array
    my @fields = split(",", $line);

    # join fields by tabs and store them in a string
    my $new_line = join("\t", @fields);

    # print new line in output file with end of line character as \n
    print $fout $new_line . "\n";
}

# close input and output files
close($fin);
close($fout);