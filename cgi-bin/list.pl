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
    <title>Google Images</title>
  </head>

  <body>
    <h1>Nuestras paginas de Wiki</h1>
    
    <hr style="width:70%;text-align:left;margin-left:0">
    <a href="../new.html" target="_blank">Nueva Pagina<br></a>
    <a href="../index.html"> Volver al Inicio</a>
  </body>
BLOCK

sub cadenaSearch{
  my $google = 'https://www.google.com/search?q';
  return $google;
}
