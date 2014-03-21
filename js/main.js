
function showMessage(message, button) {
	$(message).slideDown(1000);
	$(button).prop("disabled", true);
}

function hideMessage(message, button) {
	$(message).slideUp(1000);
	
	if($(button).hasClass("cancel")) {
		$(message.closest('.job_listing').find('.job_apply')).prop("disabled", false);
	}
}