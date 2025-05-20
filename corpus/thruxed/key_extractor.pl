#!/usr/bin/perl

use strict;
use Getopt::Long;

my $targetkey = "";
my $comment = 0;
Getopt::Long::Configure("bundling");
GetOptions (
   'k|key=s' => \$targetkey,
   'c|comment' => \$comment
);

die "Usage: $0 -k key\n" if $targetkey eq "";
$targetkey .= ":" if $targetkey !~ /:/;

my @contents = <>;
chomp @contents;

my $terminator = 0;
my $key = "";

foreach my $line (@contents) {
next if $line eq ":";
if ($line =~ /^\*([A-G][-#]*:.*)/i) {
$key = $1;
}
if ($line =~ /^\*-/) {
print "$line\n";
next;
}
if ($line =~ /^\*\*/) {
$terminator = 0;
$key = "";
}
if (!(($key eq "") || $key eq $targetkey)) {
print "$line\n" if $comment;
next;
}
print "$line\n";
}


