
function siteNav() {
var navLinks = [
  ["index.html", "Site Home"],
  ["about.html", "About page"],
  ["graphs.html", "Graphs"],
  ["team.html", "Team"],
  ["map.html", "Map"]
 
];

 var navHTML = '<ul>';
  for (var i = 0; i < navLinks.length; i++) {
    var link = navLinks[i][0];
    var text = navLinks[i][1];
    if (link === currentPage) {
      
      navHTML += '<li id="current">' + text + '</li>';
    } else {
      navHTML += '<li><a href="' + link + '">' + text + '</a></li>';
    }
  }
  navHTML += '</ul>';

  
  var navContainer = document.getElementById("nav");
  if (navContainer) {
    navContainer.innerHTML = navHTML;
  }
}
window.onload = siteNav;