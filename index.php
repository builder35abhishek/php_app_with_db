<html>
<head><title>MedicalDataSharing</title></head>
<body>
<marquee><h1>MDS Records</h1></marquee>
<?php

define('DB_SERVER','my_host_ip');
define('DB_USERNAME', 'my_user_name');
define('DB_PASSWORD', 'my_password');
define('DB_DATABASE', 'my_db_name'); //where customers database
$db = mysqli_connect(DB_SERVER,DB_USERNAME,DB_PASSWORD,DB_DATABASE);

$query="select * from patients"; // Fetch all the records from the table address
$result=mysqli_query($db,$query);

?>


<h3>Patients Records: </h3>

<table border="1">
<tr>
<th> ID </th>
<th> FirstName </th>
<th> LastName </th>
<th> Contact </th>
<th> MedicalIssue </th>
<th> RegDate </th>
</tr>

<?php while($array=mysqli_fetch_row($result)): ?>
<tr>
<td><?php echo $array[0];?></td>
<td><?php echo $array[1];?></td>
<td><?php echo $array[2];?></td>
<td><?php echo $array[3]?></td>
<td><?php echo $array[4];?></td>
<td><?php echo $array[5];?></td>
</tr>

<?php endwhile; ?>
<?php mysqli_free_result($result); ?>
<?php mysqli_close($db); ?>
</table>
</body>
</html>
