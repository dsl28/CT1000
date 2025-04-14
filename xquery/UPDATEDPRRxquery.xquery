declare variable $numBranches := 39;
declare variable $branchLen := 950;
declare variable $branchSpacer := 100;
declare variable $bigCircleExtraSpacer := 100;
declare variable $mainLen := $numBranches * $branchSpacer + $bigCircleExtraSpacer;
declare variable $xShift := 100;
declare variable $yShift := 200;

<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1500 4180">>
    <desc></desc>
    <g alignment-baseline="baseline" transform="translate(200,0)">
        <text x='170' y='50' font-size="40">The Pennsylvania Railroad: Pittsburgh Division</text>
        <line x1='155' y1='62.6' x2='953' y2='62.6' stroke-width='3' stroke='black'></line>
        <circle cx='165' cy='110' r="10"  stroke-width='5' stroke='black'></circle>
        <line x1="165" x2="165" y1="110" y2="{$mainLen}" stroke="black" stroke-width="5"/>
        <g transform="translate(0, {$bigCircleExtraSpacer})">                
            {
                for $branchNum in 1 to $numBranches
                    let $branchY := $branchSpacer * $branchNum
                    let $branchName := //Q{}CT1000/Q{}branch[position()=$branchNum]/data(@name)
                    
                    return
                    <g transform="translate(0, {$branchY})">
                        <circle cx="165" cy="0" r="9"/>
                        <text x="140" y="5" font-size="20" font-weight="bold"
                        text-anchor="end">{$branchName}</text>
                        
                        <line x1="165" x2="{$branchLen}" y1="0" y2="0" stroke="black" stroke-width="5"/>
                        {
                            let $stations := //Q{}branch[data(@name)=$branchName]/Q{}entry/Q{}location[data(@type="station")]
                            let $numStations := count($stations)
                            let $lineStart := 255
                            let $lineEnd := $branchLen
                            let $lineLength := $lineEnd - $lineStart
                            let $firstCircleX := xs:integer(round-half-to-even($branchLen div $numStations))

                            for $pos in 1 to $numStations
                                let $station := $stations[$pos]
                                let $stationName := data($station/@name)
                                let $circleX := if ($numStations = 1) then $lineStart
                                else $lineStart + (($lineLength * ($pos - 1)) div ($numStations - 1))

                                return
                                <g>
                                    <circle cx="{$circleX}" cy="0" r="7"/>
                                    <text x="{$circleX}" y="-20" font-size="12" font-weight="bold" text-anchor="middle">{$stationName}</text>
                                </g>
                        }
                    </g>
            }
        </g>
    </g>
</svg>

(: return
                    <g transform="translate(0, {$branchY})">
                        <circle cx="555" cy="0" r="9"/>
                        <text x="520" y="5" font-size="20" font-weight="bold"
                        text-anchor="end">{$branchName}</text>
                        
                        <line x1="555" x2="{555 + $branchLen}" y1="0" y2="0" stroke="black" stroke-width="5"/>
                        
                        {
                            let $firstCircleX := xs:integer($branchLen div $branchNum)
                            
                            for $circleX in $firstCircleX to $branchLen
                                where $circleX mod $firstCircleX = 0
                                
                                let $circleNum := count(/Q{}CT1000/Q{}branch/Q{}location/data(@type="station"))
                                let $stationName := /Q{}CT1000/Q{}branch/Q{}location/data(@type="station")
                            
                                return
                                <g transform="translate({$circleX}, 0)">
                                    <circle cx="555" cy="0" r="7"/>
                                    <text x="555" y="-20" font-size="16" font-weight="bold"
                                    text-anchor="middle">{$stationName}{$circleNum}</text>
                                </g>
                                :)