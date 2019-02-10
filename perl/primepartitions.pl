#!/usr/bin/perl
use strict;
use warnings;
use Math::Complex;
 
sub is_prime {
  my ($num) = @_;
  if ($num < 2) {
    return 0;
  } 
  for (my $i=2; $i <= sqrt($num); $i++) {
    if ($num % $i == 0) {
      return 0;
    }
  }
  return 1;
}

sub primes {
  my ($a, $b) = @_;
  my @ps = ();
  for (my $i=$a; $i <= $b; $i++) {
    if (is_prime($i)) {
      push @ps, $i;
    }
  }
  return @ps;
}

sub prime_partitions {
  my ($n, $k, $lst_ref) = @_;
  my @lst = @{$lst_ref};
  if ($n == 0) {
    my $str = join ' + ', @lst;
    print $str . "\n";
  } elsif ($n > $k) {
    my @ps = primes($k+1, $n);
    foreach (@ps) {
      my @newlst = @lst;
      push @newlst, $_;
      prime_partitions($n - $_, $_, \@newlst);
    } 
  } 
}

print "Enter a number: ";
my $number = <STDIN>;
my @temp = ();
prime_partitions($number, 1, \@temp)