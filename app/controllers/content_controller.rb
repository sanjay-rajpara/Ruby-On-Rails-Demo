class ContentController < ApplicationController
  before_action :authenticate_user!

  def index
    @content = Content.all
  end
  def show
    @content = Content.find(params[:id])
  end
  def create   
    @content = Content.new(testi_params)   
    if @content.save   
      flash[:notice] = 'Content added!'   
      redirect_to content_index_path  
    else   
      flash[:error] = 'Failed to edit Content!'   
      render :new   
    end   
  end 
  def edit
  @content = Content.find(params[:id])
 end 
   
  # PUT method for updating in database a product based on id   
  def update   
    @content = Content.find(params[:id])   
    if @content.update_attributes(testi_params)   
      flash[:notice] = 'Content updated!'   
      redirect_to content_index_path   
    else   
      flash[:error] = 'Failed to edit Content!'   
      render :edit   
    end   
  end 
  def change 
     @obj_ids  = Content.find(params[:id])
     @obj_ids.each do |p|
     p.update_attributes(:status => params[:status]) 
        end
        flash[:notice] = 'Content updated!'
     redirect_to content_index_path  
  end 
  def destroy   
    @content = Content.find(params[:id])   
    if @content.delete   
      flash[:notice] = 'User deleted!'   
      redirect_to content_index_path   
    else   
      flash[:error] = 'Failed to delete this User!'   
      render :destroy   
    end   
  end
  def testi_params   
    params.require(:content).permit(:url_key, :title, :content, :display_order, :status)   
  end 
end  