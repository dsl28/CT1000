declare variable $data := collection ('../xml/?select.*xml');
<html>
<head>
    <title>Pittsburgh Division</title>
    <h1>Switches</h1>
</head>
<body>
    <p>&nbsp</p>
    <p>The Pittsburgh Division Railroad Tracks has some switches associated with their location.</p>
    <p>Consult the table below to see the different types of switches mentioned.</p>
    <p>&nbsp</p>
    <table>
        <tr>
            <th>Switch Number</th>
            <th>Switch Location</th>
            <th>Milepost</th>
        </tr>
        {  
            for $entry in $data//CT1000//entry[switch/@number]
            let $distance := xs:decimal($entry/distance/@milepost)
            where matches(string($entry), "[0-9]{4}[A-Z]^?")
            order by $distance descending
            return
                <tr>
                    <td>{string($entry/switch/@number)}</td>
                    <td>{string($entry/location/@name)}</td>
                    <td>{$distance}</td>
                </tr>
        )
    </table>
</body>
</html>