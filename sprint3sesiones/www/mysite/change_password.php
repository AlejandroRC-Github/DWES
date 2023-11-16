<?php
session_start();
$db = mysqli_connect('localhost', 'root', '1234', 'mysitedb') or die('Fail');

$usuario_id = $_SESSION['usuario_id'];
$contraseña_actual = $_POST['contraseña_actual'];
$nueva_contraseña = $_POST['nueva_contraseña'];

$query = "SELECT contraseña FROM tusuarios WHERE id = $usuario_id";
$result = mysqli_query($db, $query);
if ($result) {
    $row = mysqli_fetch_assoc($result);
    $contraseña_guardada = $row['contraseña'];

    if (password_verify($contraseña_actual, $contraseña_guardada)) }
        $hashed_nueva_contraseña = password_hash($nueva_contraseña, PASSWORD_DEFAULT);

        $update_query = "UPDATE tusuarios SET contraseña = '$hashed_nueva_contraseña' WHERE id = $usuario_id";
        if (mysqli_query($db, $update_query)) {
            echo "¡Contraseña actualizada exitosamente!";
        } else {
            echo "Error al actualizar la contraseña: " . mysqli_error($db);
        }
    } else {
        echo "La contraseña actual es incorrecta.";
    }
} else {
    echo "Error al obtener la contraseña actual: " . mysqli_error($db);
}

mysqli_close($db);
?>
