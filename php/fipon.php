<?php
$command = 'sudo /bin/systemctl start kitchenradio-fip.service';
$state = "on";
include "fipexec.php";

include "fipresponse.php";
?>
