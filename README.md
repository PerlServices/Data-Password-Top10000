[![Kwalitee status](https://cpants.cpanauthors.org/dist/Data-Password-Top10000.png)](https://cpants.cpanauthors.org/dist/Data-Password-Top10000)
[![GitHub issues](https://img.shields.io/github/issues/Data-Password-Top10000/issues.svg)](https://github.com/Data-Password-Top10000/issues/issues)
[![CPAN Cover Status](https://cpancoverbadge.perl-services.de/Data-Password-Top10000-1.0.0)](https://cpancoverbadge.perl-services.de/Data-Password-Top10000-1.0.0)

# NAME

Data::Password::Top10000 - Check if a given string is in the Top 10000 list of common passwords

# VERSION

version 1.0.0

# SYNOPSIS

```perl
use v5.24;
use Data::Password::Top10000 (is_in_top10000);

my $password = '12345';
if ( is_in_top10000( $password ) ) {
    say 'please use an other password';
}
```

# DESCRIPTION

At [https://github.com/danielmiessler/SecLists](https://github.com/danielmiessler/SecLists) a "security tester's companion" is curated.
Part of this companion is a list of the Top 10000 used passwords. It is good practice to
disallow users to use those passwords.

# FUNCTIONS

## is\_in\_top10000

Checks



# Development

The distribution is contained in a Git repository, so simply clone the
repository

```
$ git clone https://github.com/perlservices/Data-Password-Top10000/issues.git
```

and change into the newly-created directory.

```
$ cd issues
```

The project uses [`Dist::Zilla`](https://metacpan.org/pod/Dist::Zilla) to
build the distribution, hence this will need to be installed before
continuing:

```
$ cpanm Dist::Zilla
```

To install the required prequisite packages, run the following set of
commands:

```
$ dzil authordeps --missing | cpanm
$ dzil listdeps --author --missing | cpanm
```

The distribution can be tested like so:

```
$ dzil test
```

To run the full set of tests (including author and release-process tests),
add the `--author` and `--release` options:

```
$ dzil test --author --release
```

# AUTHOR

Renee Baecker <reneeb@cpan.org>

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2022 by Renee Baecker.

This is free software, licensed under:

```
The Artistic License 2.0 (GPL Compatible)
```
