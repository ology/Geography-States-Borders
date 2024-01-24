#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;

use_ok 'Geography::States::Borders';

subtest canada => sub {
    my $obj = new_ok 'Geography::States::Borders' => [
        country => 'canada',
    ];
    is $obj->country, 'canada', 'country';
    my $got = $obj->borders;
    is_deeply $got->{PE}, [], 'PE borders';
    is_deeply $got->{YT}, [qw(BC NT)], 'YT borders';
};

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
