xquery version "3.1";
declare option saxon:output "method=html";
declare variable $source-files:=('..xml/CT1000.xml/?select*.xml');
    declare variable $stations := //location[@type="station"];
   
<html>
    <head>
        <title>station names</title>
    </head>
    
    <body>
     <h1>list of Pennsylvania Railroad Pittsburgh Division stations </h1>
     <ul>
        {
     for $station in $stations
    let $station-name:= $station/data(@name)
    return <li>{$station-name}</li>
}
</ul>

</body>   
</html>
    
    
    
    

    

