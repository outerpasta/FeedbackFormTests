window.getCSSValue = function (attr, className, tags) {
    var element = document.getElementsByClassName(className)[0];
    if (tags) {
        element = element.getElementsByTagName(tags)[0];
    }
	var value = window.getComputedStyle(element, null).getPropertyValue(attr);
	return value;	
}
