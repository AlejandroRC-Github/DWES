
<?php

	$db = mysqli_connect('localhost','root','1234','mysitedb') or die ('Fail');
?>
<html>
<head>

<style>
h1{
font-size: 40px;
font-family; Arial black, sans-serif , Gadget;
text-align: center;
}

table{

font-family: Arial black , sans-serif;
border-collapse: collapse;
widht: 100%;
borde: 3px solid #dddddd;
}

th,td{
border: 3px dolid #dddddd;
text-align: left;
padding:8px;
}

th{
background-color:#ffffff;
}

.game-image{
max-width: 180px;
}
</style>
</head>

<body>
<h1>Mejores títulos a los que he jugado</h1>
<table>
<tr>
<th>Id</th>
<th>Nombre</th>
<th>Imagen</th>
<th>año_salida</th>
<th>descripcion</th>
</tr>

<?php
$query = 'SELECT * FROM tjuegos';
$result = mysqli_query($db,$query) or die ('Query error');
while ($row = mysqli_fetch_array($result)){
echo '<tr>';
echo '<td>' . $row['id'] . '</td>';
echo '<td><a href="detail.php?id=' . $row['id'] . '">'. $row['nombre'] . '</a></td>';
echo '<td><img src="' . $row['url_imagen'] . '" class="game-image"></td>';
echo '<td>' . $row['año_salida'] . '</td>';
echo '<td>' . $row['descripcion'] . '</td>';
}

mysql_close($db);
?>
</table>
</body>
</html>

