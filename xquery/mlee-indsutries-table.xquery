xquery version"3.1";
declare option saxon:output"method=html";
declare variable $data := doc('../xml/CT1000_XML.xml');

<html>
<head>
    <title> Industry Report</title>
</head>
<body> 
    <h1> Industry Report</h1>
    <table border="1">
        <tr>
            <th>Name</th>           
            <th>Industry Type</th>
        </tr>
        {
            for $entry in $data//CT1000//entry[location/@itype]            
            return 
                <tr>
                    <td>{string($entry/location/@name)}</td>         
                    <td>{string($entry/location/@itype)}</td>
                </tr>
        }
    </table>
</body>
</html>
