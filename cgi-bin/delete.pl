#! /usr/bin/perl
use strict;
use warnings;
use CGI;

my $q = CGI->new;
my $name = $q->param('search');
print $q->header('text/html');
$name =~ s/ /+/g;
my $search = cadenaSearch();

print<<BLOCK;
<!DOCTYPE html>
<html>
  <head>
    <title>Google Search</title>
  </head>

  <body>
    <a href="$search=$name" target="_blank">Search in Google</a>
    <a href="../index.html">Return to Google</a>
  </body>
BLOCK

sub cadenaSearch{
  my $google = 'https://www.google.com/search?q';
  return $google;
}
