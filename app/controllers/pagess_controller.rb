class PagessController < ApplicationController
  before_action :authenticate_user!

  def index
    @page = Page.all
             .order("display_order desc")
  end
  def show
    @page = Page.find(params[:id])
  end
  def create   
    @page = Page.new(user_paramss)   
    if @page.save   
      flash[:notice] = 'Page added!'   
      redirect_to pagess_index_path  
    else   
      flash[:error] = 'Failed to edit Page!'   
      render :new   
    end   
  end 
  def edit
  @page = Page.find(params[:id])
 end 
   
  # PUT method for updating in database a product based on id   
  def update   
    @page = Page.find(params[:id])   
    if @page.update_attributes(user_params)   
      flash[:notice] = 'Page updated!'   
      redirect_to pagess_index_path    
    else   
      flash[:error] = 'Failed to edit Page!'   
      render :edit   
    end   
  end 
  def change 
     @obj_ids  = Page.find(params[:id])
     @obj_ids.each do |p|
     p.update_attributes(:status => params[:status]) 
        end
        flash[:notice] = 'Page updated!'
     redirect_to pagess_index_path  
  end 
  def destroy   
    @page = Page.find(params[:id])   
    if @page.delete   
      flash[:notice] = 'User deleted!'   
      redirect_to pagess_index_path	   
    else   
      flash[:error] = 'Failed to delete this User!'   
      render :destroy   
    end   
  end
  def user_params   
    params.require(:page).permit(:title, :pages, :url, :status, :display_order, :created_at, :updated_at)   
  end 
  def user_paramss  
    params.require(:pages).permit(:title, :pages, :url, :status, :display_order, :created_at, :updated_at)   
  end
end  