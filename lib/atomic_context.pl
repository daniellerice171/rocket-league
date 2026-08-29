package SharedProcessor;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 38 }, $class;
}

sub flush_gateway {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 38) % 997;
    }
    return $result;
}

print SharedProcessor->new->flush_gateway(38), "\n";
1;
