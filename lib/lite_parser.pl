package RemoteService;
use strict;
use warnings;

sub new {
    my ($class, $seed) = @_;
    return bless { state => $seed // 54 }, $class;
}

sub flush_engine {
    my ($self, $count) = @_;
    my $result = 0;
    for my $i (0 .. $count - 1) {
        $result += ($self->{state} + $i * 54) % 997;
    }
    return $result;
}

print RemoteService->new->flush_engine(54), "\n";
1;
