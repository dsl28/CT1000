declare variable $numBranches := 39;
declare variable $branchLen := 600;
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
        <circle cx='555' cy='110' r="10"  stroke-width='5' stroke='black'></circle>
        <line x1="555" x2="555" y1="110" y2="{$mainLen}" stroke="black" stroke-width="5"/>
        <g transform="translate(0, {$bigCircleExtraSpacer})">                
            {
                for $branchNum in 1 to $numBranches
                    let $branchY := $branchSpacer * $branchNum
                    let $branchName := //Q{}CT1000/Q{}branch[position()=$branchNum]/data(@name)
                    
                    return
                    <g transform="translate(0, {$branchY})">
                        <circle cx="555" cy="0" r="9"/>
                        <text x="520" y="5" font-size="20" font-weight="bold"
                        text-anchor="end">{$branchName}</text>
                        
                        <line x1="555" x2="{555 + $branchLen}" y1="0" y2="0" stroke="black" stroke-width="5"/>
                        {
                            let $countStation := count(//Q{}CT1000/Q{}branch[data(@name)=$branchName]/Q{}entry/Q{}location[data(@type="station")]) (:whc: there was an error here: inadequate predicate:)
                            
                            return
                            if ($countStation eq 0) then ()
                            else
                            let $firstCircleX := xs:integer(round-half-to-even($branchLen div $countStation)) 
                            (:whc: I don't know why but it required both rounding to a whole number AND then casting it to an integer--but it took care of that math error message :)
                            for $circleX in $firstCircleX to $branchLen
                                where $circleX mod $firstCircleX = 0
                                let $circleNum :=$countStation
                                let $stationName := //Q{}branch[data(@name)=$branchName]/Q{}entry/Q{}location[data(@type="station")]/data(@name) (:whc: the xpath just went down to station; it needed that in a predicate; it also needed to start with another predicate on branch to map to the branch with the name we're on right now; and then to step down to the name of the station in question :)
                            
                                return
                                <g transform="translate({$circleX}, 0)">
                                    <circle cx="555" cy="0" r="7"/>
                                    <text x="555" y="-20" font-size="16" font-weight="bold"
                                    text-anchor="middle">{$stationName}{$circleNum}</text>
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