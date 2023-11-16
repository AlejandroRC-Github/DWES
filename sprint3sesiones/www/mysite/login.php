?php
$db = mysqli_connect('localhost', 'root', '1234', 'mysitedb') or die('Fail');
$email_posted = $_POST['f_email'];
$password_posted = $_POST['f_password'];

$query = "SELECT id, contraseña FROM tusuarios WHERE email = '$email_posted'";
$result = mysqli_query($db, $query) or die('Query error');

if (mysqli_num_rows($result) > 0) {
    $only_row = mysqli_fetch_array($result);
    $stored_password = $only_row['contraseña'];

        if (password_verify($password_posted, $stored_password)) {
        session_start();
        $_SESSION['user_id'] = $only_row['id'];
        header('Location: main.php');
        exit();
    } else {
        echo '<p>Contraseña incorrecta</p>';
    }
} else {
    echo '<p>Usuario no encontrado con ese email</p>';
}

mysqli_close($db);
?>

