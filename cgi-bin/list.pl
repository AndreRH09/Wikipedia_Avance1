#! /usr/bin/perl
use strict;
use warnings;
use DBI;

print "Content-type: text/html; charset=UTF-8\n\n";
print<<HTML;
<!DOCTYPE html>
<link href="css/style.css" rel="stylesheet" type="text/css">
<html lang="es">
  <head>
    <meta charset="UTF-8">
    <title>Listado</title>
  </head>
  <body>
  <h1>Nuestras páginas wiki</h1>
  <hr>
HTML

my @registro;
my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:MariaDB:database=pweb1;host=localhost";
my $dbh = DBI->connect($dsn, $user, $password) or die("No se pudo conectar!");;

my $sth = $dbh->prepare("SELECT Titulo FROM Wiki01");
$sth->execute();

my $i = 0;
while( my @row = $sth->fetchrow_array ) {
  $registro[$i] = $row[0];
  $i++;
}
$sth->finish;
$dbh->disconnect;

print "<ul>\n";
foreach my $title (@registro){
  print "<li><a href="."view.pl?title=$title".">$title</a>\n";
  print "<a href="."delete.pl?title=$title"."> <button style=background-color:red >X</button>   </a>\n";
  print "<a href="."edit.pl?title=$title".">   <button > E </button></a>\n";
}
print "</ul>";
print <<HTML;
  <hr>
  <a href="../new.html">Nueva página</a>
  <br>
  <a href="../index.html">Volver al inicio</a>
  </body>
</html>
HTML
