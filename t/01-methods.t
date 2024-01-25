#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use Test::Fatal;

use_ok 'Geography::States::Borders';

subtest invalid => sub {
    like(
        exception { Geography::States::Borders->new(country => 123) },
        qr/is not valid/,
        'constructor dies with invalid country',
    );
    my $obj = new_ok 'Geography::States::Borders' => [
        country => 'narnia',
    ];
    is $obj->country, 'narnia', 'country';
    like(
        exception { $obj->borders },
        qr/object method/,
        'borders dies with invalid country',
    );
};

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
