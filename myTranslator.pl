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
$android = 0;
$windows = 0;
$ios = 0;
while (<FILE>) {
  $currentLine = $_;
  $first = substr($currentLine, 0, 1);
  if ($first ne "#") {
  	@fields = split(',',$currentLine);
#   	$fields[0] = leftTrim($fields[0]); #institution will be ignored.
  	$fields[1] = leftTrim($fields[1]);
  	$fields[2] = leftTrim($fields[2]);
  	if ($fields[1] eq "ios") {
  		$ios += $fields[2];
  	}
  	elsif ($fields[1] eq "windows") {
  		$windows += $fields[2];
  	}
  	elsif ($fields[1] eq "android") {
  		$android += $fields[2];
  	}
  }
}
print FILE2 "Total iOS: ".$ios."\n";
print FILE2 "Total android: ".$android."\n";
print FILE2 "Total windows: ".$windows;
close(FILE);
close FILE2;