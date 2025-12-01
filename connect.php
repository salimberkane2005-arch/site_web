 <?php
$host = "localhost";
$database = "boutique";
$username = "root";
$password = "";

$cnx = mysqli_connect($host, $username, $password, $database);

if (!$cnx) {
    die("Connexion MySQL échouée: " . mysqli_connect_error());
}
?>
