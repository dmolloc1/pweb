#!C:\xampp\perl\bin\perl.exe
use warnings;
use CGI;

my $q = CGI->new;
#recive las variables del formulario
my $kind = $q->param("kind");
my $keyword = $q->param("keyword");
my %hmap = (
    "CODIGO_ENTIDAD" => 0,
    "NOMBRE" => 1,
    "TIPO_GESTION" => 2,
    "ESTADO_LICENCIAMIENTO" => 3,
    "PERIODO_LICENCIAMIENTO" => 4,
    "CODIGO_FILIAL" => 5,
    "NOMBRE_FILIAL" => 6,
    "DEPARTAMENTO_FILIAL" => 7,
    "PROVINCIA_FILIAL" => 8,
    "CODIGO_LOCAL" => 9,
    "DEPARTAMENTO_LOCAL" => 10,
    "PROVINCIA_LOCAL" => 11,
    "DISTRITO_LOCAL" => 12,
    "LATITUD_UBICACION" => 13,
    "LONGITUD_UBICACION" => 14,
    "TIPO_AUTORIZACION_LOCAL" => 15,
    "DENOMINACION_PROGRAMA" => 16,
    "TIPO_NIVEL_ACADEMICO" => 17,
    "NIVEL_ACADEMICO" => 18,
    "CODIGO_CLASE_PROGRAMA_N2" => 19,
    "NOMBRE_CLASE_PROGRAMA_N2" => 20,
    "TIPO_AUTORIZACION_PROGRAMA" => 21,
    "TIPO_AUTORIZACION_PROGRAMA_LOCAL" => 22
);
$q->charset("UTF-8");
print $q->header("text/html");
print <<HTML;
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Archivos Universidades</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Sarabun&display=swap" rel="stylesheet">
    
    <link rel="preload" href="../css/style.css" as="style"><!--Para que sea más rapido-->
    <link href="style.css" rel="stylesheet">
</head>
<body >
HTML

if(!($kind eq "") && !($keyword eq "")){
    open(IN, '<', "../cvs/Programas de Universidades.csv") or die "<h1>ERROR: open file</h1>\n";
    print "<table>\n";
    print <<HTML;
    <tr>
        <th>CODIGO_ENTIDAD</th>
        <th>NOMBRE</th>
        <th>TIPO_GESTION</th>
        <th>ESTADO_LICENCIAMIENTO</th>
        <th>PERIODO_LICENCIAMIENTO</th>
        <th>CODIGO_FILIAL</th>
        <th>NOMBRE_FILIAL</th>
        <th>DEPARTAMENTO_FILIAL</th>
        <th>PROVINCIA_FILIAL</th>
        <th>CODIGO_LOCAL</th>
        <th>DEPARTAMENTO_LOCAL</th>
        <th>PROVINCIA_LOCAL</th>
        <th>DISTRITO_LOCAL</th>
        <th>LATITUD_UBICACION</th>
        <th>LONGITUD_UBICACION</th>
        <th>TIPO_AUTORIZACION_LOCAL</th>
        <th>DENOMINACION_PROGRAMA</th>
        <th>TIPO_NIVEL_ACADEMICO</th>
        <th>NIVEL_ACADEMICO</th>
        <th>CODIGO_CLASE_PROGRAMA_N2</th>
        <th>NOMBRE_CLASE_PROGRAMA_N2</th>
        <th>TIPO_AUTORIZACION_PROGRAMA</th>
        <th>TIPO_AUTORIZACION_PROGRAMA_LOCAL</th>
    </tr>
HTML
  while(my $linea = <IN>){
    chomp $linea; 
    my @uni = toArray($line);
   # my $value = $dict{$kind};
    #if(defined($value) && $value =~ /.*$keyword.*/){
     # print "<h1>Encontrado: $line</h1>\n";
      #$flag = 1;
      #next; #continue the loop
    #}
  }
  close(IN);
        
        
}else{

}
sub toArray {
    my $linea = $_[0];
    my @arreglo = $linea =~ /[^|]+/g;
    
    return @arreglo;
}