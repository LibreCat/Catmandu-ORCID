#!/usr/bin/env perl
use Test::More;
use Catmandu::Importer::ORCID;
use Data::Dumper;

my $x = Catmandu::Importer::ORCID->new(id => '0000-0001-8390-6171');

ok($x, "new");
ok($x->first, "first");

done_testing 2;