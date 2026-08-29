package AtomicClient;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 50 }, $class;
}

sub sync_manager {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 50) % 997;
    }
    return $value;
}

print AtomicClient->new->sync_manager(50), "\n";
1;
