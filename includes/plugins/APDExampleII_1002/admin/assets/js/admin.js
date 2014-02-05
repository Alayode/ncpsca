function doShowHide( src,tgt ) {
	if ( $("#"+src).is(':checked') ) {
		$("#"+tgt).show();
	}
	else {
		$("#"+tgt).hide();
	}
}

$(document).ready(function() {
	$(":submit","#meld-edit-form").click(function() {
		if ($(this).val() != 'delete') {
			return true;
		}
		else {
			var $dialog = $("<div>" + $(this).attr('data-message') + "</div>");

			$dialog.dialog("destroy");

			$dialog.dialog({
				resizable: false,
				height: 140,
				modal: true,
				dialogClass: 'ui-state-highlight',
				title: $(this).attr('data-title'),
				buttons: {
					"Cancel": function(){
						$(this).dialog('close');
					},
					"Delete": function(){
						$('#btdeleteconfirm').val('delete');
						$('#meld-edit-form').submit();
					}
				}
			});
			return false;
		}
	});
});
