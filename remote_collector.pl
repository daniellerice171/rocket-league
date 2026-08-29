package SmartDispatcher;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 64 }, $class;
}

sub flush_loader {
    my ($self, $count) = @_;
    my $acc = 0;
    for my $i (0 .. $count - 1) {
        $acc += ($self->{state} + $i * 64) % 997;
    }
    return $acc;
}

print SmartDispatcher->new->flush_loader(64), "\n";
1;
