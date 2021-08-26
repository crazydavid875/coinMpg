<?php
$action = filter_input(INPUT_GET, 'action', FILTER_SANITIZE_STRING);
$arg1 = filter_input(INPUT_GET, 'arg1', FILTER_SANITIZE_STRING);
$arg2 = filter_input(INPUT_GET, 'arg2', FILTER_SANITIZE_STRING);

echo $action;
echo '<br />';
echo $arg1;
echo '<br />';
echo $arg2;
