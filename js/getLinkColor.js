var elem = document.evaluate("/html/body/div/header/div/div[3]/a/span", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE,null).singleNodeValue;
var color = window.getComputedStyle(elem, null).getPropertyValue("color");
return color;