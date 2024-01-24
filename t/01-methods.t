#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;

use_ok 'Geography::States::Borders';

subtest usa => sub {
    my $obj = new_ok 'Geography::States::Borders' => [
        country => 'usa',
    ];

    is $obj->country, 'usa', 'country';

    my $got = $obj->borders;
    is_deeply $got->{AK}, [], 'AK borders';
    is_deeply $got->{OR}, [qw(CA ID NV WA)], 'OR borders';
};

done_testing();
