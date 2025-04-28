declare variable $numBranches := 39;
declare variable $branchLen := 1050;
declare variable $branchSpacer := 100;
declare variable $bigCircleExtraSpacer := 100;
declare variable $mainLen := $numBranches * $branchSpacer + $bigCircleExtraSpacer;
declare variable $xShift := 100;
declare variable $yShift := 200;

<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1500 4180">
    <g alignment-baseline="baseline" transform="translate(200,0)">
        <text x='170' y='50' font-size="40" fill="#f0dc82">The Pennsylvania Railroad: Pittsburgh Division</text>
        <line x1='155' y1='62.6' x2='953' y2='62.6' stroke-width='3' stroke='#f0dc82'></line>
        <circle cx='165' cy='110' r="10"  stroke-width='5' fill="#f0dc82"></circle>
        <line x1="165" x2="165" y1="110" y2="{$mainLen}" stroke="#f0dc82" stroke-width="5"/>
        <g transform="translate(0, {$bigCircleExtraSpacer})"> 
            {
                (: ABC: I had to revamp ALL of this, each circle was based only off for $pos in 1 to $numStations, so I had to make something seperate for all of them.:)
                for $branchNum in 1 to $numBranches
                let $branchY := $branchSpacer * $branchNum
                let $branchName := //Q{}CT1000/Q{}branch[position()=$branchNum]/data(@name)
                let $stations := //Q{}branch[data(@name)=$branchName]//Q{}location[@type="station"]
                let $stations2 := //Q{}branch[data(@name)=$branchName]/Q{}branch//Q{}location[@type="station"]
                let $stations3 := //Q{}branch[data(@name)=$branchName]/Q{}branch/Q{}branch//Q{}location[@type="station"]
                let $stations4 := //Q{}branch[data(@name)=$branchName]/Q{}branch/Q{}branch/Q{}branch//Q{}location[@type="station"]
                let $numStations := count($stations)
                let $numStations2 := count($stations2)
                let $numStations3 := count($stations3)
                let $numStations4 := count($stations4)
                let $lineStart := 255
                let $lineEnd := $branchLen
                let $lineLength := $lineEnd - $lineStart
                let $lineStart2 := 355
                let $lineEnd2 := $branchLen
                let $lineLength2 := $lineEnd2 - $lineStart2
                let $lineStart3 := 414
                let $lineEnd3 := $branchLen
                let $lineLength3 := $lineEnd3 - $lineStart3
                let $lineStart4 := 464
                let $lineEnd4 := $branchLen
                let $lineLength4 := $lineEnd4 - $lineStart4
                let $sfORdwe := $branchName = "South Fork" or $branchName = "Duquesne Way Elevated"
                let $inverseL := if ($sfORdwe) then -45 else 45
                let $inverseT := if ($sfORdwe) then 20 else -20
                let $inverseT2 := if ($sfORdwe) then $inverseT - 45 else $inverseT + 45
                let $inverseT3 := if ($sfORdwe) then $inverseT - 70 else $inverseT + 70
                let $inverseT4 := if ($sfORdwe) then $inverseT - 95 else $inverseT + 95
                let $y1 := 0
                let $y2 := if ($sfORdwe) then -45 else 45
                let $y3 := if ($sfORdwe) then -100 else 100
                let $y4 := if ($sfORdwe) then -145 else 145
                
                return
                if ($numStations > 0) then
                    <g transform="translate(0, {$branchY})">
                        <circle cx="165" cy="0" r="9" fill="#f0dc82"/>
                        <text x="140" y="5" font-size="20" font-weight="bold" text-anchor="end" fill="#f0dc82">{$branchName}</text>
                        <line x1="165" x2="{$branchLen}" y1="0" y2="0" stroke="#f0dc82" stroke-width="5"/>
                        <line x1="300" x2="355" y1="{$y1}" y2="{$y2}" stroke="#f0dc82" stroke-width="5"/>
                        <line x1="355" x2="{$branchLen}" y1="{$y2}" y2="{$y2}" stroke="#f0dc82" stroke-width="5"/>
                        <line x1="355" x2="414" y1="{$y2}" y2="{$y3}" stroke="#f0dc82" stroke-width="5"/>
                        <line x1="414" x2="{$branchLen}" y1="{$y3}" y2="{$y3}" stroke="#f0dc82" stroke-width="5"/>
                        <line x1="414" x2="464" y1="{$y3}" y2="{$y4}" stroke="#f0dc82" stroke-width="5"/>
                        <line x1="464" x2="{$branchLen}" y1="{$y4}" y2="{$y4}" stroke="#f0dc82" stroke-width="5"/>

                        <g>
                            {
                                for $pos in 1 to $numStations
                                let $station := $stations[$pos]
                                let $stationName := data($station/@name)
                                let $circleX := if ($numStations = 1) then $lineStart else $lineStart + (($lineLength * ($pos - 1)) div ($numStations - 1))
                                return (
                                    <circle cx="{$circleX}" cy="0" r="7" fill="#f0dc82"/>,
                                    <text x="{$circleX}" y="{$inverseT}" font-size="11" font-weight="bold" text-anchor="middle" fill="#f0dc82">{$stationName}</text>
                                ),

                                for $pos2 in 1 to $numStations2
                                let $station2 := $stations2[$pos2]
                                let $stationName2 := data($station2/@name)
                                let $circleX2 := if ($numStations2 = 1) then $lineStart2
                                else $lineStart2 + (($lineLength2 * ($pos2 - 1)) div ($numStations2 - 1))
                                return (
                                    <circle cx="{$circleX2}" cy="{$inverseL}" r="7" fill="#f0dc82"/>,
                                    <text x="{$circleX2}" y="{$inverseT2}" font-size="11" font-weight="bold" text-anchor="middle" fill="#f0dc82">{$stationName2}</text>
                                ),

                                for $pos3 in 1 to $numStations3
                                let $station3 := $stations3[$pos3]
                                let $stationName3 := data($station3/@name)
                                let $circleX3 := if ($numStations3 = 1) then $lineStart3
                                else $lineStart3 + (($lineLength3 * ($pos3 - 1)) div ($numStations3 - 1))
                                return (
                                    <circle cx="{$circleX3}" cy="{$inverseL}" r="7" fill="#f0dc82"/>,
                                    <text x="{$circleX3}" y="{$inverseT3}" font-size="11" font-weight="bold" text-anchor="middle" fill="#f0dc82">{$stationName3}</text>
                                ),

                                for $pos4 in 1 to $numStations4
                                let $station4 := $stations4[$pos4]
                                let $stationName4 := data($station4/@name)
                                let $circleX4 := if ($numStations4 > 0) then $lineStart4
                                else $lineStart4 + (($lineLength4 * ($pos4 - 1)) div ($numStations4 - 1))
                                return (
                                    <circle cx="{$circleX4}" cy="{$inverseL}" r="7" fill="#f0dc82"/>,
                                    <text x="{$circleX4}" y="{$inverseT4}" font-size="11" font-weight="bold" text-anchor="middle" fill="#f0dc82">{$stationName4}</text>
                                )
                            }
                        </g>
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