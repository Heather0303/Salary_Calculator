<?php 
	include('config.php');
	$text = $_POST['text'];
	$id = $_POST['id'];

	$query = mysqli_query($db,'SELECT * FROM headercontent');
	$result = mysqli_fetch_array($query, MYSQLI_ASSOC);
	
	if ($result) {
		mysqli_query($db, 'UPDATE headercontent SET content="' . $text . '" WHERE id='.$id);
	} 
?>