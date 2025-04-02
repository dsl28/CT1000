xquery version "3.1";
declare option saxon:output "method=html";
declare variable $source-files:=('..xml/CT1000.xml/?select*.xml');
    declare variable $stations := //location[@type="station"];
    declare variable $station-MP := //entry/location[@type="station"]/distance[@milepost=""];
    declare variable $mileposts := //distance[@milepost=""];
   
<html>
    <head>
        <title>station names</title>
    </head>
    
    <body>
     <h1>list of Pennsylvania Railroad Pittsburgh Division stations </h1>
     <table border="1">
    <tr>
     <th>Station</th>
     <th>Milepost</th>
    </tr>
    <tr>
    <td> 
        {
     for $station in $stations
    let $station-name:= $station/data(@name)
    return <li>{$station-name}</li>
}
    </td>
    </tr>
     <tr>
    <td> 
        {
     for $station-mile in $station-MP
    let $mile:= $station-mile/data(@name)
    return <li>{$mile}</li>
}
    </td>
    </tr>
    </table>
</body>   
</html>
    
    
    
    

    

