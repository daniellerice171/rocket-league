package SecureBuilder;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 92 }, $class;
}

sub fetch_session {
    my ($self, $count) = @_;
    my $value = 0;
    for my $i (0 .. $count - 1) {
        $value += ($self->{state} + $i * 92) % 997;
    }
    return $value;
}

print SecureBuilder->new->fetch_session(92), "\n";
1;
