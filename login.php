<?php
// Conectando y seleccionando la base de datos  
$dbconn = pg_connect("host=localhost dbname=firstdb user=root password=root*18")
    or die('No se ha podido conectar con la base de datos' . pg_last_error());

// Realizando la consulta SQL
$name = $_POST["inputUser"];
$pass = $_POST["inputPassword"];

$query = pg_query($dbconn,"SELECT * FROM access1 WHERE access1.name = '$name' and access1.pass = '$pass'");
$nr= pg_num_rows($query);

// Imprimiendo los resultados
if($nr == 1)
{
	echo "Welcome, $name";
}
else if ($nr == 0) 
{
	echo "Incorrect Credentials"; 
}

// Cerrando la conexión
pg_close($dbconn);
?>
