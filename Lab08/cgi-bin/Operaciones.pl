#!/usr/bin/perl
use warnings;
use CGI;

my $q = CGI->new;
my $problem = $q->param('Operacion') ;

sub sinEspacio {
    my ($a) = @_;
    my $result = "";
    for (my $i = 0; $i < length($a); $i++) {
        if (substr($a, $i, 1) ne " ") {
            $result .= substr($a, $i, 1);
        }
    }
    return $result;
}

sub divide {
    my ($p) = @_;
    my $inicio = 0;
    my $iC = 0;
    my $fin = 0;
    my $iF = 0;
    my $i = 0;
    my $continuar = index($p, "(") != -1;
    if (!$continuar) {
        calcular($p);
    }
    while ($continuar) {
        while ($inicio != $fin && $i < length($p)) {
            if (substr($p, $i, 1) eq '(') {
                if ($inicio == 0) { $iC = $i; }
                $inicio++;
            }
            if (substr($p, $i, 1) eq ')') {
                $iF = $i;
                $fin++;
            }
            $i++;
        }
        $p = substr($p, 0, $iC) . divide(substr($p, $iC + 1, $fin - $iC - 1)) . substr($p, $fin + 1, length($p) - $fin);
        $continuar = index($p, "(") != -1;
    }
    return $p;
}

sub calcular {
    my ($p) = @_;
    my $sol = 0;
    return $sol;