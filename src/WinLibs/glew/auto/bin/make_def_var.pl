#!/usr/bin/perl
##
## Copyright (C) 2003-2007, Marcelo E. Magallon <mmagallo[]debian org>
## Copyright (C) 2003-2007, Milan Ikits <milan ikits[]ieee org>
##
## This program is distributed under the terms and conditions of the GNU
## General Public License Version 2 as published by the Free Software
## Foundation or, at your option, any later version.

use strict;
use warnings;

do 'bin/make.pl';

my @extlist = ();
my %extensions = ();

our $type = shift;

if (@ARGV)
{
    @extlist = @ARGV;

	foreach my $ext (sort @extlist)
	{
		my ($extname, $exturl, $types, $tokens, $functions, $exacts) = parse_ext($ext);
		my $extvar = $extname;
		$extvar =~ s/GL(X*)_/GL$1EW_/;
		print "GLboolean " . prefix_varname($extvar) . " = GL_FALSE;\n";
	}
}
