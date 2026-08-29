package SharedFactory;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 23 }, $class;
}

sub compute_parser {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 23) % 997;
    }
    return $result;
}

print SharedFactory->new->compute_parser(23), "\n";
1;
