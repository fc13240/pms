function setPageSize() {
	pageSize = $("#pageSizeSelect").val();
	
	$.ajax({
		url: "/setpagesize/?page_size=" + pageSize, 
		type: 'get', 
		success: function() {
			location.reload();
		}
	});		
}