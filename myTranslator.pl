#open(my $FileHandle, "<", "tablets.csv") or die "Not able to open file";
open FILE, "tablets.csv" or die $!;
open FILE2, ">tablets_W1023475.html" or die $!;
if (FILE) {
	print("file1 exists\n");
}
else {
	print("file1 does not exist\n");
}
if (FILE2) {
	print("file2 exists\n");
}
else {
	print("file2 does not exist\n");
}
$output = "output.txt";
while (<FILE>) {
  $currentLine = $_;
  $first = substr($currentLine, 0, 1);
  if ($first ne "#") {
  	print FILE2 $currentLine." is a line"."\n";
  }
}
print "\n";
close(FILE);
close FILE2;