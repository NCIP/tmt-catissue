#!/usr/bin/perl


my $file = 'enter_bug.cgi.html';

open ZFILE, $file;
open OUTFILE, '>versions.txt';
print OUTFILE "id\tversion\n";
$intoVersions = 0;
$running = 1;
$count = 1;

while ( $running && ($line = <ZFILE>) ) {
	if ($intoVersions) {
		if ( $line =~ m/select>/ ) {
			$running = 0;
		}
		
		if ($line =~ m/<option .*>(.*)\s*</ ) {
			print OUTFILE "$count,$1\n";
			$count++;
		}
	}
	
	if ( $line =~ m/.*version.*/ ) {
		$intoVersions = 1;	
	}
	
}
close ZFILE;
close OUTFILE;

