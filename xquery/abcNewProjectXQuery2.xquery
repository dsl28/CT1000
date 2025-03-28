declare variable $data := collection('../xml/?select.*xml');
let $entry := /CT1000//entry
let $certain-entry := $entry[location[@type="station"]][n]
let $location := $entry/location
let $location-count := count($location)
let $stations := $location[@type="station"]
let $station-count := count($stations)
for $ent at $pos in $entry
where $ent/location[@type="station"]
    return (concat("&#xa;", " There are ", $station-count, " stations. The ", $stations," station is at the ", $pos, "th entry."))
    (: This XQuery lists all the stations, and singles out stations where they have not been assigned a formal name, and lists what entry that station is at as well:)