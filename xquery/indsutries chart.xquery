xquery version "3.1";
declare option saxon:output "method=html";
declare variable $source-files:=('..xml/CT1000.xml/?select*.xml');
    declare variable $industries := //location[@type="industry"];
    
    
<html>
 
    <head>
        <title>Industries by Type</title>
    </head>
    
    <body>
    
     <!-- This may be useful for somehting else but not the SVG bar graph
    
    
     <h1>list of Pennsylvania Railroad Pittsburgh Division industries and types </h1>
     <table border="1">
    <tr>
     <th>Industry Name</th>
     <th></th>
    </tr>
    
    <tr> 
        {
     for $industry in $industries
    let $industry-name:= $industry/data(@name)
    return <td>{$industry-name}</td>
}
   

        {
      for $industry in $industries
    let $industry-type:= $industry/data(@itype)
    return <td>{$industry-type}</td>
}

    </tr>
    </table>
    -->
    
    
    <table>
    <tr>
     <th>Industry type</th>
     <th>number of type</th>
    </tr>
    <tr>
        {
      for $industry in $industries
    let $industry-type:= $industry/data(@itype)
    return <td>{$industry-type}</td>
}
    
     {
      for $industry in $industries
    let $industry-type-count:= $industry/data(@itype)=>count()
    return <td>{$industry-type-count}</td>
}

</tr>
</table>
</body>   
</html>
    