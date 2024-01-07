use strict;
use warnings;
use CGI;
use DBI;

my $q = CGI->new;
$q->charset("UTF-8");
print $q->header("text/html");

print <<HTML;
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Por año</title>
    </head>
HTML
my $year = $q->param('year');

my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:MariaDB:database=pweb1;host=192.168.56.101";
my $dbh =DBI->connect($dsn, $user, $password) or die ("ERROR!");

my $sth = $dbh->prepare("SELECT * FROM Movie WHERE Year=$year");
$sth->execute();

print <<HTML;
    <body >
        <h1>Pelicula  $year</h1>
        <table>
            <tr>
                <th>ID_MOVIE</th>
                <th>TITLE</th>
                <th>YEAR</th>
                <th>SCORE</th>
                <th>VOTES</th>
            </tr>
HTML
my @fila = $sth->fetchrow_array;

if(@fila){
    fillTable(@fila);
    while (@fila = $sth->fetchrow_array) {
        my @fila = @_;
        print "<tr>\n";
        foreach my $cel (@fila){
            print "<td>$cel</td>\n";
        }
        print "</tr>\n";
    }
}else{
    print "<p>NO EXISTE</p>\n";
}

$sth->finish;
$dbh->disconnect;
print <<HTML;
    </table>
    </body>
</html>
HTML
