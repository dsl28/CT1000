declare variable $data := collection('../xml/?select.*xml');
let $entry := /CT1000//entry
let $certain-entry := $entry[location[@name="(Station)"]][n]
let $location := $entry/location
let $location-count := count($location)
let $stations := $location[@type="station"]/text()
let $station-count := count($stations)
let $un-stations := $location[@name="(Station)"]/text()
let $un-st-count := count($un-stations)
for $ent at $pos in $entry
where $ent/location[@name="(Station)"]
    return (concat("&#xa;", "Out of ", $station-count, " stations, there are ", $un-st-count, " unnamed stations, where one of them is at the ", $pos, "th entry."))
    
    (:This XQuery lists the count of every station, and lists how many unnamed stations there are and lists what entry number said station is at:)