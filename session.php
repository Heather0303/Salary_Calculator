<?php
    include('config.php');
    session_start();
   
    $user_check = $_SESSION['login_user'];
    $role_check = $_SESSION['login_role'];
    $ses_sql = mysqli_query($db, "select username, role from users where username = '$user_check' AND role = '$role_check' ");
    $row = mysqli_fetch_array($ses_sql, MYSQLI_ASSOC);
    $login_user = $row['username'];
    $login_role = $row['role'];

    if (!isset($_SESSION['login_user'])) {
        header("location:login.php");
        die();
    }
?>
