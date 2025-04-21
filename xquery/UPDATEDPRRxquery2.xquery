declare variable $numBranches := 39;
declare variable $branchLen := 1050;
declare variable $branchSpacer := 100;
declare variable $bigCircleExtraSpacer := 100;
declare variable $mainLen := $numBranches * $branchSpacer + $bigCircleExtraSpacer;
declare variable $xShift := 100;
declare variable $yShift := 200;

<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1500 4180">>
    <desc></desc>
    <g alignment-baseline="baseline" transform="translate(200,0)">
        <text x='170' y='50' font-size="40" fill="#f0dc82">The Pennsylvania Railroad: Pittsburgh Division</text>
        <line x1='155' y1='62.6' x2='953' y2='62.6' stroke-width='3' stroke='#f0dc82'></line>
        <circle cx='165' cy='110' r="10"  stroke-width='5' fill="#f0dc82"></circle>
        <line x1="165" x2="165" y1="110" y2="{$mainLen}" stroke="#f0dc82" stroke-width="5"/>
        <g transform="translate(0, {$bigCircleExtraSpacer})">                
            {
                for $branchNum in 1 to $numBranches
                    let $branchY := $branchSpacer * $branchNum
                    let $branchName := //Q{}CT1000/Q{}branch[position()=$branchNum]/data(@name)
                    let $stations := //Q{}branch[data(@name)=$branchName]/Q{}entry/Q{}location[data(@type="station")]
                    let $numStations := count($stations)
                    
                    return
                    if ($numStations > 0) then
                    <g transform="translate(0, {$branchY})">
                        <circle cx="165" cy="0" r="9" fill="#f0dc82"/>
                        <text x="140" y="5" font-size="20" font-weight="bold" text-anchor="end" fill="#f0dc82">{$branchName}</text>
                        
                        <line x1="165" x2="{$branchLen}" y1="0" y2="0" stroke="#f0dc82" stroke-width="5"/>
                        {
                            let $stations := //Q{}branch[data(@name)=$branchName]/Q{}entry/Q{}location[data(@type="station")]
                            let $numStations := count($stations)
                            let $stations2 := //Q{}branch/Q{}branch/Q{}entry/Q{}location[data(@type="station")] (:ABC: this doesnt seem to work:)
                            let $numStations2 := count($stations2)
                            let $lineStart := 255
                            let $lineEnd := $branchLen
                            let $lineLength := $lineEnd - $lineStart
                            let $firstCircleX := xs:integer(round-half-to-even($branchLen div $numStations))

                            for $pos in 1 to $numStations
                                let $station := $stations[$pos]
                                let $stationName := data($station/@name)
                                let $station2 := $stations2[$pos]
                                let $stationName2 := data($station2/@name)
                                let $sfORdwe := $branchName = "South Fork" or $branchName = "Duquesne Way Elevated" (:ABC: added this rather than the if else SVG loop, for some reason the if else loop straight up never worked so I compromised with this:)
                                let $inverseL := if ($sfORdwe) then -45 else 45
                                let $inverseT := if ($sfORdwe) then 20 else -20
                                let $inverseT2 := if ($sfORdwe) then $inverseT - 45 else $inverseT + 45
                                let $circleX := if ($numStations = 1) then $lineStart
                                else $lineStart + (($lineLength * ($pos - 1)) div ($numStations - 1))
                                let $lineStart2 := 255
                                let $lineEnd2 := $branchLen
                                let $lineLength2 := $lineEnd2 - $lineStart2
                                let $circleX2 := if ($numStations2 = 1) then $lineStart2
                                else $lineStart2 + (($lineLength2 * ($pos - 1)) div ($numStations2 - 1))


                                return
                                <g>
                                    <circle cx="{$circleX}" cy="0" r="7" fill="#f0dc82"/>
                                    <text x="{$circleX}" y="{$inverseT}" font-size="11" font-weight="bold" text-anchor="middle" fill="#f0dc82">{$stationName}</text>
                                    <line x1="300" x2="355" y1="0" y2="{$inverseL}" stroke="#f0dc82" stroke-width="5"/>
                                    <line x1="354" x2="{$branchLen}" y1="{$inverseL}" y2="{$inverseL}" stroke="#f0dc82" stroke-width="5"/>
                                    <circle cx="{$circleX2 + 100}" cy="{$inverseL}" r="7" fill="#f0dc82"/>
                                    <text x="{$circleX2 + 100}" y="{$inverseT2}" font-size="11" font-weight="bold" text-anchor="middle" fill="white" stroke="white" stroke-width="3">{$stationName2}</text>
                                    <text x="{$circleX2 + 100}" y="{$inverseT2}" font-size="10.5" font-weight="bold" text-anchor="middle" fill="#f0dc82">{$stationName2}</text>
                                </g>
                        }
                    </g>
                    else
                    <g transform="translate(0, {$branchY})">
                        <circle cx="165" cy="0" r="9" fill="#f0dc82"/>
                        <text x="140" y="5" font-size="20" font-weight="bold" text-anchor="end" fill="#f0dc82">{$branchName}</text>
                    </g>
            }
        </g>
    </g>
</svg>