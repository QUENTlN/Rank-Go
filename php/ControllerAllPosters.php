<?php

include 'connect.php';


    

    $result = $dbh->prepare('CALL selectAllPost(:idCurUser)');
    $result->bindValue(':idCurUser', $_GET['id'], \PDO::PARAM_INT);
    $result->execute();
    $clientDb = $result->fetchAll();
    
    echo json_encode($clientDb);

?>['1']'