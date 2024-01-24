#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;

use_ok 'Geography::States::Borders';

my $obj = new_ok 'Geography::States::Borders' => [
    country => 'usa',
    verbose => 1,
];

is $obj->verbose, 1, 'verbose';

my $got = $obj->borders;
is_deeply $got->{AK}, [], 'borders';
is_deeply $got->{OR}, [qw(CA ID NV WA)], 'borders';

done_testing();
