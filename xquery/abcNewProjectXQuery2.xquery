declare variable $data := collection('../xml/?select.*xml');
let $entry := /CT1000//entry
let $certain-entry := $entry[location[@type="station"]/text()][n]
let $location := $entry/location
let $location-count := count($location)
let $stations := $location[@type="station"]/text()
let $station-count := count($stations)
for $ent at $pos in $entry
where $ent/location[@type="station"]
    return (concat("&#xa;", "There are ", $station-count, " stations. The ", $stations," station is at the ", $pos, "th entry."))
   
    (:This XQuery lists the count of every station, and lists how many stations there are, and specifically lists the name of the station and the entry number it is at.:)