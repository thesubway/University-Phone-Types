#open(my $FileHandle, "<", "tablets.csv") or die "Not able to open file";
open FILE, "tablets.csv" or die $!;
if (FILE) {
	print("file exists\n");
}
else {
	print("file does not exist\n");
}
$output = "output.txt";
while (<FILE>) {
  print $_;
}
# while (<>) {
# print "This is output file: \n\n";
# 	print ();
# }