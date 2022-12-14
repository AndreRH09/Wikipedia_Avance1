#! /usr/bin/perl
use strict;
use warnings;
use CGI;

my $q = CGI->new;
my $epq = CGI->new;
my $eq = CGI->new;
my $all = $q->param('as_q');
my $exact = $epq->param('as_epq');
my $ninguna = $eq->param('as_eq');
$all =~ s/ /+/g;
$exact =~ s/ /+/g;
$ninguna =~ s/ /+/g;

my $search = cadenaSearch();

print "Content-type:text/html\r\n\r\n";
print<<BLOCK;
<!DOCTYPE html>
<html>
  <head>
    <title>Google Search Advanced</title>
  </head>

  <body>
    <a href="$search=$all&as_epq=$exact&as_eq=$ninguna" target="_blank">Search in Google Advanced</a>
    <a href="../advancedGoogle.html">Return to Google</a>
  </body>
BLOCK

sub cadenaSearch{
  my $google = 'https://www.google.com/search?as_q';
  return $google;
}
