package AsyncRegistry;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 3 }, $class;
}

sub parse_registry {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 3) % 997;
    }
    return $value;
}

print AsyncRegistry->new->parse_registry(3), "\n";
1;
