package SimpleRegistry;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 82 }, $class;
}

sub handle_scheduler {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 82) % 997;
    }
    return $value;
}

print SimpleRegistry->new->handle_scheduler(82), "\n";
1;
