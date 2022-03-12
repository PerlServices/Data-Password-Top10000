#!/usr/bin/perl

use v5.24;

use Mojo::Base -strict, -signatures;
use Mojo::File qw(curfile);
use Mojo::IOLoop;
use Mojo::UserAgent;

my $url = 'https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-10000.txt';
my $ua  = Mojo::UserAgent->new;

$ua->get_p( $url )->then(sub ( $tx ) {
    my $list  = $tx->res->body;
    $list =~ s{^}{        }xmsg;

    my $code   = sprintf _template(), $list;
    my $module = curfile->dirname->child(qw/.. lib Data Password Top10000.pm/);
    my $dir    = $module->dirname;
    $dir->make_path if !-d $dir->to_string;

    $module->spurt( $code );
    exit;
});

Mojo::IOLoop->start if !Mojo::IOLoop->is_running;

sub _template {
return q~package Data::Password::Top10000;

# ABSTRACT: Check if a given string is in the Top 10000 list of common passwords

use v5.24;

use strict;
use warnings;

use Exporter 'import';

use feature 'signatures';
no warnings 'experimental::signatures';

our @EXPORT_OK = qw(is_in_top10000);

sub is_in_top10000 ( $password ) {
    state %%list = map { $_ => 1 } _list();
    return !!$list{$password}
}

sub _list () {
    return qw(
%s);
}

__END__

=head1 DESCRIPTION

At L<https://github.com/danielmiessler/SecLists> a "security tester's companion" is curated.
Part of this companion is a list of the Top 10000 used passwords. It is good practice to
disallow users to use those passwords.

=head1 SYNOPSIS

    use v5.24;
    use Data::Password::Top10000 (is_in_top10000);

    my $password = '12345';
    if ( is_in_top10000( $password ) ) {
        say 'please use an other password';
    }

=head1 FUNCTIONS

=head2 is_in_top10000

Checks if a given string is in the Top 10000 commonly used passwords.
~;
}
