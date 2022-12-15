#! /usr/bin/perl
use strict;
use warnings;
use CGI;

my $tit = CGI->new;
my $text = CGI->new;

print "Content-type:text/html\r\n\r\n";
my $titulo = $tit->param('titulo');
my $markdown = $text->param('texto');

# SegundoMarkdown::
my $title = $q->param('title');
my $markdown2 = $q->param('markdown2');

my $user = 'aanazcoh';
my $password = '12345';
my $dsn = "DBI:MariaDB:database=Lab_Pweb;host=localhost";
my $dbh = DBI->connect($dsn, $user, $password) or die("No se pudo conectar!");

if((defined($titulo) and defined($markdown)) or (!defined($title) and !defined($markdown2))){
my $sth = $dbh->prepare("INSERT INTO Wiki01(Titulo, MarkDown) VALUES (?,?)");
$sth->execute($titulo, $markdown);

print <<BLOCK;
<!DOCTYPE html>
<html>
  <head>
  <title>Pagina wiki</title>
  </head>
    <body>
    <h1>$titulo</h1>
    <br>
    <p>$markdown</p>
    <hr>
    <h2>Página grabada
    <a href="list.pl"> Lista de páginas</a>
    </h2>
    </body>
</html>
BLOCK
}
elsif((!defined($titulo) and !defined($markdown)) or (defined($title) and defined($markdown2))){
my $sth = $dbh->prepare("UPDATE Wiki01 SET Titulo=? WHERE Title=MarkDown");
$sth->execute($markdown2, $title);
print <<BLOCK;
<!DOCTYPE html>
<html>
  <head>
  <title>Pagina wiki</title>
  </head>
    <body>
    <h1>$title</h1>
    <br>
    <p>$markdown2</p>
    <hr>
    <h2>Página grabada
    <a href="list.pl"> Lista de páginas</a>
    </h2>
    </body>
</html>
BLOCK
}


