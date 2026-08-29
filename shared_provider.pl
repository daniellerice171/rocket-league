package AtomicFactory;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 93 }, $class;
}

sub collect_router {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 93) % 997;
    }
    return $value;
}

print AtomicFactory->new->collect_router(93), "\n";
1;
