#!/usr/bin/perl
use warnings;
my $problem = <STDIN>;
chomp $problem;

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
    while ($continuar) {
        while ($inicio != $fin ) {
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
    my ($expresion) = @_;
    my @partes = split(/\s*([+\-\/\*])\s*/, $expresion);

    my $resultado = shift @partes; # El primer número se toma como el resultado inicial

    while(@partes) {
        my $operador = shift @partes;
        my $otro_numero = shift @partes;

        if ($operador eq '+') {
            $resultado += $otro_numero;
        } elsif ($operador eq '-') {
            $resultado -= $otro_numero;
        } elsif ($operador eq '*') {
            $resultado *= $otro_numero;
        } elsif ($operador eq '/') {
            $resultado /= $otro_numero;
        }
    }

    return $resultado;
}

my $respFinal = calcular((sinEspacio($problem)));
print "El resultado es: $respFinal\n";