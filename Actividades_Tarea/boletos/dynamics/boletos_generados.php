<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="../statics/ticket.png" type="image/x-icon">
    <title>Your tickets</title>
</head>
<body>
<?php

    //Saving inputs in variables we can handle
    $name = (isset($_POST["name"]) && $_POST["name"] != "") ? $_POST["name"] : "No especifica";
    $lastN = (isset($_POST["lastN"]) && $_POST["lastN"] != "") ? $_POST["lastN"] : "No especifica";
    $age = (isset($_POST["age"]) && $_POST["age"] != "") ? $_POST["age"] : "No especifica";
    $address = (isset($_POST["address"]) && $_POST["address"] != "") ? $_POST["address"] : "No especifica";
    $numTickets = (isset($_POST["numTickets"]) && $_POST["numTickets"] != "") ? $_POST["numTickets"] : "No especifica";
    $ticketType = (isset($_POST["ticketType"]) && $_POST["ticketType"] != "") ? $_POST["ticketType"] : "No especifica";
    
    // //Checking we have recieved them.
    // echo "Nombre: $name <br>
    //     Last names: $lastN <br>
    //     Age: $age <br>
    //     Adsdress: $address <br>
    //     Number of tickets: $numTickets <br>
    //     Ticket type: $ticketType <br>";
    
    //Variables
    $images = [
        "FLASH_PASS" => '<img src="../statics/fast_snail.png" alt="Fast snail" width="300">',
        "CLASSIC" => '<img src="../statics/classic.png" alt="Classic logo" width="300">',
        "CLASSY" => '<img src="../statics/classy.png" alt="Classy fancy penguin" width="300">',
        "ADVENTURE" => '<img src="../statics/fun.png" alt="Air ballon" width="300">',
        "FREE_FOOD" => '<img src="../statics/icee.png" alt="Icee drink" width="300">'
    ];
    $messege = [
        "FLASH_PASS" => 'Chop chop',
        "CLASSIC" => 'Ya te la sandwich',
        "CLASSY" => 'Ayayayay',
        "ADVENTURE" => 'Let\'s goooo',
        "FREE_FOOD" => 'We all need Tacos'
    ];

    //General table
    $general_table = '<table cellpadding = "5px" border = 1 align = "center" style = "border-collapse: collapse;">
                        <thead>
                            <tr>
                                <th colspan = "4"><h1>Seven Flags</h1></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Name:<br><br> '.$name.'</td>
                                <td>Last names:<br><br> '.$lastN.'</td>
                                <td>Age:<br><br> '.$age.'</td>
                                <td rowspan = "3">'.$images[$ticketType].'</td>
                            </tr>
                            <tr>
                                <td>Address:<br><br>'.$address.'</td>
                                <td>Number of tickets:<br><br> '.$numTickets.'</td>
                                <td>Type of ticket:<br><br> '.$ticketType.'</td>
                            </tr>
                            <tr>
                                <td colspan = "3" align = "center"><h3>'.$messege[$ticketType].'</h3></td>
                            </tr>
                        </tbody>
                    </table>';
    if($numTickets > 0 && $numTickets < 16)
        for($i = 0; $i < $numTickets; $i++)
            echo $general_table."<br>";
    else if($numTickets < 1)
        echo "<h2>You did not ask for tickets</h2>";
    else
        echo "<h2>You cannot buy more than 15 tickets.</h2>";
    
?>
    
</body>
</html>