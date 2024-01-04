#!C:\xampp\perl\bin\perl.exe
use warnings;
use CGI;

my $q = CGI->new;
#recive las variables del formulario
my $name = $q->param('nombre') ;

#logica para leer un archivo


# Abre el archivo en modo lectura
open(IN, '<', "../cvs/Programas de Universidades.csv") or die "No se pudo abrir el archivo ";

# Lee el contenido del archivo línea por línea
while (my $linea = <$archivo>) {
    chomp $linea; # Elimina el carácter de nueva línea al final de la línea
    print "$linea\n"; # Imprime la línea leída
}

# Cierra el archivo después de leer
close($archivo);