class ContactController < ApplicationController
	
  def index
    @page = Page.where(:status => 'Enabled').order("display_order ASC")
  end

  def create   
    @contact = Contact.new(testi_params)   
    if @contact.save 
      ContactMailer.welcome_email(@contact).deliver    
      redirect_to contact_index_path, notice: "Message received" 
    else   
      flash[:error] = 'Failed to edit About!'   
      render :new   
    end   
  end
  def testi_params   
    params.require(:contact).permit(:name, :email_field, :phone_number, :message)   
  end  
end