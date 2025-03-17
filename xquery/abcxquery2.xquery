declare default element namespace "http://www.tei-c.org/ns/1.0";
(: With our project, our XML needs fine tuned in which we will get done here very soon, as of now, I cannot use FLWOR statements on this XML, however I attempted to do some IF the XML would be corrected. :)

collection('data/')/CT1000/switch/entry/location[@name="Ebensburg"]
(:let $eben-location := /CT1000/switch/entry/location[@name="Ebensburg"]
return $eben-location:)

(:let $eben-location := /CT1000/switch/entry/location[@name="Ebensburg"]
let $eben-location-count := $eben-location => count()
return $eben-location:)

(:let $eben-location := /CT1000/switch/entry/location[@name="Ebensburg"]
let $eben-location-count := $eben-location => count()
return (concat("In this railroad division, ", $eben-location, " is shown ", $eben-location-count, " times.")):)

(:let $branch := /CT1000/page/branch
let $entrys := $branch/entry
let $entry-count := $entrys => count()
for $entry in $entrys
    return (concat("&#xa;" , "There are ", $entry-count, " entries in the ", $branch, " branch.")):)
    
(:let $branch := /CT1000/page/branch
let $entrys := $branch/entry
let $entry-count := $entrys => count()
for $entry in $entrys
where $entrys > 2
    return (concat("&#xa;" , "There are ", $entry-count, " entries in the ", $branch, " branch.")):)
    
(:let $branch := /CT1000/page/branch
let $entrys := $branch/entry
let $entry-count := $entrys => count()
for $entry in $entrys
where $entry > 2
order by $entry-count ascending
    return (concat("&#xa;" , "There are ", $entry-count, " entries in the ", $branch, " branch.")):)