xquery version "3.1";
declare option saxon:output "method=text";

declare variable $source-files:=('..xml/CT1000.xml/?select*.xml');
declare variable $industry-type := //entry[location/@itype="coal"];
declare variable $industry-type-count := $industry-type => count();
declare variable $location :=//entry/location;

let $industry-type := $source-files//entry[location/@itype="coal"]
let $industry-type-count := $location => count()
return (concat ("In the PRR's 1945 CT1000", $industry-type-count," coal industries are listed."))