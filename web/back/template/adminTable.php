<?php
$red = "background-color:red;color:white;";
$yellow = "background-color:yellow;color:black;";
$green = "background-color:#91ff91;color:black;";
?>
<html>
    <body>
    <a href="/wocc/back/admin/">back</a>
        <table border="solid">
            <thead>
            <tr>
            <?php foreach($keys as $key){ ?>
            <th>
                <?php echo $key ?>
            </th>
            <?php } ?>
            </tr>
            </thead>
            <tbody>
            <?php foreach($res as $row){ ?>
            <tr 
            <?php
                if($mode == "member"){
                    if($row['hasNotPaidAmt']==null&&$row['hasPaidAmt']==null){
                        echo 'style="'.$red.'"';
                    }   
                    else if($row['hasPaidAmt']==null){
                        echo 'style="'.$yellow.'"';
                    }
                    else if($row['hasNotPaidAmt']!=null){
                        echo 'style="'.$green.'"';
                    }
                }
                else if($mode == "article")
                {
                    if($row['Paidtime']==null){
                        echo 'style="'.$yellow.'"';
                    }
                }
            ?>
            >
                <?php foreach($row as $val){ ?>
                    <td>
                        <?php echo $val ?>
                    </td>
                <?php } ?>
            </tr>
            <?php } ?>
            </tbody>
        </table>
    </body>
</html>
