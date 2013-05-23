=head1 NAME

Catmandu::Importer::ORCID - Package to import publications from the ORCID registry

=head1 SYNOPSIS

    use Catmandu::Importer::ORCID;

    my $importer = Catmandu::Importer::ORCID->new(id => '0000-0001-8390-6171' );

    my $n = $importer->each(sub {
        my $hashref = $_[0];
        # ...
    });

=head1 METHODS

=head2 new(id => '...')

Create a new ORCID importer using an identifier as input.

=head2 count

=head2 each(&callback)

=head2 ...

Every Catmandu::Importer is a Catmandu::Iterable all its methods are inherited. 

=head1 SEE ALSO

L<Catmandu::Iterable>

=cut
package Catmandu::Importer::ORCID;

use Catmandu::Sane;
use WWW::ORCID::API::Pub;
use Moo;
use YAML;

with 'Catmandu::Importer';

our $VERSION = '0.02';

has id    => (is => 'ro' , required => 1);
has orcid => (is => 'ro' , init_arg => undef , lazy => 1 , builder => '_build_orcid');

sub _build_orcid {
    WWW::ORCID::API::Pub->new();
}

sub generator {
	my ($self) = @_;
	sub {
	   state $res = $self->orcid->get_profile($self->id);
	   state $i   = 0;

	   my $result = undef;
	   my $works = $res->{'orcid-profile'}->{'orcid-activities'}->{'orcid-works'}->{'orcid-work'};

	   if (defined $works && ref $works eq 'ARRAY' && $i < @$works) {
	   		$result = $works->[$i];
	   		$i += 1;	
	   }

	   $result;
	};
}

1;
