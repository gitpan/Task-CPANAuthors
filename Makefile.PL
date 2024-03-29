
# This file was automatically generated by Dist::Zilla::Plugin::MakeMaker v5.016.
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "All Acme::CPANAuthors modules at once",
  "AUTHOR" => "Philippe Bruhat (BooK) <book\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Task-CPANAuthors",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Task::CPANAuthors",
  "PREREQ_PM" => {
    "Acme::CPANAuthors" => 0,
    "Acme::CPANAuthors::Acme::CPANAuthors::Authors" => 0,
    "Acme::CPANAuthors::AnyEvent" => 0,
    "Acme::CPANAuthors::BackPAN::OneHundred" => 0,
    "Acme::CPANAuthors::Booking" => 0,
    "Acme::CPANAuthors::CPAN::OneHundred" => 0,
    "Acme::CPANAuthors::CPANTS::FiveOrMore" => 0,
    "Acme::CPANAuthors::CodeRepos" => 0,
    "Acme::CPANAuthors::DebianDev" => 0,
    "Acme::CPANAuthors::DualLife" => 0,
    "Acme::CPANAuthors::GeekHouse" => 0,
    "Acme::CPANAuthors::GitHub" => 0,
    "Acme::CPANAuthors::InMemoriam" => 0,
    "Acme::CPANAuthors::MetaSyntactic" => 0,
    "Acme::CPANAuthors::Misanthrope" => 0,
    "Acme::CPANAuthors::Nonhuman" => 0,
    "Acme::CPANAuthors::Not" => 0,
    "Acme::CPANAuthors::POE" => 0,
    "Acme::CPANAuthors::Pumpkings" => 0,
    "Acme::CPANAuthors::ToBeLike" => 0,
    "Acme::CPANAuthors::You::re_using" => 0,
    "Task::CPANAuthors::Regional" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "File::Path" => 0,
    "File::Spec" => 0,
    "Test::More" => 0
  },
  "VERSION" => "1.003",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Acme::CPANAuthors" => 0,
  "Acme::CPANAuthors::Acme::CPANAuthors::Authors" => 0,
  "Acme::CPANAuthors::AnyEvent" => 0,
  "Acme::CPANAuthors::BackPAN::OneHundred" => 0,
  "Acme::CPANAuthors::Booking" => 0,
  "Acme::CPANAuthors::CPAN::OneHundred" => 0,
  "Acme::CPANAuthors::CPANTS::FiveOrMore" => 0,
  "Acme::CPANAuthors::CodeRepos" => 0,
  "Acme::CPANAuthors::DebianDev" => 0,
  "Acme::CPANAuthors::DualLife" => 0,
  "Acme::CPANAuthors::GeekHouse" => 0,
  "Acme::CPANAuthors::GitHub" => 0,
  "Acme::CPANAuthors::InMemoriam" => 0,
  "Acme::CPANAuthors::MetaSyntactic" => 0,
  "Acme::CPANAuthors::Misanthrope" => 0,
  "Acme::CPANAuthors::Nonhuman" => 0,
  "Acme::CPANAuthors::Not" => 0,
  "Acme::CPANAuthors::POE" => 0,
  "Acme::CPANAuthors::Pumpkings" => 0,
  "Acme::CPANAuthors::ToBeLike" => 0,
  "Acme::CPANAuthors::You::re_using" => 0,
  "File::Path" => 0,
  "File::Spec" => 0,
  "Task::CPANAuthors::Regional" => 0,
  "Test::More" => 0,
  "strict" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



