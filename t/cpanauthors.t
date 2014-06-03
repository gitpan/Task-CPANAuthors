use strict;
use warnings;
use Test::More;
use File::Spec;

plan skip_all => 'these tests are for release candidate testing'
    if !$ENV{RELEASE_TESTING};

for my $prereq ( 'CPAN::Common::Index::LocalPackage', 'Config::INI::Reader' )
{
    eval "use $prereq; 1"
        or plan skip_all => "$prereq required for testing authors list";
}

# assume Task-CPANAuthors-Regional lives next door
# or close enough
my $dist_ini     = 'dist.ini';
my ($regional_ini) = grep -e,
    map File::Spec->catfile( @$_, 'Task-CPANAuthors-Regional' => 'dist.ini' ),
    map [ ( File::Spec->updir ) x $_ ], 1 .. 5;

plan skip_all => "Could not find dist.ini for Task-CPANAuthors"
    if !-e $dist_ini;

plan skip_all => "Could not find dist.ini for Task-CPANAuthors-Regional"
    if !$regional_ini;

plan tests => 1;

# try to get a 02packages.details.txt.gz from somewhere...
# locations found in CPAN.pm, and my local installations of cpanp and cpanm
my $details;
{
    my @dirs;
    eval "use File::HomeDir; 1" and do {
        push @dirs, File::HomeDir->my_data, File::HomeDir->my_home;
    };
    push @dirs, $ENV{HOME} if $ENV{HOME};
    push @dirs, File::Spec->catpath( $ENV{HOMEDRIVE}, $ENV{HOMEPATH}, '' )
        if $ENV{HOMEDRIVE} && $ENV{HOMEPATH};
    push @dirs, $ENV{USERPROFILE} if $ENV{USERPROFILE};
    @dirs
        = map +( "$_/.cpan/sources/modules", "$_/.cpanplus",
        "$_/.cpanm/sources/*" ),
        grep defined, @dirs;
    my @candidates
        = sort { ( stat $b )[9] <=> ( stat $a )[9] }
        map glob("$_/02packages.details.txt*"), @dirs;
    $details = shift @candidates;    # pick the latest
}

diag "Reading packages from $details";
my $index = CPAN::Common::Index::LocalPackage->new( { source => $details } );

# get both lists

# TODO - read from dist.ini and Task::CPANAuthors::Regional's
my @current;

diag "Reading modules from $dist_ini";
push @current, grep /^Acme::CPANAuthors/,
    keys %{ Config::INI::Reader->read_file($dist_ini)->{Prereqs} };

diag "Reading regional modules from $regional_ini";
push @current, grep /^Acme::CPANAuthors::/,
    keys %{ Config::INI::Reader->read_file($regional_ini)->{Prereqs} };

@current = sort map { s/::/-/g; $_ } @current;

my %seen;
my @latest = sort grep !$seen{$_}++,
    map { $_->{uri} =~ m{cpan:///distfile/.*/(.*)-[^-]*$} }
    $index->search_packages( { package => qr{^Acme::CPANAuthors::} } );

# compare both lists
my $ok = is_deeply( \@current, \@latest, "The list matches CPAN" );

if ( !$ok ) {
    %seen = ();
    $seen{$_}++ for @latest;
    $seen{$_}-- for @current;
    diag "\nThe list of Acme::CPANAuthors modules on CPAN has changed:";
    diag( $seen{$_} > 0 ? "+ $_" : "- $_" )
        for grep $seen{$_}, sort keys %seen;
}
