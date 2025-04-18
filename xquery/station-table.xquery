xquery version"3.1";
declare option saxon:output"method=html";
declare variable $data := doc('../xml/CT1000_XML.xml');

<html>
<head>
        
    <title> Industries </title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link type="text/css" href="style.css" rel="stylesheet" />
   </head>
    
    <body>
        <div id="menu">
            <a href="index.html">Home</a> | <a href="about.html">About Project CT1000:</a> | <a href="team.html">Meet Our Team!</a> | <a href="map.html">Route Map:</a> | <a href="graphs.html">Graphs and Data:</a> | <a href="industries.html">Industries:</a>
        </div>
    <h1> Industries of the Pittsburgh Division:</h1>
    <table border="1">
        <tr>
            <th>Name</th>           
            <th>Milepost</th>
        </tr>
        {
            for $entry in $data//CT1000//entry[location/@type] 
            where $entry//@type="station"
            return 
                <tr>
                    <td>{string($entry/location/@name)}</td>         
                    <td>{string($entry/distance/@milepost)}</td>
                </tr>
        }
    </table>
</body>
</html>
