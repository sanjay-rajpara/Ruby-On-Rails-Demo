
function AccountValidator()
{
// build array maps of the form inputs & control groups //

	this.formFields = [$('#title-tf'), $('#desc-tf'), $('#desg-tf'), $('#order-tf'),$('#sta-tf')];
	this.controlGroups = [$('#title-cg'), $('#desc-cg'), $('#order-cg'),$('#sta-cg')];
	
// bind the form-error modal window to this controller to display any errors //
	
	this.alert = $('.modal-form-errors');
	this.alert.modal({ show : false, keyboard : true, backdrop : true });
	
	
	
	this.validatetitle = function(s)
	{
	 return s.length >= 1;

	}
	
	this.validatedesc = function(s)
	{
        
		return s.length >= 1;

	}
	this.validatedesg = function(s)
	{
        
		return s.length >= 1;

	}
	this.validateorder = function(s)
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



AccountValidator.prototype.validateForm = function()
{
	var e = [];
	for (var i=0; i < this.controlGroups.length; i++) this.controlGroups[i].removeClass('error');
	if (this.validatetitle(this.formFields[0].val()) == false) {
		this.controlGroups[0].addClass('error'); e.push('Name is a required field');
		//this.showColor();
	}
	if (this.validatedesg(this.formFields[2].val()) == false) {
		this.controlGroups[2].addClass('error');
		e.push('Designation is a required field');
		//this.showColor();
	}
	if (this.validateorder(this.formFields[3].val()) == false) {
		this.controlGroups[3].addClass('error');
		e.push('Dispaly Order is a required field');
		//this.showColor();
	}
	if (e.length) this.showErrors(e);
	return e.length === 0;
}

	