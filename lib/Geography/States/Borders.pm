package Geography::States::Borders;

# ABSTRACT: Return the borders of states and provinces

our $VERSION = '0.0100';

use strictures 2;
use Carp qw(croak);
use Moo;
use namespace::clean;

=head1 SYNOPSIS

  use Geography::States::Borders ();
  my $geo = Geography::States::Borders->new(country => 'usa');
  my $states = $geo->borders('HI'); # empty list
  $states = $geo->borders('OR');    # CA ID NV WA

=head1 DESCRIPTION

C<Geography::States::Borders> returns the borders of states and provinces.

* Currently the only recognized countries are ...the C<usa>.

=head1 ATTRIBUTES

=head2 country

  $country = $geo->country;

Set the country.

=cut

has country => (
    is      => 'ro',
    isa     => sub { croak "$_[0] is not valid" unless $_[0] =~ /^[a-zA-Z]+$/ },
    default => sub { 0 },
);

=head2 verbose

  $verbose = $geo->verbose;

Show progress.

=cut

has verbose => (
    is      => 'ro',
    isa     => sub { croak "$_[0] is not valid" unless $_[0] =~ /^[01]$/ },
    default => sub { 0 },
);

has _usa => (
    is      => 'ro',
    isa     => sub { croak "$_[0] is not a hash reference" unless ref $_[0] eq 'HASH' },
    default => sub {
      {
        AK => [],
        AL => [qw(FL GA MS TN)],
        AR => [qw(LA MS MO OK TN TX)],
        AS => [],
        AZ => [qw(CA CO NV NM UT)],
        CA => [qw(OR NV AZ)],
        CO => [qw(AZ KS NE NM OK UT)],
        CT => [qw(MA NY RI)],
        DC => [qw(VA MD)],
        DE => [qw(MD NJ PA)],
        FL => [qw(GA AL)],
        FM => [],
        GA => [qw(FL AL TN NC SC)],
        GU => [],
        HI => [],
        IA => [qw(IL MN MO NE SD WI)],
        ID => [qw(MT NV OR UT WA WY)],
        IL => [qw(IN KY MO IA WI)],
        IN => [qw(IL KY MI OH)],
        KS => [qw(CO MO NE OK)],
        KY => [qw(IL IN MO OH TN VA WV)],
        LA => [qw(AR MS TX)],
        MA => [qw(CT NH NY RI VT)],
        MD => [qw(DE PA VA DC WV)],
        ME => [qw(NH)],
        MH => [],
        MI => [qw(WI OH IN MN)],
        MN => [qw(IA MI ND SD WI)],
        MO => [qw(AR IL IA KS KY NE OK TN)],
        MP => [],
        MS => [qw(AL AR LA TN)],
        MT => [qw(ID ND SD WY)],
        NC => [qw(GA SC TN VA)],
        ND => [qw(MN MT SD)],
        NE => [qw(CO IA KS MO SD WY)],
        NH => [qw(MN MA VT)],
        NJ => [qw(NY PA DE)],
        NM => [qw(AZ CO OK TX UT)],
        NV => [qw(AZ CA ID OR UT)],
        NY => [qw(VT MA CT NJ PA)],
        OH => [qw(PA WV KY IN MI)],
        OK => [qw(AR CO KS MO NM TX)],
        OR => [qw(CA ID NV WA)],
        PA => [qw(NY NJ DE MD WV OH)],
        PR => [],
        PW => [],
        RI => [qw(CT MA NY)],
        SC => [qw(GA NC)],
        SD => [qw(IA MN MT NE ND WY)],
        TN => [qw(AL AR GA KY MS MO NC VA)],
        TX => [qw(AR LA NM OK)],
        UT => [qw(AZ CO ID NV NM WY)],
        VA => [qw(KY MD NC TN WV DC)],
        VI => [],
        VT => [qw(MA NH NY)],
        WA => [qw(ID OR)],
        WI => [qw(MN MI IA IL)],
        WV => [qw(KY MD OH PA VA)],
        WY => [qw(CO MT NE SD UT ID)],
      }
    },
);

=head1 METHODS

=head2 new

  $geo = Geography::States::Borders->new(country => $country);

Create a new C<Geography::States::Borders> object.

=head2 borders

  @states = $geo->borders($state_code);

Return the bordering states of the given state code.

=cut

sub borders {
    my ($self) = @_;
    my $states = '_' . $self->country;
    return $self->$states();
}

1;
__END__

=head1 SEE ALSO

L<Moo>

=cut
