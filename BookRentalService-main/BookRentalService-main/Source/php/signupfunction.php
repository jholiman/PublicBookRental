<?php
    session_start();


        $info = checkDatabase();
        $email = $info["email"];
        $password = $info["password"];
        
        $conn = $info["connection"];

        //check email to see if it is used
        $login_attempt1 = mysqli_query($conn, "select * from user where email='$email'");
        $result1 = mysqli_fetch_assoc($login_attempt1);

        if($result1 == 0) {
            $query = mysqli_query($conn, "insert into user (pwd, email) values ('$password', '$email')");


            $_SESSION["email"] = $email;
            $_SESSION["psw"] = $password;

            mysqli_close($conn);
        } 
        else { // email is already in use
            mysqli_close($conn);
        }

    function checkDatabase() {
        require_once("connect.php");

        $email = $_POST["email"];
        $password = $_POST["psw"];

        $info = array();
        $info["email"] = $email;
        $info["password"] = $password; 
        $info["connection"] = $conn;

        return $info;
    }
?>
