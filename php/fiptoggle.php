<?php
$command = '/bin/systemctl is-active kitchenradio-fip.service';
include "fipexec.php";

$unit_state = $output[0];
if ($unit_state == "active") {
    include "fipoff.php";
}
else {
    include "fipon.php";
}
?>
