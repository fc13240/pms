var formutil = formutil || {}

formutil.clickAllCheckbox = function(allCheckboxSelector, itemCheckboxSelector) {
	$(allCheckboxSelector).click(function() {
		var checked = $(this).prop("checked");
		
		if (checked) {
			$(itemCheckboxSelector).each(function() {
				$(this).prop("checked", true);
			});
		} else {
			$(itemCheckboxSelector).each(function() {
				$(this).prop("checked", false);
			});
		}
	})
}

formutil.clickItemCheckbox = function(allCheckboxSelector, itemCheckboxSelector) {
	$(itemCheckboxSelector).click(function() {
		var allChecked = true;
		var itemCheckboxes = $(itemCheckboxSelector);
		
		if ($(this).checked) {
			for (var i = 0; i < itemCheckboxes.length; i++) {
				if (!itemCheckboxes[i].checked) {
					allChecked = false;
					break;
				}
			}			
		} else {
			allChecked = false;
		}
		
		if (allChecked) {
			$(allCheckboxSelector).prop("checked", true);
		} else {
			$(allCheckboxSelector).prop("checked", false);
		}
	});		
}

formutil.anyCheckboxItemSelected = function(itemCheckboxSelector) {
	var itemSelected = false;
	
	var itemCheckboxes = $(itemCheckboxSelector);
	for (var i = 0; i < itemCheckboxes.length; i++) {
		if (itemCheckboxes[i].checked) {
			itemSelected = true;
			break;
		}
	}	
		
	return itemSelected;
}

formutil.getAllCheckedCheckboxValues = function(itemCheckboxSelector, attr) {
	var attr_values = [];
	
	var itemCheckboxes = $(itemCheckboxSelector);
	for (var i = 0; i < itemCheckboxes.length; i++) {
		if (itemCheckboxes[i].checked) {
			attr_values.push(itemCheckboxes[i].getAttribute(attr));
		}
	}	
	
	return attr_values;
}

formutil.getAllCheckboxValues = function(itemCheckboxSelector, attr) {
	var attrValues = [];
	
	var itemCheckboxes = $(itemCheckboxSelector);
	for (var i = 0; i < itemCheckboxes.length; i++) {
		attrValues.push(itemCheckboxes[i].getAttribute(attr));
	}	
	
	return attrValues;
}

formutil.removeDuplicate = function(valueArray) {
	var resultValues = [];
	
	for (var i = 0; i < valueArray.length; i++) {
		if ($.inArray(valueArray[i], resultValues) == -1) {
			resultValues.push(valueArray[i]);
		}
	}	
	
	return resultValues;
}

formutil.alertMessage = function(message, needReload) {
	needReload = needReload || false;
	
	$("<div>" + message + "</div>").dialog({
		modal: true,
		buttons: {
			Ok: function() {
				$(this).dialog("close");
				if (needReload) {
					location.reload();
				}
			}
		}	
	});		
}

formutil.setElementValue = function(elemSelector, value) {
	$(elemSelector).val(value);	
}