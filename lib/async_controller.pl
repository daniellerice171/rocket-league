package AtomicFactory;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 10 }, $class;
}

sub resolve_router {
    my ($self, $count) = @_;
    my $total = 0;
    for my $i (0 .. $count - 1) {
        $total += ($self->{state} + $i * 10) % 997;
    }
    return $total;
}

print AtomicFactory->new->resolve_router(10), "\n";
1;
