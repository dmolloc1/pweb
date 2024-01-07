use warnings;
use CGI;
use DBI;

my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:MariaDB:database=pweb1;host=192.168.56.101";
my $dbh =DBI->connect($dsn, $user, $password) or die ("could not connect!");


my $sth = $dbh->prepare("SELECT * FROM Movie WHERE Score>=7 AND Votes>=5000");
$sth->execute();

my $q = CGI->new;
$query->charset("UTF-8");
print $q->header("text/html");
print <<HTML;
<!DOCTYPE html>
<html lang="en">
    <head>
        <h1>Ordenar por puntos 5000</h1>
    </head>
    <body >
        <h1>Puntajes mayor a 7 y más de 5000 votos</h1>
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
print    "</table>";
print   " </body>";
print "</html>";
HTML