
(: For clause picking the document :)
for $entry in doc("CT1000_XML.xml")/CT1000//entry[location/@itype = "coal"]

(: Let clause making it into a number:)
let $distance := xs:decimal($entry/distance/@milepost)

(: Where clause flitering out everything that is not wanted :)
where $distance <= 20.0 and matches($entry/switch/@number, "^3[0-9]{2}$")

(: Order by clause makes it ascending :)
order by $distance ascending

(: Return clause :)
return <coal-industry>
    <name>{$entry/location/@name/string()}</name>
    <switch-number>{$entry/switch/@number/string()}</switch-number>
    <distance-from-altoona>{$distance}</distance-from-altoona>
    <location-type>{$entry/location/@type/string()}</location-type>
</coal-industry>