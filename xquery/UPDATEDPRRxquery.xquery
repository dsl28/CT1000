declare variable $numBranches := 68;
declare variable $branchLen := 600;
declare variable $branchSpacer := 100;
declare variable $bigCircleExtraSpacer := 100;
declare variable $mainLen := $numBranches * $branchSpacer + $bigCircleExtraSpacer;
declare variable $xShift := 100;
declare variable $yShift := 200;

<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
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
                    let $branchName := /CT1000//branch/data(@name)
                    
                    return
                    <g transform="translate(0, {$branchY})">
                        <circle cx="555" cy="0" r="9"/>
                        <text x="575" y="-20" font-size="25" font-weight="bold"
                        text-anchor="start">{$branchName}</text>
                        
                        <line x1="555" x2="{555 + $branchLen}" y1="0" y2="0" stroke="black" stroke-width="5"/>
                        
                        {
                            let $firstCircleX := xs:integer($branchLen div $branchNum)
                            
                            for $circleX in $firstCircleX to $branchLen
                                where $circleX mod $firstCircleX = 0
                                
                                let $circleNum := $circleX div $firstCircleX
                                
                                return
                                <g transform="translate({$circleX}, 0)">
                                    <circle cx="555" cy="0" r="7"/>
                                    <text x="555" y="-20" font-size="16" font-weight="bold"
                                    text-anchor="middle">S{$circleNum}</text>
                                </g>
                        }
                    </g>
            }
        </g>
    </g>
</svg>