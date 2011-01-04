#!/usr/bin/perl
#use strict;
#use warnings;
#
print "Content-type: text/html\n\n";
my $epoch=`date +%s`;
chomp($epoch);
my @file=`ls images/*.jpg`;
my $lines = scalar(@file);  #get number of lines
srand;     #seed random
my $random_number=rand @file;   #page 52, perl cookbook :)
my $random_number = int($random_number);
my $random_file=$file[$random_number];   #page 52, perl cookbook :)
chomp($random_file);
print "<img src=/images/$random_file?$epoch><br>\n";
$random_number++; #so we don't say 0 of 6
print "$random_number of $lines<br>\n";
