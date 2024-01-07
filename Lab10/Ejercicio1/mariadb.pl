#!C:\xampp\perl\bin\perl.exe
use warnings;
use CGI;
use DBI;


my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:MariaDB:database=pweb1;host=192.168.56.101";
my $dbh = DBI->connect($dsn, $user, $password) or die("No se pudo conectar!");;
#Consultas al SGBD


my $year = 1979;
my $sth = $dbh->prepare("SELECT * FROM Movie WHERE Year=?");
$sth->execute($year);

my $q = CGI->new;
$q->header("text/html");
print $q->header("text/html");
print <<HTML;
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejercicio1</title>
</head>
<body>
    <h1>Resultado</h1>
    <table>
      <tr>
        <th>ID_MOVIE</th>
        <th>TITLE</th>
        <th>YEAR</th>
        <th>SCORE</th>
        <th>VOTES</th>
      </tr>
HTML

while( my @row = $sth->fetchrow_array ) {
  print "@row\n";
  print "<tr>\n";
  foreach my $n(@row){
    print "<td>$n</td>\n";
  }
  print "</tr>\n";
  
}

$sth->finish;
$dbh->disconnect;

print <<HTML;
    </table>
</body>
</html>
HTML

