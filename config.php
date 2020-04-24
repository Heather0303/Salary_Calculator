<?php
    // define('DB_SERVER', '167.114.226.192');
    // define('DB_USERNAME', 'absolud');
    // define('DB_PASSWORD', 'caro67a');
    // define('DB_DATABASE', 'block');
    // ----------------------- //
    define('DB_SERVER', 'localhost');
    define('DB_USERNAME', 'root');
    define('DB_PASSWORD', '');
    define('DB_DATABASE', 'simulator');

    $db = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_DATABASE);

    if (mysqli_connect_errno())
    {
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
    }

    mysqli_set_charset($db, "utf8");

    // mysqli_query($db, "DROP TABLE IF EXISTS fields, formulas, headercontent, users") or die('error removing table');
    // $query = '';
    // $sqlScript = file('simulator.sql');
    // foreach ($sqlScript as $key => $line)	{ 
    //     if($key<22)
    //     continue;
    //     $startWith = substr(trim($line), 0 ,2);
    //     $endWith = substr(trim($line), -1 ,1);
        
    //     if (empty($line) || $startWith == '--' || $startWith == '/*' || $startWith == '//') {
    //         continue;
    //     }
            
    //     $query = $query . $line;
    //     if ($endWith == ';') {
    //         mysqli_query($db,$query) or die('<div class="error-response sql-import-response">Problem in executing the SQL query <b>' . $query. '</b></div>');
    //         $query= '';		
    //     }
    // }
    // echo '<div class="success-response sql-import-response">SQL file imported successfully</div>';
?>
