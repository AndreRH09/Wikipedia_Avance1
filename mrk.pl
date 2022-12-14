#! /usr/bin/perl

use Markdown::Table;

my $markdown = q~
| Id | Name | Role |
+---+---+---+
| 1 | John Smith | Testrole |
| 2 | Jane Smith | Admin |
~;



my @tables = Markdown::Table->parse($markdown);
                        
use Data::Dumper;
Core::Global::Logger::debug(Dumper( $tables[0]->get_table ) );
