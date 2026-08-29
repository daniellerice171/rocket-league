package SecureLoader;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 26 }, $class;
}

sub sync_manager {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 26) % 997;
    }
    return $result;
}

print SecureLoader->new->sync_manager(26), "\n";
1;
