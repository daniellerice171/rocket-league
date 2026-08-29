package AsyncContext;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 56 }, $class;
}

sub parse_processor {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 56) % 997;
    }
    return $result;
}

print AsyncContext->new->parse_processor(56), "\n";
1;
