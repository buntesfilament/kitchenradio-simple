<?php
$command = 'sudo /bin/systemctl stop kitchenradio-fip.service';

// execute the command
$output = [];
$returnVar = 0;
exec($command, $output, $returnVar);

// check the result
if ($returnVar === 0) {
    echo "Command executed successfully: " . implode("\n", $output);
} else {
    echo "Error executing command: " . implode("\n", $output);
}
?>
