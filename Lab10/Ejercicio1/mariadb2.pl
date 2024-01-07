#!C:/xampp/perl/bin/perl.exe
#Cree un CGI que muestre una tabla, con todas las películas de 1985

use warnings;
use CGI;
use DBI;

my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:MariaDB:database=pweb1;host=192.168.56.101";
my $dbh =DBI->connect($dsn, $user, $password) or die ("could not connect!");

my $year = 1985;
my $sth = $dbh->prepare("SELECT * FROM Movie WHERE Year=?");
$sth->execute($year);


my $q = CGI->new;
print $q->header("text/html");
print <<HTML;
<!DOCTYPE html>
<html lang="en">
    <head>
   
        <h1>Busqueda por Autor</h1>
    </head>
        <h1>Peliculas estrenadas en 1985</h1>
        <table>
            <tr>
                <th>ID_MOVIE</th>
                <th>TITLE</th>
                <th>YEAR</th>
                <th>SCORE</th>
                <th>VOTES</th>
            </tr>
HTML
while (my @row = $sth->fetchrow_array) {
    print "<tr>\n";
    foreach my $cel (@row){
        print "<td>$cel</td>\n";
    }
    print "</tr>\n";
}
$sth->finish;
$dbh->disconnect;
print "<<HTML";
print "    </table>";
print "    </body>";
print "</html>";
