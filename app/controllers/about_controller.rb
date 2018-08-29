class AboutController < ApplicationController
  before_action :authenticate_user!

  def index
    @about = About.all
             .order("display_order desc")
  end
  def show
    @about = About.find(params[:id])
  end
  def create   
    @about = About.new(testi_params)   
    if @about.save   
      flash[:notice] = 'About added!'   
      redirect_to about_index_path  
    else   
      flash[:error] = 'Failed to edit About!'   
      render :new   
    end   
  end 
  def edit
  @about = About.find(params[:id])
 end 
   
  # PUT method for updating in database a product based on id   
  def update   
    @about = About.find(params[:id])   
    if @about.update_attributes(testi_params)   
      flash[:notice] = 'About updated!'   
      redirect_to about_index_path   
    else   
      flash[:error] = 'Failed to edit About!'   
      render :edit   
    end   
  end 
  def change 
     @obj_ids  = About.find(params[:id])
     @obj_ids.each do |p|
     p.update_attributes(:status => params[:status]) 
        end
        flash[:notice] = 'About updated!'
     redirect_to about_index_path  
  end 
  def destroy   
    @about = About.find(params[:id])   
    if @about.delete   
      flash[:notice] = 'User deleted!'   
      redirect_to about_index_path   
    else   
      flash[:error] = 'Failed to delete this User!'   
      render :destroy   
    end   
  end
  def testi_params   
    params.require(:about).permit(:title, :description, :display_order, :status)   
  end 
end  