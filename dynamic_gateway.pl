package LocalGateway;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 91 }, $class;
}

sub decode_builder {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 91) % 997;
    }
    return $value;
}

print LocalGateway->new->decode_builder(91), "\n";
1;
