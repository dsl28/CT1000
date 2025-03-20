
declare variable $data := collection('/Users/maris/Desktop/github/CT1000/xml/?select=CT1000_XML.xml');

(: For clause picking the document :)
for $entry in $data//CT1000//entry[location/@itype = "coal"]

(: Let clause making it into a number:)
let $distance := xs:decimal($entry/distance/@milepost)

(: Where clause flitering out everything that is not wanted :)
where $distance <= 20.0 and matches($entry/switch/@number, "^3[0-9]{2}$")

(: Order by clause makes it ascending :)
order by $distance ascending

(: Return clause :)
return <coal-industry>
    <name>{$entry/location/@name/string()}</name>
    <switch-number>{$entry/switch/@number/string()}</switch-number>
    <distance-from-altoona>{$distance}</distance-from-altoona>
    <location-type>{$entry/location/@type/string()}</location-type>
    </coal-industry>

(:<html>
<head>
<title>hold title</title>
</head>

<body> 
<h1> heading </h1>
<table border="1">
      <tr>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
      </tr>
      {
        for 
        for 
        let
        let 
        let)
        return
          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
    return <coal-industry>
    <name>{$entry/location/@name/string()}</name>
    <switch-number>{$entry/switch/@number/string()}</switch-number>
    <distance-from-altoona>{$distance}</distance-from-altoona>
    <location-type>{$entry/location/@type/string()}</location-type>
    </coal-industry>
          </tr>
      }
    </table>
</body>
</html> :)