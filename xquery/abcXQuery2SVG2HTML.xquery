declare option saxon:output "method=html";
declare option saxon:output "doctype-system=about:legacy-compat";
declare variable $entry := collection("../xml/CT1000_XML.xml")/entry;
declare variable $location := $entry/location;
declare variable $stations := $location[@type="station"]/text();
declare variable $unnamed-stations := $location[@name="(Station)"];
declare variable $station-count := count($stations);
declare variable $un-st-count := count($unnamed-stations);
declare variable $xspacer := 100;
declare variable $yspacer := 20;
<html>
    <head>
        <title>The Pennsylvania Railroad: Stations</title>
    </head>
    <body>
        <h1>The Pennsylvania Railroad: Stations</h1>
        <h2>"A dataset for the different stations of the Pennsylvania Railroad"</h2>
        <p> </p>
        <p>The Pennsylvania Railroad has many location types, ranging from industries to junctions. However, one location in particular has to do with stations. There are quite a few stations found in the Pennsylvania Railroad, some differing from others.</p>
        <p>In the example below, the data shows all the stations located in the railroad, and ones that had no name in the entries of the Pennsylvania Railroad.</p>
        <p> </p>
        <table>
            <tr>
                <th>Total Stations</th>
                <th>Unnamed Stations</th>
            </tr>
            <tr>
                <td>{ $station-count }</td>
                <td>{ $un-st-count }</td>
            </tr>
        </table>
        <svg xmlns="http://www.w3.org/2000/svg" width="500" height="400">
            <text x="100" y="40" font-size="24">Stations: Total + Unnamed Stations</text>
    
            <line x1="100" y1="100" x2="{100 + ($station-count * $yspacer)}" y2="100" stroke="#d5cbc0" stroke-width="5"/>
            <text x="{100 + ($station-count * $yspacer) + 10}" y="105" font-size="16">Total ({$station-count})</text>

            <line x1="100" y1="150" x2="{100 + ($un-st-count * $yspacer)}" y2="150" stroke="#6f6559" stroke-width="5"/>
            <text x="{100 + ($un-st-count * $yspacer) + 10}" y="155" font-size="16">Unnamed ({$un-st-count})</text>

            <line x1="80" y1="170" x2="550" y2="170" stroke="black" stroke-width="2"/>
        </svg>
   </body>
</html>