window.getCSSValue = function (attr, className, tags) {
    var element = document.getElementsByClassName(className)[0];
    if (tags) {
        element = element.getElementsByTagName(tags)[0];
    }
	var value = window.getComputedStyle(element, null).getPropertyValue(attr);
	return value;	
}

window.getCSSValueForTags = function (attr, tags) {
    var elements = []
    for (var i = 0; i < tags.length; i++) { 
        Array.prototype.push.apply(elements, document.getElementsByTagName(tags[i]));
    }
    var values = {};
    for (var i = 0; i < elements.length; i++) {
        values[window.getComputedStyle(elements[i], null).getPropertyValue(attr)] = undefined;   
    }
	return Object.keys(values);	
}
