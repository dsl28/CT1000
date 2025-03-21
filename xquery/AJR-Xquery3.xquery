xquery version "3.1";
declare option saxon:output "method=html";

<html>
    <head>
        <title>station names</title>
    </head>
    
    <body>
     <h1>list of Pennsylvania Railroad Pittsburgh Division stations </h1>
     <ul>
        {
     
    declare variable $source-files:=('..xml/CT1000.xml/?select*.xml');
    declare variable $station := //entry[location/@type="station"];
    declare variable $station-name:= //entry[location/@type="station"@name=""];
    
    let $station := $source-files:=('..xml/CT1000.xml/?select*.xml'); 
    let $station := //entry[location/@type="station"]; :)
    child::return <li>{&#xa;($station-name:= //entry[location/@type="station"@name=""];)}</li>
}
</ul>

</body>   
    
    
    
    
    

    
    }
    </body>
