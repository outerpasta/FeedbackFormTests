var elem = document.getElementsByClassName("col-xs-2 newsletter")[0]
var link = elem.getElementsByTagName("a")[0]
var color = window.getComputedStyle(link, null).getPropertyValue("color");
return color;