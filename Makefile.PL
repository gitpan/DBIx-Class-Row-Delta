
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Keep track of and report on changes to a DBIC row object.",
  "AUTHOR" => "Johan Lindstrom <johanl\@cpan.org> - on behalf of Net-A-Porter",
  "BUILD_REQUIRES" => {
    "Test::Class" => 0,
    "Test::Exception" => 0,
    "Test::More" => 0,
    "Test::Most" => 0,
    "parent" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "DBIx-Class-Row-Delta",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "DBIx::Class::Row::Delta",
  "PREREQ_PM" => {
    "Moose" => 0
  },
  "VERSION" => "0.0.3",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



