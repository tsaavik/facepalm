#!/usr/bin/perl
use strict;
use warnings;
use CGI;

print "Content-type: text/html\n\n";
my $epoch = time;
my $query=new CGI;
my $last=$query->param('last') || 0;

my @file=`ls images/*.jpg`;
my $lines = scalar(@file);  #get number of lines
my $random_number = get_random();
if($random_number == $last) {
   #print STDERR "$0: got same random, \$last=$last \$random_number=$random_number trying again";
   $random_number = get_random();
}

my $random_file=$file[$random_number];   #page 52, perl cookbook :)
chomp($random_file);
print "<img src=$random_file?last=$random_number&nocache=$epoch><br>\n";
$random_number++; #so we don't say 0 of 6
print "$random_number of $lines<br>\n";

exit 0;

sub get_random{
   srand;     #seed random
   my $random_number=rand @file;   #page 52, perl cookbook :)
   return int($random_number);
}
