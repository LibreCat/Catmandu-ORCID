NAME
       Catmandu::Importer::ORCID - Package to import publications from the
       ORCID registry

SYNOPSIS
           use Catmandu::Importer::ORCID;

           my $importer = Catmandu::Importer::ORCID->new(id => '0000-0001-8390-6171' );

           my $n = $importer->each(sub {
               my $hashref = $_[0];
               # ...
           });

METHODS

   new(id => '...')
       Create a new ORCID importer using an identifier as input.

   count
   each(&callback)
   ...
       Every Catmandu::Importer is a Catmandu::Iterable all its methods are
       inherited.

SEE ALSO
       Catmandu::Iterable
