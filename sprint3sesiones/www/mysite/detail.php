<?php
        session_start();        
        $db = mysqli_connect('localhost','root','1234','mysitedb') or die ('Fail');
?>

<html>
<head>
<style>
img{
width: 400px;
height: 250px;
}
</style>
</head>
<body>
<?php
if (!isset($_GET['id'])){
die ('no se ha especificado un juego');
}

$juego_id = $_GET ['id'];
$query  = 'SELECT * FROM tjuegos WHERE id =' . $juego_id;
$result = mysqli_query($db, $query) or die ('Query error');
$game_data = mysqli_fetch_array($result);
echo '<img src="' . $game_data['url_imagen'] . '" id = "game-image"/>';
echo '<h1>' . $game_data['nombre'] . '</h1>';
echo '<p>' . $game_data['año_salida'] . '</p>';
echo '<p>' . $game_data['descripcion'] . '</p>';
?>

<h3> Comentarios: </h3>
<form action ="/comment.php" method="post">
<textarea rows="4" cols="50" name="new_comment"></textarea><br>
<input type ="hidden" name="juego_id" value="<?php echo $juego_id; ?>">
<input type="submit" value="comentar">
</form>
<ul>
<?php
$query_comments = 'SELECT * FROM tcomentarios WHERE juego_id=' . $juego_id;
$result_comments = mysqli_query($db,$query_comments) or die ('Query error');
while ($comment_row = mysqli_fetch_array($result_comments)){
echo '<li>' . $comment_row['comentario'].'</li>';
}
mysqli_close($db);
?>
</ul>
<a href="logout.php">Cerrar Sesion</a>
</body>
</html>
