?php
$db = mysqli_connect ('localhost', 'root', '1234', 'mysitedb') or die ('Fail');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre = $_POST['nombre'];
    $apellidos = $_POST['apellidos'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];

    if (empty ($nombre) || empty ($apellidos) || empty ($email) || empty ($pass>
        echo "Por favor, completa todos los campos.";
    } elseif ($password !== $confirm_password) {
        echo "Las contraseñas no coinciden.";
    } else {
        $query = "SELECT id FROM tusuarios WHERE email = '$email'";
        $result = mysqli_query($db, $query);
        if (mysqli_num_rows($result) > 0) {
            echo "El correo ya está registrado.";
        } else {
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);

            $insert_query = "INSERT INTO tusuarios (nombre, apellidos, email, c>
            mysqli_query($db, $insert_query);

            header ('Location: main.php');
            exit ();
        }
    }
}

mysqli_close($db);
?>
