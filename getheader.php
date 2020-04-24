<?php 
	include('config.php');
	$id = $_POST['edit_id'];
	$query = mysqli_query($db,'SELECT * FROM headercontent WHERE id = ' . $id);
	$result = mysqli_fetch_array($query, MYSQLI_ASSOC);
	echo json_encode($result);
?>