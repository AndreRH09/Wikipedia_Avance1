#! /usr/bin/perl
use strict;
use warnings;
use CGI;

my $tit = CGI->new;
my $text = CGI->new;

print "Content-type:text/html\r\n\r\n";
my $titulo = $tit->param('titulo');
my $markdown = $text->param('texto');

my $user = 'aanazcoh';
my $password = '12345';
my $dsn = "DBI:MariaDB:database=pweb1;host=localhost";
my $dbh = DBI->connect($dsn, $user, $password) or die("No se pudo conectar!");

if((defined($titulo) and defined($markdown))){
my $sth = $dbh->prepare("INSERT INTO Wiki0.1(Title, Text) VALUE(?,?)");
$sth->execute($titulo, $markdown);


print<<BLOCK;
<!DOCTYPE html>
<html>
  <head>
    <title>$titulo</title>
  </head>

  <body>
    <h1>$titulo</h1>
    <p>$texto</p>
    <hr style="width:70%;text-align:left;margin-left:0">
    <h2>Pagina grabada <a
        href="list.pl"> Listado paginas</a> </h2>
  </body>
BLOCK
}

