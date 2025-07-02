<?php
        echo "
        <form action='./descargar.php' method='POST'>
            <fieldset style='width: 400px;'>
                <legend>Curso web</legend>
                <label>Semana</label>
                <select name='semana'>
                    <option value='1'>Semana 1</option>
                    <option value='2'>Semana 2</option>
                    <option value='3'>Semana 3</option>
                </select>
                <br/><br/>
                <input type='submit'>
                <input type='reset'>
            </fieldset>
        </form>";
?>