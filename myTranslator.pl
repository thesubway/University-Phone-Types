#open(my $FileHandle, "<", "tablets.csv") or die "Not able to open file";
sub removeFrontWhiteSpace {
}
open FILE, "tablets.csv" or die $!;
open FILE2, ">tablets_W1023475.html" or die $!;
sub leftTrim {
	$param1 = @_[0];
	$param1 =~ s/^\s+//;
	return $param1;
}
# $test1 = " Hello.";
# $test1 = leftTrim($test1);
# print "test".$test1;
$output = "output.txt";
while (<FILE>) {
  $currentLine = $_;
  $first = substr($currentLine, 0, 1);
  if ($first ne "#") {
  	print FILE2 $currentLine."\n";
  	@fields = split(',',$currentLine);
  	$fields[0] = leftTrim($fields[0]);
  	$fields[1] = leftTrim($fields[1]);
  	$fields[2] = leftTrim($fields[2]);
  	print FILE2 $fields[0]."\n".$fields[1]."\n".$fields[2];
  }
}
print "\n";
close(FILE);
close FILE2;