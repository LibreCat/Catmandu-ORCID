#!perl -T

use strict;
use warnings;
use Test::More;

BEGIN {
    use_ok 'Catmandu::Importer::ORCID';
}

require_ok 'Catmandu::Importer::ORCID';

done_testing 2;
