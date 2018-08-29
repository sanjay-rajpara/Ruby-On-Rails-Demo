
function AccountValidator()
{
// build array maps of the form inputs & control groups //

	this.formFields = [$('#name-tf'), $('#email-tf'), $('#pass-tf'),$('#role-tf'),$('#status-tf')];
	this.controlGroups = [$('#name-cg'), $('#email-cg'), $('#user-cg'), $('#pass-cg'),$('#role-cg'),$('#status-cg')];
	
// bind the form-error modal window to this controller to display any errors //
	
	this.alert = $('.modal-form-errors');
	this.alert.modal({ show : false, keyboard : true, backdrop : true });
	
	this.validateName = function(s)
	{
        
		return s.length >= 3;

	}
	this.validateRole = function(s)
	{
		var roleselect = $("#role-tf");
            if (roleselect.val() == "-- Please Select --") {
                
                return false;
            }
            return true;
	}
	this.validatePassword = function(s)
	{
	// if user is logged in and hasn't changed their password, return ok
		if ($('#userId').val() && s===''){
			return true;
		}	else{
			return s.length >= 6;
		}
	}
	this.validateEmail = function(e)
	{
		var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		return re.test(e);
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
	this.showErrors([' Email is a required field.']);
	//this.showColor();
}

AccountValidator.prototype.showInvalidUserName = function()
{
	this.controlGroups[2].addClass('error');
	this.showErrors(['Username is a required field.']);
	//this.showColor();
}
AccountValidator.prototype.showInvalidRole = function()
{
	this.controlGroups[4].addClass('error');
	this.showErrors(['Role is a required field.']);
	//this.showColor();
}

AccountValidator.prototype.validateForm = function()
{
	var e = [];
	for (var i=0; i < this.controlGroups.length; i++) this.controlGroups[i].removeClass('error');
	if (this.validateName(this.formFields[0].val()) == false) {
		this.controlGroups[0].addClass('error'); e.push('Name is a required field');
		//this.showColor();
	}

	if (this.validateEmail(this.formFields[1].val()) == false) {
		this.controlGroups[1].addClass('error'); e.push('Email is a required field');
		//this.showColor();
	}
	if (this.validateName(this.formFields[3].val()) == false) {
		this.controlGroups[3].addClass('error');
		e.push('Role is a required field');
		//this.showColor();
	}
	if (this.validatePassword(this.formFields[2].val()) == false) {
		this.controlGroups[2].addClass('error');
		e.push('Password is a required field');
		//this.showColor();
	}
	if (e.length) this.showErrors(e);
	return e.length === 0;
}

	