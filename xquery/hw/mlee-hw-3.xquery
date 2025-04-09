xquery version"3.1";
declare option saxon:output "method=html";
declare option saxon:output "doctype-system=about:legacy-compat";
declare variable $data := doc('../xquery/homework/./xml/?select=.xml');
declare variable $xspacer := 10;
declare variable $yspacer := 25;

<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
    <g treansform="translate(150,100)">
    <g>
    <text x="0" y="-5" font-size="20px" fill="black"> Industry Report </text>
    </g>
    <g>
        {
            for $entry in $data//Q{}CT1000//Q{}entry[location/@itype = "coal"]
            let $distance := xs:decimal($entry/Q{}distance/@milepost)
            where $distance <= 20.0 
              and matches(string($entry/Q{}switch/@number), "3[0-9]{2}")
            order by $distance ascending
            return 
                <g>
                    <text x="-75" y="{ $entry * $yspacer +5}" font-size="12px" fill="black"> {$entry}</text>
                    <line x1="0" y1="{ $entry * $yspacer}" x2="{$distance * $xspacer}" y2="{ $entry * $yspacer}"/>
          
                    <text x="{$distance * $xspacer + 10}" y="{$entry * $yspacer + 5}" font-size="12px" fill="black">{$distance}</text>
                    <line x1="0" y1="0" x2="0" y2="{max($entry +1) * $yspacer}" stroke="black" stroke-width="2"/>
                    
                </g>
        }
        </g>
    </g>
</svg>
</html>