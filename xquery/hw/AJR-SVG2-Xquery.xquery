 declare variable $source-files:=('..xml/CT1000.xml/?select=*.xml');
    declare variable $industries := //location[@type="industry"];
    declare variable $xspace := 20;
    declare variable $yspace := 20;
 
<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%">
    <g alignment-baseline="baseline" transform="translate(300,300)">
    </g>
     <g>
        <!-- heading -->
        <text x="500" y="100" font-size="30px"  fill="black">Industries by type</text>  
    
    </g>
    <g>
        {
       
        for $industry at $position in $industries
        let $industry-type-count:= $industry/data(@itype)=>count()
        return
        <g>
    <text x="-75" y="{$position * $yspace + 5}" font-size="15px" fill="black">{$industry}</text>
    <line x1="0" y1="{$position * $yspace}" x2="{$industry-type-count * $xspace}" y2="{$position * $yspace}" stroke="red" stroke-width="15"/>
    <text x="{$industry-type-count * $xspace + 10}" y="{$position * $yspace + 5}" font-size="15px" fill="black">{$industry-type-count}</text>
    <line x1="0" y1="0" x2="0" y2="{max($position +1) * $yspacer}" stroke="black" stroke-width="2"/>
    }
    
    
    </g>
    </g>
    
</svg>