$(document).ready(function(){

	var lv = new LoginValidator();
	var lc = new LoginController();

// main login form //

	$('#new_user').ajaxForm({
		beforeSubmit : function(formData, jqForm, options){
			if (lv.validateForm() == false){
				return false;
			} 	else{
			// append 'remember-me' option to formData to write local cookie //
				formData.push({name:'remember-me', value:$('.button-rememember-me-glyph').hasClass('glyphicon-ok')});
				return true;
			}
		},
		success	: function(xhr, $form){
			if (status == 'success') window.location.href = '/';
		},
		error : function(e){
			lv.showLoginError('Login success');
			window.location.href = '/';
		}
	}); 
	$('#user-tf').focus();
});