declare variable $numBranches := 4;

declare variable $branchSpacer := 100;

declare variable $bigCircleExtraSpacer := 50;

declare variable $branchLen := 600;

declare variable $xShift := 100;
declare variable $yShift := 200;


declare variable $mainLen := $numBranches * $branchSpacer + $bigCircleExtraSpacer;


<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {$branchLen + $xShift + 50} {$mainLen + $yShift
+ 50}" width="100%" height="100%">
    <desc>Example railroad line with branching paths and stations.</desc>
    <g alignment-baseline="baseline" transform="translate({$xShift}, {$yShift})">
        <text x="{$branchLen div 2}" y="-150" font-size="48" text-anchor="middle">Pennsylvania Railroad</text>
        
        <text x="0" y="-60" font-size="36" text-anchor="middle">Start</text>
        
        <circle cx="0" cy="0" r="40"/>
        <line x1="0" x2="0" y1="0" y2="{$mainLen}" stroke="black" stroke-width="10"/>
        
        <g transform="translate(0, {$bigCircleExtraSpacer})">                
            {
                for $branchNum in 1 to $numBranches
                    let $branchY := $branchSpacer * $branchNum
                    
                    return
                    <g transform="translate(0, {$branchY})">
                        <circle cx="0" cy="0" r="20"/>
                        <text x="20" y="-20" font-size="25" font-weight="bold"
                        text-anchor="start">B{$branchNum}</text>
                        
                        <line x1="0" x2="{$branchLen}" y1="0" y2="0" stroke="black" stroke-width="5"/>
                        
                        {
                            let $firstCircleX := xs:integer($branchLen div $branchNum)
                            
                            for $circleX in $firstCircleX to $branchLen
                                where $circleX mod $firstCircleX = 0
                                
                                let $circleNum := $circleX div $firstCircleX
                                
                                return
                                <g transform="translate({$circleX}, 0)">
                                    <circle cx="0" cy="0" r="10"/>
                                    <text x="0" y="-20" font-size="16" font-weight="bold"
                                    text-anchor="middle">S{$circleNum}</text>
                                </g>
                        }
                    </g>
            }
        </g>
    </g>
</svg>