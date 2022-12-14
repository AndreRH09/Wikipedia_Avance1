#! /usr/bin/perl
use strict;
use warnings;
use CGI;

my $q = CGI->new;
my $epq = CGI->new;


my $titulo = $q->param('titulo');
my $texto = $epq->param('texto');

# $all =~ s/ /+/g;
# $exact =~ s/ /+/g;
# $ninguna =~ s/ /+/g;

# my $search = cadenaSearch();

print "Content-type:text/html\r\n\r\n";
print<<BLOCK;
<!DOCTYPE html>
<html>
  <head>
    <title>$titulo</title>
  </head>

  <body>
    <h1>$titulo</h1>
    <p>$texto</p>
    <h2>Pagina grabada <a
        href="list.pl"> Listado paginas</a> </h2>
  </body>
BLOCK

sub cadenaSearch{
  my $google = 'https://www.google.com/search?as_q';
  return $google;
}
