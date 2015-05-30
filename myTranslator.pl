#open(my $FileHandle, "<", "tablets.csv") or die "Not able to open file";
sub removeFrontWhiteSpace {
}
sub leftTrim {
	$param1 = @_[0];
	$param1 =~ s/^\s+//;
	return $param1;
}
sub writeHTMLfile {
	open FILE2, ">tablets.html" or die $!;
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
		<h1>'.$title.'</h1>';
	print FILE2 '
		<svg height="1000" width="1000" xmlns=http://www.w3.org/2000/svg version="1.1">
			<text x="0" y="150" fill="purple">'."iOS tablet".'</text>
			<circle cx="250" cy="150" '."r=".($ios / 10).' stroke="purple" stroke-width="4" fill="orange" />
			<text x="450" y="150" fill="purple">'.$ios." users".'</text>
			<text x="0" y="350" fill="blue">'."Windows tablet".'</text>
			<circle cx="250" cy="350" '."r=".($windows / 10).' stroke="blue" stroke-width="4" fill="yellow" />
			<text x="450" y="350" fill="blue">'.$windows." users".'</text>
			<text x="0" y="550" fill="red">'."Android tablet".'</text>
			<circle cx="250" cy="450" '."r=".($android / 10).' stroke="red" stroke-width="4" fill="green" />
			<text x="450" y="550" fill="red">'.$android." users".'</text>
		</svg>';
	print FILE2 '
	</body>
</html>';
close FILE2;
}
sub readHTMLfile {
	open FILE, "tablets.csv" or die $!;
	while (<FILE>) {
	  $currentLine = $_;
	  $first = substr($currentLine, 0, 1);
	  if ($first ne "#") {
		@fields = split(',',$currentLine);
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


	close(FILE);
}
$title = "University Student's Tablet-Types";
use CGI;
$cgi = new CGI;
$output = "output.txt";
$android = 0;
$windows = 0;
$ios = 0;
readHTMLfile();
writeHTMLfile();