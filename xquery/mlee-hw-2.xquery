xquery version"3.1";
declare option saxon:output"method=html";
declare variable $data := doc('../xml/?select=CT1000_XML.xml');

<html>
<head>
    <title> Industry Report</title>
</head>
<body> 
    <h1> Industry Report</h1>
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Switch Number</th>
            <th>Distance from Altoona</th>
            <th>Location Type</th>
        </tr>
        {
            for $entry in $data//CT1000//entry[location/@type = "i"]
            let $distance := xs:decimal($entry/distance/@milepost)
            where $distance <= 20.0 
              and matches(string($entry/switch/@number), "3[0-9]{2}")
            order by $distance ascending
            return 
                <tr>
                    <td>{string($entry/location/@name)}</td>
                    <td>{string($entry/switch/@number)}</td>
                    <td>{$distance}</td>
                    <td>{string($entry/location/@type)}</td>
                </tr>
        }
    </table>
</body>
</html>
