#! /usr/bin/perl -w
use strict;

my %hash;
my $name;
my %single;

open FA,'<',$ARGV[0] or die $!;

while (<FA>) {
	chomp;
	if (s/^>//){
		$name =$_;
		next;
	}else{
		s/\*//g;
		$hash{$name} .= $_;
	}
}

close FA;

open SING,'<',$ARGV[1] or die $!;

while (<SING>) {
	chomp;
	$single{$_} ++;
}

close SING;

open OR,'<', $ARGV[2] or die $!;

while (<OR>) {
	chomp;
	my @f = split;
	if ($single{$f[0]}){
		open OUT,'>', $f[0].".fa", or die $!;
		for (@f[1..9]){
			print OUT ">","$_\n",$hash{$_},"\n"
		}
	}
}
