xquery version "3.1";
declare option saxon:output "method=html";
declare option saxon:output "doctype-system=about:legacy-compat";
declare variable $source-files:=doc('../xml/CT1000_XML.xml');
declare variable $industries := $source-files//location[@type="industry"];
declare variable $xspace := 20;
declare variable $yspace := 20;

<html>
    <head>
        <title>Industries Graph</title>
    </head> 
 
 
    <body>
    <p> A graph illistrating the rail-served industries along the Pennsylvania Railroad's Pittsburgh division (circa 1945).
    This graph is grouped by type and thus shows an intersting visual on a slice of the wide variety of types of industry 
    that were present in western Pennsylvania at the peak of its industrial might. As well as the variety, it also shows 
    visually how large the presence of each industry was. </p>
    
    <h1>The Graph:</h1>
    
 
        
        <svg >
            <g transform="translate(300,300)">
                <g>
                    <!-- heading -->
                    <text x="500" y="0" font-size="30px"  fill="#f0dc82">Industries by type</text>  
                    
                </g>
                <g>
                    {
                    
                 (:   for $industry at $position in $industries
                    let $industry-type-count:= $industry/data(@itype)=>count()
                    group by $industry-type := //location/@itype=>data()  :)
                    
                    let $industry-types := $industries/@itype=>data()=>distinct-values()
                    for $industry-type at $position in $industry-types
                        let $industry-type-count := $industries[@itype=>data() = $industry-type]=>count()
                    
                    
                    return
                    
                    <g>
                   
                        <text x="-75" y="{$position * $yspace + 5}" font-size="15px" fill="#f0dc82">{$industry-type}</text> 
                        <line x1="0" y1="{$position * $yspace}" x2="{$industry-type-count * $xspace}" y2="{$position * $yspace}" stroke="red" stroke-width="15"/>
                        <text x="{$industry-type-count * $xspace + 10}" y="{$position * $yspace + 5}" font-size="15px" fill="#f0dc82">{$industry-type-count}</text>
                        <line x1="0" y1="0" x2="0" y2="{max($position +1) * $yspace}" stroke="black" stroke-width="2"/>  
                       
                    </g>
                    }
                </g>
            </g>
        </svg>
        
        
        
        
    </body>
</html>