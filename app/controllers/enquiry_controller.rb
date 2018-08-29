class EnquiryController < ApplicationController
	
  def index
    @contact = Contact.all
  end
  def edit
  @contact = Contact.find(params[:id])
 end 
 def update   
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(testi_params )   
      flash[:notice] = 'Config updated!'   
      redirect_to enquiry_index_path   
    else   
      flash[:error] = 'Failed to edit Config!'   
      render :edit   
    end   
  end 
  def create   
    @contact = Contact.new(testi_params)   
    if @contact.save     
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