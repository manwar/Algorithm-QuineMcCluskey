#!/usr/bin/perl -w
use strict;
use Algorithm::QuineMcCluskey;

#
# Testing code starts here
#

use Test::More tests => 1;

my($q, @eqn, @expected);

$q = Algorithm::QuineMcCluskey->new(
	title	=> "Example 3.15 from Introduction to Logic Design, by Sajjan G. Shiva, page 123.",
	width => 4,
	minterms => [ 0, 2, 4 .. 6, 9, 10 ],
	dontcares => [7, 11 .. 15],
);

@expected = (
	q/(A'D') + (B) + (AD) + (CD')/		# or (A'D') + (B) + (AD) + (AC)
);

@eqn = $q->solve;
is_deeply(\@eqn, \@expected, $q->title);

