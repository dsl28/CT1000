declare variable $data := collection('../xml/?select.*xml');
declare variable $entry := /CT1000//entry;
declare variable $location := $entry/location;
declare variable $stations := $location[@type="station"]/text();
declare variable $unnamed-stations := $location[@name="(Station)"];
declare variable $station-count := count($stations);
declare variable $un-st-count := count($unnamed-stations);
declare variable $xspacer := 100;
declare variable $yspacer := 20;

<svg xmlns="http://www.w3.org/2000/svg" width="500" height="400">
    <text x="100" y="40" font-size="24">Stations: Total + Unnamed Stations</text>
    
    <line x1="100" y1="100" x2="{100 + ($station-count * $yspacer)}" y2="100" stroke="#d5cbc0" stroke-width="5"/>
    <text x="{100 + ($station-count * $yspacer) + 10}" y="105" font-size="16">Total ({$station-count})</text>

    <line x1="100" y1="150" x2="{100 + ($un-st-count * $yspacer)}" y2="150" stroke="#6f6559" stroke-width="5"/>
    <text x="{100 + ($un-st-count * $yspacer) + 10}" y="155" font-size="16">Unnamed ({$un-st-count})</text>

    <line x1="80" y1="170" x2="550" y2="170" stroke="black" stroke-width="2"/>
</svg>
