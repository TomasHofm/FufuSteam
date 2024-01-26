<?php
 $servername = "localhost";

$username = "student12";

$password = "spsnet";

$dbname = "vyuka12";

$conn = new mysqli($servername, $username, $password, $dbname);


if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
 if ($conn->set_charset("utf8mb4") === false) {

        die("Nepodařilo se nastavit kódování: " . $conn->error);

    }
$successMessage = "";
$errorMessage = "";
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST["email"];
    $username = $_POST["username"];
     $password = $_POST["password"];

    if (strlen($username) < 2) {
        $errorMessage = "Jméno musí mít 3 a více znaků.";
    } elseif (strlen($password) < 7) {
        $errorMessage = "Heslo musí mít minimálně 8 znaků.";
    } else {
        $hashedPassword = password_hash($password, PASSWORD_BCRYPT);

    $sql = "INSERT INTO users (email,username, password) VALUES ('$email','$username', '$hashedPassword')";

    if ($conn->query($sql) === TRUE) {
        $successMessage = "Registrace úspěšná!";
        header("refresh:2;url=login.php");
    } else {
        $successMessage = "Error: " . $sql . "<br>" . $conn->error;
    }
}
}
$conn->close();
?>


<html>

<head>
    <link rel="stylesheet" type="text/css" href="login_register.css">
    <title>FUFUSTEAM - Register</title>
</head>

<body>
    <header>
        <div class="header-logo">
            <img src="FufuSteamLogo.png" alt="Steam Logo">
        </div>
        <nav>
            <ul>
                <li><a href="Fufusteam.html">Home</a></li>
                <li><a href="Fufusteam.html">Store</a></li>
                <li><a href="Fufusteam_Library.html">Library</a></li>
                <li><a href="Fufusteam_Community.html">Cummunity</a></li>
                <li><a href="Fufusteam_Support.html">Support</a></li>
                <li><a href="Fufusteam_Login.html">Login</a></li>
            </ul>
        </nav>
    </header>

    <div class="content">
        <main class="main-content">
            <div id="register-form">
                <h2>Register</h2>
                <form>
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email">

                    <label for="register-username">Username:</label>
                    <input type="text" id="register-username" name="register-username" placeholder="Choose a username">

                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password">

                    <button type="submit">Register</button>
                </form>
            </div>
        </main>
    </div>

    <footer>
        <p>&copy; FUFUSTEAM</p>
    </footer>
</body>

</html>