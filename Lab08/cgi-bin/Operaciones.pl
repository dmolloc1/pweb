#!/usr/bin/perl
use warnings;
use CGI;

my $q = CGI->new;
my $problem = $q->param('operacion') ;
chomp $problem;
 #metodo para quitar los espacios
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
#Metodo para identificar los parentesis 
sub divide {
    my @temp = @_;
    my $p = @temp[0];
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
#resuelve expresiones simples
sub calcular {
    my ($expresion) = @_;
    my @partes = $expresion =~ /(\d+|[-+*\/])/g;; #separa operadores de numeros y los coloca en un array

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
print $cgi -> header('text/html');
print <<HTML;
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mi Calculadora</title>
        <link rel="preload" href="css/style.css" as="style"><!--Para que sea más rapido-->
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body >
        <div class="contenedor sombra" background-color = white>
            <div class="section1">
                <h1>Mi calculadora</h1>
            </div>
            
            <div >
                <h3>El resultado es: $respFinal</h3>
                
            </div>
        </div>
    </body>
</html>
HTML