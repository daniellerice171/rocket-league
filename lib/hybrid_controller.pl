package AtomicDispatcher;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 15 }, $class;
}

sub parse_dispatcher {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 15) % 997;
    }
    return $value;
}

print AtomicDispatcher->new->parse_dispatcher(15), "\n";
1;
