#open(my $FileHandle, "<", "tablets.csv") or die "Not able to open file";
sub removeFrontWhiteSpace {
}
$title = "University Student's Tablet-Types";
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
use CGI;
$cgi = new CGI;
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
print FILE2 '<!DOCTYPE html>
	<head>
		<title>Tablet Usage</title>
        <meta charset="utf-8" />
        <style>'."
        	#circleiOS{
        		width:".$ios."px;
				height:".$ios."px;
				border-radius:".($ios / 2)."px;
				background-color:red;
        	}
        	#circleWindows{
        		width:".$windows."px;
				height:".$windows."px;
				border-radius:".($windows / 2)."px;
				background-color:red;
        	}
        	#circleAndroid{
        		width:".$android."px;
				height:".$android."px;
				border-radius:".($android / 2)."px;
				background-color:red;
        	}
        ".'</style>
	</head>
<body>
	<h1>'.$title.'</h1>
	<svg height="100%" width="100%" xmlns=http://www.w3.org/2000/svg version="1.1">';
print FILE2 "\n".'<div>'."\n";
print FILE2 '	<div id="circleAndroid">android
	</div>
	<div id="circleiOS">iOS
	</div>
	<div id="circleWindows">windows
	</div>
';
print FILE2 '</div>';
print FILE2 '	</svg>
</body>
</html>';

close(FILE);
close FILE2;