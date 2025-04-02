declare variable $data := collection('../xml/?select.*xml')/CT1000//entry/location[@name="Buck Run Branch"];
let $brb-location := /CT1000//entry/location[@name="Buck Run Branch"]
let $brb-location-count := $brb-location => count()
let $brb-type := $brb-location/@type
return (concat("'&#xA;In this railroad division, ", $brb-location, " is shown ", $brb-location-count, " times with it being a ", $brb-type, "."))