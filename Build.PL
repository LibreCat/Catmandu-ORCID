use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name => 'Catmandu::ORCID',
    license => 'perl',
    dist_author => [
        'Patrick Hochstenbach <patrick.hochstenbach@ugent.be>'
    ],
    dist_version_from => 'lib/Catmandu/Importer/ORCID.pm',
    build_requires => {
        'Software::License' => 0,
        'Test::Exception' => 0,
        'Test::More' => 0,
    },
    requires => {
        'perl' => '5.10.0',
        'Catmandu' => '0.2002',
        'Moo' => '1.002000',
        'Net::Twitter' => undef,
    },
    add_to_cleanup => [qw(
        Catmandu-ORCID-*
    )],
    create_makefile_pl => 'traditional',
    create_license => 1,
);

$builder->create_build_script;
