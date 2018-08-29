
function AccountValidator()
{
// build array maps of the form inputs & control groups //

	this.formFields = [ $('#url-tf'), $('#order-tf')];
	this.controlGroups = [ $('#url-cg'), $('#order-cg')];
	
// bind the form-error modal window to this controller to display any errors //
	
	this.alert = $('.modal-form-errors');
	this.alert.modal({ show : false, keyboard : true, backdrop : true });
	
	this.validateName = function(s)
	{
        
		return s.length >= 3;

	}
	
	this.validatePassword = function(s)
	{
	 return s.length >= 1;

	}
	
	this.showErrors = function(a)
	{
		$('.modal-form-errors .modal-body p').text('Please correct the following problems :');
		var ul = $('.modal-form-errors .modal-body ul');
			ul.empty();
		for (var i=0; i < a.length; i++) ul.append('<li>'+a[i]+'</li>');
		this.alert.modal('show');

	}
    /*this.showColor = function(b)
	{
		$('.modal-form-errors .modal-body p').border('');
		var ul = $('.modal-form-errors .modal-body ul');
			ul.empty();
		for (var i=0; i < b.length; i++) ul.append('<li>'+b[i]+'</li>');
		this.alert.modal('show');
	}*/
}

AccountValidator.prototype.showInvalidEmail = function()
{
	this.controlGroups[1].addClass('error');
	this.showErrors([' Description is a required field.']);
	//this.showColor();
}

AccountValidator.prototype.showInvalidURL = function()
{
	this.controlGroups[2].addClass('error');
	this.showErrors(['URL is a required field.']);
	//this.showColor();
}

AccountValidator.prototype.validateForm = function()
{
	var e = [];
	for (var i=0; i < this.controlGroups.length; i++) this.controlGroups[i].removeClass('error');

	
	if (this.validateName(this.formFields[0].val()) == false) {
		this.controlGroups[0].addClass('error');
		e.push('URL is a required field');
		//this.showColor();
	}
	if (this.validatePassword(this.formFields[1].val()) == false) {
		this.controlGroups[1].addClass('error');
		e.push('Dispaly Order is a required field');
		//this.showColor();
	}
	if (e.length) this.showErrors(e);
	return e.length === 0;
}

	