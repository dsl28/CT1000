(: AZ: This file makes an SVG that plots the path and branches of an example railroad.
There's a starting point on top as a big circle, a "main track" as a vertical line extending
downwards from the starting point, and "branches" extending off the side of the main vertical as horizontal
lines. The branch beginnings are marked on the main vertical as slightly smaller circles.
Each branch has circles on it representing stations or stop points (I don't know railroads
that well) that are equally spaced apart. So you can change the numbers (global variables) below and
the XQuery figures the rest out.
One caveat with this code is it doesn't factor in the radii of the circles in things like the
viewBox and total size. The numbers related to radii are just added to the SVG output directly. Also
things like font sizes are coded directly into the SVG as well.
:)


(: AZ: Number of branches to draw :)
declare variable $numBranches := 4;

(: AZ: How far apart (vertically) branches should be from one another :)
declare variable $branchSpacer := 100;

(: AZ: Set to zero if you don't want to add any extra space between the big circle on top and the
first branch. Useful if you make $branchSpacer small so the branches are more crunched together, so they
don't overlap with the starting circle on top. :)
declare variable $bigCircleExtraSpacer := 50;

(: AZ: Total length of the branch (horizontal) lines. :)
declare variable $branchLen := 600;

(: AZ: How much to shift everything (horizontally and vertically) from (0, 0) :)
declare variable $xShift := 100;
declare variable $yShift := 200;


(: AZ: Total length of the main (vertical) line. Not meant to be changed. :)
declare variable $mainLen := $numBranches * $branchSpacer + $bigCircleExtraSpacer;


(: AZ: I have never completely figured out how "viewBox" works, even after two semesters of making SVGs.
    From what I understand, the browser lets you zoom in and scroll around when you set "viewBox" only if the
    width and height you give are larger than the greatest x,y coordinate of the entire graph.
    So I add the lengths of the branch and main lines by how much I shifted the entire plot, then
    add a little extra to make sure the circles at the ends of the branch and main lines aren't cut off.
:)
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {$branchLen + $xShift + 50} {$mainLen + $yShift
+ 50}" width="100%" height="100%">
    <desc>Example railroad line with branching paths and stations.</desc>
    <!-- AZ: Group the entire network, for shifting it. -->
    <g alignment-baseline="baseline" transform="translate({$xShift}, {$yShift})">
        <!-- AZ: Text above the graph itself, centered horizontally. -->
        <text x="{$branchLen div 2}" y="-150" font-size="48" text-anchor="middle">Pennsylvania Railroad</text>
        
        <!-- AZ: Text indicating the start of the graph -->
        <text x="0" y="-60" font-size="36" text-anchor="middle">Start</text>
        
        <!-- AZ: Circle on top starting the main line -->
        <circle cx="0" cy="0" r="40"/>
        <!-- AZ: Main line going down from its starting circle -->
        <line x1="0" x2="0" y1="0" y2="{$mainLen}" stroke="black" stroke-width="10"/>
        
        <!-- AZ: Push the branches downwards a bit -->
        <g transform="translate(0, {$bigCircleExtraSpacer})">                
            {
                (: AZ: Make a new group for each branch via a for loop. Makes handling (x, y) coordinates a lot
                simpler for positioning everything within the branches. :)
                for $branchNum in 1 to $numBranches
                    (: AZ: The current for loop value converted to the y-coordinate of the branch line :)
                    let $branchY := $branchSpacer * $branchNum
                    
                    return
                    <g transform="translate(0, {$branchY})">
                        <!-- AZ: Circle indicating the start of the branch on the main branch line -->
                        <circle cx="0" cy="0" r="20"/>
                        <!-- AZ: Large bold text next to the above circle, anchored so that the (x, y)
                        coordinates position the left end of the text, not its middle. -->
                        <text x="20" y="-20" font-size="25" font-weight="bold"
                        text-anchor="start">B{$branchNum}</text>
                        
                        <!-- AZ: Branch line -->
                        <line x1="0" x2="{$branchLen}" y1="0" y2="0" stroke="black" stroke-width="5"/>
                        
                        <!-- AZ: Circles on the branch line and their text -->
                        {
                            (: AZ: The x-coordinate of the first circle to add to the branch line.
                                Round down to the nearest integer (floor function in math) so the for loop below can run. :)
                            let $firstCircleX := xs:integer($branchLen div $branchNum)
                            
                            (: AZ: Put each station circle in its own group via a for loop. Makes
                            positioning things easier :)
                            for $circleX in $firstCircleX to $branchLen
                                (: AZ: The way I have this set up is that the branch circles
                                (stations) are spaced equally apart. This means that each circle's x-coordinate is
                                always a multiple of the first circle's x-coordinate, including the
                                circle at the end of the branch line.
                                "mod" is a math function to get the remainder after dividing two
                                numbers. If it gives zero, the first number ($circleX) is a multiple of
                                the second number ($firstCircleX). :)
                                where $circleX mod $firstCircleX = 0
                                
                                (: AZ: Whether we're on the first circle, the second, etc. Used for
                                the text put above the circles. :)
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